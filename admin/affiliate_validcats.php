<?php
/*
$Id: affiliate_validcats.php 1692 2012-02-26 01:26:50Z michael.oscmax@gmail.com $

  osCmax e-Commerce
  http://www.oscmax.com

  Copyright 2000 - 2011 osCmax

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_AFFILIATE_BANNERS);
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<?php
// BOF: WebMakers.com Changed: Header Tag Controller v1.0
if ( file_exists(DIR_WS_INCLUDES . 'header_tags.php') ) {
	  require(DIR_WS_INCLUDES . 'header_tags.php');
	} else {
		?> 
		  <title><?php echo TITLE; ?></title>
		  <?php
		}
		?>
<link rel="stylesheet" type="text/css" href="templates/fallback/stylesheet.css">
<head>
<body>
 
	<table width="580" class="infoBox">
<tr>
<td colspan="2" class="infoBoxHeading"><?php echo TEXT_VALID_CATEGORIES_LIST; ?></td>
</tr>
<?php
    echo "<tr><td><b>". TEXT_VALID_CATEGORIES_ID . "</b></td><td><b>" . TEXT_VALID_CATEGORIES_NAME . "</b></td></tr><tr>";
    $result = mysql_query("SELECT * FROM categories, categories_description WHERE categories.categories_id = categories_description.categories_id and categories_description.language_id = '" . $languages_id . "' ORDER BY categories_description.categories_name");
    if ($row = mysql_fetch_array($result)) {
        do {
            echo "<td class='infoBoxContents'>&nbsp;".$row["categories_id"]."</td>\n";
            echo "<td class='infoBoxContents'>".$row["categories_name"]."</td>\n";
            echo "</tr>\n";
        }
        while($row = mysql_fetch_array($result));
    }
    echo "</table>\n";
?>
<p class="smallText" align="right"><?php echo '<a href="javascript:window.close()">' . TEXT_CLOSE_WINDOW . '</a>'; ?>&nbsp;&nbsp;&nbsp;</p>
<br>
</body>
</html>
<?php require('includes/application_bottom.php'); ?>