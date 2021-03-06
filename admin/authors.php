<?php
/*
$Id: authors.php 1692 2012-02-26 01:26:50Z michael.oscmax@gmail.com $

  osCmax e-Commerce
  http://www.oscmax.com

  Copyright 2000 - 2011 osCmax

  Released under the GNU General Public License
*/

  require('includes/application_top.php');
  
  $action = (isset($_GET['action']) ? $_GET['action'] : '');

  if (tep_not_null($action)) {
    switch ($action) {
      case 'insert':
      case 'save':
        if (isset($_GET['auID'])) $authors_id = tep_db_prepare_input($_GET['auID']);
        $authors_name = tep_db_prepare_input($_POST['authors_name']);

        $sql_data_array = array('authors_name' => $authors_name);

        if ($action == 'insert') {
          $insert_sql_data = array('date_added' => 'now()');

          $sql_data_array = array_merge($sql_data_array, $insert_sql_data);

          tep_db_perform(TABLE_AUTHORS, $sql_data_array);
          $authors_id = tep_db_insert_id();
        } elseif ($action == 'save') {
          $update_sql_data = array('last_modified' => 'now()');

          $sql_data_array = array_merge($sql_data_array, $update_sql_data);

          tep_db_perform(TABLE_AUTHORS, $sql_data_array, 'update', "authors_id = '" . (int)$authors_id . "'");
        }

        $languages = tep_get_languages();
        for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
          $authors_desc_array = $_POST['authors_description'];
          $authors_url_array = $_POST['authors_url'];
          $language_id = $languages[$i]['id'];

          $sql_data_array = array('authors_description' => tep_db_prepare_input($authors_desc_array[$language_id]),
                                  'authors_url' => tep_db_prepare_input($authors_url_array[$language_id]));

          if ($action == 'insert') {
            $insert_sql_data = array('authors_id' => $authors_id,
                                     'languages_id' => $language_id);

            $sql_data_array = array_merge($sql_data_array, $insert_sql_data);

            tep_db_perform(TABLE_AUTHORS_INFO, $sql_data_array);
          } elseif ($action == 'save') {
            tep_db_perform(TABLE_AUTHORS_INFO, $sql_data_array, 'update', "authors_id = '" . (int)$authors_id . "' and languages_id = '" . (int)$language_id . "'");
          }
        }

        if (USE_CACHE == 'true') {
          tep_reset_cache_block('authors');
        }

        tep_redirect(tep_href_link(FILENAME_AUTHORS, (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '') . 'auID=' . $authors_id));
        break;
      case 'deleteconfirm':
        $authors_id = tep_db_prepare_input($_GET['auID']);

        tep_db_query("delete from " . TABLE_AUTHORS . " where authors_id = '" . (int)$authors_id . "'");
        tep_db_query("delete from " . TABLE_AUTHORS_INFO . " where authors_id = '" . (int)$authors_id . "'");

        if (isset($_POST['delete_articles']) && ($_POST['delete_articles'] == 'on')) {
          $articles_query = tep_db_query("select articles_id from " . TABLE_ARTICLES . " where authors_id = '" . (int)$authors_id . "'");
          while ($articles = tep_db_fetch_array($articles_query)) {
            tep_remove_article($articles['articles_id']);
          }
        } else {
          tep_db_query("update " . TABLE_ARTICLES . " set authors_id = '' where authors_id = '" . (int)$authors_id . "'");
        }

        if (USE_CACHE == 'true') {
          tep_reset_cache_block('authors');
        }

        tep_redirect(tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page']));
        break;
    }
  }
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<?php
// BOF: WebMakers.com Changed: Header Tag Controller v1.0
// Replaced by header_tags.php
if ( file_exists(DIR_WS_INCLUDES . 'header_tags.php') ) {
  require(DIR_WS_INCLUDES . 'header_tags.php');
} else {
?> 
  <title><?php echo TITLE ?></title>
<?php
}
// EOF: WebMakers.com Changed: Header Tag Controller v1.0
?>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<link rel="stylesheet" type="text/css" href="includes/javascript/jquery-ui-1.8.2.custom.css">
<!-- CKeditor -->
<script type="text/javascript" src="<?php echo DIR_WS_INCLUDES . 'javascript/ckeditor/ckeditor.js'?>"></script>
<!-- CKeditor End -->
<script type="text/javascript" src="includes/general.js"></script>
<script type="text/javascript"><!--
function popupImageWindow(url) {
  window.open(url,'popupImageWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,width=100,height=100,screenX=150,screenY=150,top=150,left=150')
}
//--></script>
</head>
<body onLoad="SetFocus();">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->
<table border="0" width="100%" cellspacing="2" cellpadding="2">
  <tr>
    <td width="<?php echo BOX_WIDTH; ?>" valign="top"><table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="1" cellpadding="1" class="columnLeft">
