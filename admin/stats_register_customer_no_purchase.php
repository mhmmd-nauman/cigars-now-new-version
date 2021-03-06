<?php
/*
$Id: stats_register_customer_no_purchase.php 1692 2012-02-26 01:26:50Z michael.oscmax@gmail.com $

  osCmax e-Commerce
  http://www.oscmax.com

  Copyright 2000 - 2011 osCmax

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_CLASSES . 'currencies.php');
  $currencies = new currencies();
  
  require('common_reports.php');  //for session dates  
  
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<link rel="stylesheet" type="text/css" href="includes/javascript/jquery-ui-1.8.2.custom.css">
<script type="text/javascript" src="includes/general.js"></script>
</head>
<body>
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
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo HEADING_TITLE . $date1 . HEADING_TITLE_TO . $date2; ?></td>
            <td class="pageHeading" align="right">&nbsp;</td>
          </tr>
		   <tr>
            <td class="main" colspan="2">
                <form method="GET" action="<?php echo basename($_SERVER['PHP_SELF']) . '?date1=' . $date1.'&amp;date2='.$date2; ?>" name="dailyreportform"> 
                <input type="hidden" name="action" value="dailyreportaction">
                <?php echo TEXT_SELECT_DATE; ?>
				<?php echo tep_draw_input_field('date1', $date1, 'id="nopurchases_start"'); ?>
                <?php echo HEADING_TITLE_TO; ?>
		        <?php echo tep_draw_input_field('date2', $date2, 'id="nopurchases_end"'); ?>
		        <input type="submit">
                </form>
		    </td>
          </tr>
		  
		  
        </table></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
          <tr>
            <td valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr class="dataTableHeadingRow">
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_NUMBER; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_CUSTOMER; ?></td>
				
				
                <td class="dataTableHeadingContent" align="center">
				 <?php echo TABLE_HEADING_PURCHASES; ?>&nbsp;
				</td>
								
				 <td class="dataTableHeadingContent" align="right">
				 <?php echo TABLE_HEADING_JOIN_DATE; ?>&nbsp;
				 </td>
              </tr>
<?php

  if (isset($_GET['page']) && ($_GET['page'] > 1)) $rows = $_GET['page'] * MAX_DISPLAY_SEARCH_RESULTS - MAX_DISPLAY_SEARCH_RESULTS;
//  $customers_query_raw = "select c.customers_firstname, c.customers_lastname, count(o.orders_id) as ordersum from " . TABLE_CUSTOMERS . " c, " . TABLE_ORDERS . " o where c.customers_id = o.customers_id group by c.customers_firstname, c.customers_lastname order by ordersum DESC";  
  //$customers_query_raw = "select c.customers_firstname, c.customers_lastname, sum(op.products_quantity * op.final_price) as ordersum ,count(o.orders_id) as ordercnt  from " . TABLE_CUSTOMERS . " c, " . TABLE_ORDERS_PRODUCTS . " op, " . TABLE_ORDERS . " o where c.customers_id = o.customers_id and o.orders_id = op.orders_id group by c.customers_firstname, c.customers_lastname order by $ORDER_BY";
  $customers_query_raw ="select distinct (c.customers_id) from customers c, customers_info ci where c.customers_id = ci.customers_info_id and c.customers_id not in ( select distinct(`customers_id`) from `orders`) and DATE(ci.customers_info_date_account_created)>=DATE(\"$date1%\") and DATE(ci.customers_info_date_account_created)<=DATE(\"$date2%\")";
  
  $customers_split = new splitPageResults($_GET['page'], MAX_DISPLAY_SEARCH_RESULTS, $customers_query_raw, $customers_query_numrows);


  $rows = 0;
  $customers_query = tep_db_query($customers_query_raw);
  while ($customers = tep_db_fetch_array($customers_query)) {
    $rows++;

    if (strlen($rows) < 2) {
      $rows = '0' . $rows;
    }
?>
              
              <tr class="dataTableRow" onMouseOver="rowOverEffect(this)" onMouseOut="rowOutEffect(this)" onClick="document.location.href='<?php echo tep_href_link(FILENAME_CUSTOMERS, 'search='. tep_customers_lname($customers['customers_id']), 'NONSSL'); ?>'">

                <td class="dataTableContent"><?php echo $rows; ?>.</td>
                <td class="dataTableContent"><?php echo '<a href="' . tep_href_link(FILENAME_CUSTOMERS, 'search=' . tep_customers_lname($customers['customers_id']), 'NONSSL') . '">' . tep_customers_name($customers['customers_id']) . '</a>'; ?></td>
                <td class="dataTableContent" align="center"><?php echo $currencies->format(0); ?>&nbsp;</td>
				 <td class="dataTableContent" align="right"><?php echo tep_date_short(tep_customers_join_date($customers['customers_id']));  ?>&nbsp;</td>
              </tr>
<?php
  }
?>
            </table></td>
          </tr>
          <tr>
            <td colspan="3"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr>
                <td class="smallText" valign="top"><?php echo $customers_split->display_count($customers_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, $_GET['page'], TEXT_DISPLAY_NUMBER_OF_CUSTOMERS); ?></td>
                <td class="smallText" align="right"><?php echo $customers_split->display_links($customers_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, MAX_DISPLAY_PAGE_LINKS, $_GET['page'], "date1={$_GET['date1']}&amp;date2={$_GET['date2']}&amp;sort={$_GET['sort']}"); ?>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
<!-- body_text_eof //-->
  </tr>
</table>

<?php  //// these functions only used by this program, left off by original author
function tep_customers_join_date($customers_id) {
    $customers = tep_db_query("select customers_info_date_account_created from " . TABLE_CUSTOMERS_INFO . " where customers_info_id = '" . (int)$customers_id . "'");
    $customers_values = tep_db_fetch_array($customers);

    return $customers_values['customers_info_date_account_created'];
}

function tep_customers_lname($customers_id) {
    $customers = tep_db_query("select customers_lastname from " . TABLE_CUSTOMERS . " where customers_id = '" . (int)$customers_id . "'");
    $customers_values = tep_db_fetch_array($customers);

    return $customers_values['customers_lastname'];
}

?>

<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