<!-- left_navigation //-->
<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
<!-- left_navigation_eof //-->
    </table></td>
<!-- body_text //-->
    <td width="100%" valign="top">
    <table border="0" width="100%" cellspacing="0" cellpadding="2">
<?php
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if ($action == 'new') {
?>
      <tr>
        <td width="100%">
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo TEXT_HEADING_NEW_AUTHOR; ?></td>
            <td class="pageHeading" align="right">&nbsp;</td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
      </tr>
      <tr>
        <td><?php echo tep_draw_form('authors', FILENAME_AUTHORS, 'action=insert', 'post', 'enctype="multipart/form-data"'); ?>
        <table border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td class="main" colspan="2"><?php echo TEXT_NEW_INTRO; ?></td>
          </tr>
          <tr>
            <td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
          </tr>
          <tr>
            <td class="main"><?php echo tep_draw_separator('pixel_trans.gif', '30', '1'); ?><?php echo TEXT_AUTHORS_NAME; ?></td>
            <td class="main"><?php echo tep_draw_separator('pixel_trans.gif', '24', '15') . '&nbsp;' . tep_draw_input_field('authors_name', '', 'size="20"'); ?></td>
          </tr>
          <tr>
            <td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
          </tr>
		  <tr>
            <td colspan="2">
            <!-- // NEW AUTHOR TAB HEADER LOOP START //-->
            <div id="authortabs">
	        <ul>
		      <?php
              $languages = tep_get_languages();
              for ($j=0, $n=sizeof($languages); $j<$n; $j++) {
              ?>
        	    <li><a href="#authortabs-<?php echo $j; ?>"><?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$j]['directory'] . '/images/' . $languages[$j]['image'], $languages[$j]['name']); ?></a></li>
              <?php } ?> 
	        </ul>
            <!-- // NEW AUTHOR TAB HEADER LOOP END //-->

            <?php
            $languages = tep_get_languages();
            for ($i=0, $n=sizeof($languages); $i<$n; $i++) {  //START TAB CONTENTS LOOP
            ?>

	          <div id="authortabs-<?php echo $i; ?>">
		        <table width="100%">
		          <tr>
        	        <td class="main" valign="top"><?php echo TEXT_AUTHORS_DESCRIPTION; ?></td>
		            <?php if (ARTICLE_WYSIWYG_ENABLE == 'Enable') { ?>
                    <td class="main">
            	      <?php
                	  echo (tep_draw_textarea_field('authors_description[' . $languages[$i]['id'] . ']', '100', '20', '', 'class="ckeditor"')); ?>
                    </td>
                    <?php } else { ?>
                    <td class="main" valign="top"><?php echo tep_draw_textarea_field('authors_description[' . $languages[$i]['id'] . ']', '70', '15', ''); ?></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
                  </tr>
                  <tr>
                    <td class="main"><?php echo TEXT_AUTHORS_URL; ?></td>
                    <td class="main"><?php echo tep_draw_input_field('authors_url[' . $languages[$i]['id'] . ']', '', 'size="70"'); ?></td>
                  </tr>
                </table>
	          </div>

            <?php
            } // END TAB CONTENTS LOOP
            ?>
            </div>
		    </td>
          </tr>
	      <tr>
    	    <td class="main">&nbsp;</td>
        	<td class="main" align="right"><?php echo tep_draw_separator('pixel_trans.gif', '24', '15') . '&nbsp;' . tep_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $_GET['auID']) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>'; ?></td>
      	  </tr>
        </table>
      </form>
<?php
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  } elseif ($action == 'edit') {

    $authors_query = tep_db_query("select authors_id, authors_name from " . TABLE_AUTHORS . " where authors_id = '" . $_GET['auID'] . "'");
    $authors = tep_db_fetch_array($authors_query)
?>
    <tr>
      <td width="100%">
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo TEXT_HEADING_EDIT_AUTHOR; ?></td>
            <td class="pageHeading" align="right">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
    </tr>
    <tr>
      <td><?php echo tep_draw_form('authors', FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $authors['authors_id'] . '&amp;action=save', 'post', 'enctype="multipart/form-data"'); ?>
        <table border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td class="main" colspan="2"><?php echo TEXT_EDIT_INTRO; ?></td>
          </tr>
          <tr>
            <td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
          </tr>
          <tr>
            <td class="main"><?php echo TEXT_AUTHORS_NAME; ?></td>
            <td class="main"><?php echo tep_draw_separator('pixel_trans.gif', '24', '15') . '&nbsp;' . tep_draw_input_field('authors_name', $authors['authors_name'], 'size="20"'); ?></td>
          </tr>
          <tr>
            <td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
          </tr>
		  <tr>
            <td colspan="2">
            <!-- // EDIT AUTHOR TAB HEADER LOOP START //-->
            <div id="authortabs">
	        <ul>
		      <?php
              $languages = tep_get_languages();
              for ($j=0, $n=sizeof($languages); $j<$n; $j++) {
              ?>
        	  <li><a href="#authortabs-<?php echo $j; ?>"><?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$j]['directory'] . '/images/' . $languages[$j]['image'], $languages[$j]['name']); ?></a></li>
              <?php } ?> 
	        </ul>
            <!-- // EDIT AUTHOR TAB HEADER LOOP END //-->

            <?php
            $languages = tep_get_languages();
            for ($i=0, $n=sizeof($languages); $i<$n; $i++) {  //START TAB CONTENTS LOOP
            ?>

	          <div id="authortabs-<?php echo $i; ?>">
		        <table width="100%">
		          <tr>
        	        <td class="main" valign="top"><?php echo TEXT_AUTHORS_DESCRIPTION; ?></td>
		            <?php if (ARTICLE_WYSIWYG_ENABLE == 'Enable') { ?>
                    <td class="main">
            	    <?php
					echo (tep_draw_textarea_field('authors_description[' . $languages[$i]['id'] . ']', '100', '20', tep_get_author_description($authors['authors_id'], $languages[$i]['id']), 'class="ckeditor"')); ?></td>
                    <?php } else { ?>
                    <td class="main" valign="top"><?php echo tep_draw_textarea_field('authors_description[' . $languages[$i]['id'] . ']', '70', '15', tep_get_author_description($authors['authors_id'], $languages[$i]['id'])); ?></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
                  </tr>
                  <tr>
                    <td class="main"><?php echo TEXT_AUTHORS_URL; ?></td>
                    <td class="main"><?php echo tep_draw_input_field('authors_url[' . $languages[$i]['id'] . ']', tep_get_author_url($authors['authors_id'], $languages[$i]['id']), 'size="70"'); ?></td>
                  </tr>
                </table>
	          </div>

            <?php
            } // END TAB CONTENTS LOOP
            ?>
            </div>
		    </td>
          </tr>
	      <tr>
    	    <td class="main">&nbsp;</td>
        	<td class="main" align="right"><?php echo tep_draw_separator('pixel_trans.gif', '24', '15') . '&nbsp;' . tep_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $_GET['auID']) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>'; ?></td>
      	  </tr>
        </table>
      </form>   

<?php
  } elseif ($action == 'preview') {

    $authors_query = tep_db_query("select authors_id, authors_name from " . TABLE_AUTHORS . " where authors_id = '" . $_GET['auID'] . "'");
    $authors = tep_db_fetch_array($authors_query)

?>
      <tr>
        <td width="100%">
          <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr>
              <td class="pageHeading"><?php echo TEXT_ARTICLE_BY . $authors['authors_name']; ?></td>
              <td class="pageHeading" align="right">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
      </tr>
      <tr>
        <td>
          <table border="0" cellspacing="0" cellpadding="2">
          <?php
          $languages = tep_get_languages();
          for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
          ?>
            <tr>
              <td class="main" colspan="2" valign="top"><?php echo tep_image(DIR_WS_CATALOG_LANGUAGES . $languages[$i]['directory'] . '/images/' . $languages[$i]['image'], $languages[$i]['name']); ?></td>
            </tr>
            <tr>
              <td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
            </tr>
            <tr>
              <td class="main" valign="top"><?php echo tep_get_author_description($authors['authors_id'], $languages[$i]['id']); ?></td>
            </tr>
            <tr>
              <td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
            </tr>
            <?php if(tep_not_null(tep_get_author_url($authors['authors_id'], $languages[$i]['id']))) { ?>
            <tr>
              <td class="main" valign="top"><?php echo sprintf(TEXT_MORE_INFORMATION, tep_get_author_url($authors['authors_id'], $languages[$i]['id'])); ?></td>
            <tr>
              <td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '1', '10'); ?></td>
            </tr>
            <?php } ?>
          <?php } ?>
            <tr>
              <td class="main" colspan="2" align="right"><?php echo '<a href="' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $authors['authors_id']) . '">' . tep_image_button('button_back.gif', IMAGE_BACK) . '</a>'; ?></td>
            </tr>
          </table>
        </td>
      </tr>
<?php } else { ?>
      <tr>
        <td width="100%">
          <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr>
              <td class="pageHeading"><?php echo HEADING_TITLE; ?></td>
              <td class="pageHeading" align="right">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr class="dataTableHeadingRow">
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_AUTHORS; ?></td>
                <td class="dataTableHeadingContent" align="right"><?php echo TABLE_HEADING_ACTION; ?>&nbsp;</td>
              </tr>
<?php
  $authors_query_raw = "select authors_id, authors_name, date_added, last_modified from " . TABLE_AUTHORS . " order by authors_name";
  $authors_split = new splitPageResults($_GET['page'], MAX_DISPLAY_SEARCH_RESULTS, $authors_query_raw, $authors_query_numrows);
  $authors_query = tep_db_query($authors_query_raw);
  while ($authors = tep_db_fetch_array($authors_query)) {
    if ((!isset($_GET['auID']) || (isset($_GET['auID']) && ($_GET['auID'] == $authors['authors_id']))) && !isset($auInfo) && (substr($action, 0, 3) != 'new')) {
      $author_articles_query = tep_db_query("select count(*) as articles_count from " . TABLE_ARTICLES . " where authors_id = '" . (int)$authors['authors_id'] . "'");
      $author_articles = tep_db_fetch_array($author_articles_query);

     $auInfo_array = array_merge($authors, $author_articles);
      $auInfo = new objectInfo($auInfo_array);
    }

    if (isset($auInfo) && is_object($auInfo) && ($authors['authors_id'] == $auInfo->authors_id)) {
      echo '              <tr id="defaultSelected" class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $authors['authors_id'] . '&amp;action=edit') . '\'">' . "\n";
    } else {
      echo '              <tr class="dataTableRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $authors['authors_id']) . '\'">' . "\n";
    }
?>
                <td class="dataTableContent"><?php echo $authors['authors_name']; ?></td>
                <td class="dataTableContent" align="right"><?php if (isset($auInfo) && is_object($auInfo) && ($authors['authors_id'] == $auInfo->authors_id)) { echo tep_image(DIR_WS_ICONS . 'icon_arrow_right.gif'); } else { echo '<a href="' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $authors['authors_id']) . '">' . tep_image(DIR_WS_ICONS . 'information.png', IMAGE_ICON_INFO) . '</a>'; } ?>&nbsp;</td>
              </tr>
<?php
  }
?>
              <tr>
                <td colspan="2"><table border="0" width="100%" cellspacing="0" cellpadding="2">
                  <tr>
                    <td class="smallText" valign="top"><?php echo $authors_split->display_count($authors_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, $_GET['page'], TEXT_DISPLAY_NUMBER_OF_AUTHORS); ?></td>
                    <td class="smallText" align="right"><?php echo $authors_split->display_links($authors_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, MAX_DISPLAY_PAGE_LINKS, $_GET['page']); ?></td>
                  </tr>
                </table></td>
              </tr>
<?php
  if (empty($action)) {
?>
              <tr>
                <td align="right" colspan="2" class="smallText"><?php echo '<a href="' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $auInfo->authors_id . '&amp;action=new') . '">' . tep_image_button('button_insert.gif', IMAGE_INSERT) . '</a>'; ?></td>
              </tr>
<?php
  }
?>
            </table></td>
<?php
  $heading = array();
  $contents = array();

  switch ($action) {
    case 'delete':
      $heading[] = array('text' => '<b>' . TEXT_HEADING_DELETE_AUTHOR . '</b>');

      $contents = array('form' => tep_draw_form('authors', FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $auInfo->authors_id . '&amp;action=deleteconfirm'));
      $contents[] = array('text' => TEXT_DELETE_INTRO);
      $contents[] = array('text' => '<br><b>' . $auInfo->authors_name . '</b>');

      if ($auInfo->articles_count > 0) {
        $contents[] = array('text' => '<br>' . tep_draw_checkbox_field('delete_articles') . ' ' . TEXT_DELETE_ARTICLES);
        $contents[] = array('text' => '<br>' . sprintf(TEXT_DELETE_WARNING_ARTICLES, $auInfo->articles_count));
      }

      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_delete.gif', IMAGE_DELETE) . ' <a href="' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $auInfo->authors_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    default:
      if (isset($auInfo) && is_object($auInfo)) {
        $heading[] = array('text' => '<b>' . $auInfo->authors_name . '</b>');

        $contents[] = array('align' => 'center', 'text' => '<a href="' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $auInfo->authors_id . '&amp;action=edit') . '">' . tep_image_button('button_edit.gif', IMAGE_EDIT) . '</a> <a href="' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $auInfo->authors_id . '&amp;action=delete') . '">' . tep_image_button('button_delete.gif', IMAGE_DELETE) . '</a><br>' . ' <a href="' . tep_href_link(FILENAME_AUTHORS, 'page=' . $_GET['page'] . '&amp;auID=' . $auInfo->authors_id) . '&amp;action=preview' . '">' . tep_image_button('button_preview.gif', IMAGE_PREVIEW) . '</a>');
        $contents[] = array('text' => '<br>' . TEXT_DATE_ADDED . ' ' . tep_date_short($auInfo->date_added));
        if (tep_not_null($auInfo->last_modified)) $contents[] = array('text' => TEXT_LAST_MODIFIED . ' ' . tep_date_short($auInfo->last_modified));
        $contents[] = array('text' => '<br>' . TEXT_ARTICLES . ' ' . $auInfo->articles_count);
      }
      break;
  }

  if ( (tep_not_null($heading)) && (tep_not_null($contents)) ) {
    echo '            <td width="25%" valign="top">' . "\n";

    $box = new box;
    echo $box->infoBox($heading, $contents);

    echo '            </td>' . "\n";
  } else {
	$heading[] = array('text' => HEADING_NO_AUTHORS);
    $contents[] = array('text' => TEXT_NO_AUTHORS);  
	  
	echo '            <td width="25%" valign="top">';
	$box = new box;
    echo $box->infoBox($heading, $contents);
    echo '            </td>';  
  }
?>
          </tr>
        </table></td>
      </tr>
<?php
  }
?>
    </table></td>
<!-- body_text_eof //-->
  </tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
<br>
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>