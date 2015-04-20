# osCmax Open Source Shopping Cart
# http://www.oscmax.com
#
# Database Backup For Test Store
# Copyright (c) osCmax 2015 Muhammad Nauman
#
# Database: oscmax_v2.5.4_0
# Database Server: localhost
#
# Backup Date: 04/05/2015 07:19:34

drop table if exists address_book;
create table address_book (
  address_book_id int(11) not null auto_increment,
  customers_id int(11) not null ,
  entry_gender char(1) not null ,
  entry_company varchar(32) ,
  entry_company_tax_id varchar(32) ,
  entry_firstname varchar(32) not null ,
  entry_lastname varchar(32) not null ,
  entry_street_address varchar(64) not null ,
  entry_suburb varchar(32) ,
  entry_postcode varchar(10) not null ,
  entry_city varchar(32) not null ,
  entry_state varchar(32) ,
  entry_country_id int(11) default '0' not null ,
  entry_zone_id int(11) default '0' not null ,
  PRIMARY KEY (address_book_id),
  KEY idx_address_book_customers_id (customers_id)
);

insert into address_book (address_book_id, customers_id, entry_gender, entry_company, entry_company_tax_id, entry_firstname, entry_lastname, entry_street_address, entry_suburb, entry_postcode, entry_city, entry_state, entry_country_id, entry_zone_id) values ('1', '1', '', NULL, NULL, 'Muhammad', 'Nauman', '195 F GECHS', NULL, '63100', 'Bahawalpur', '', '162', '2838');
drop table if exists address_format;
create table address_format (
  address_format_id int(11) not null auto_increment,
  address_format varchar(128) not null ,
  address_summary varchar(48) not null ,
  PRIMARY KEY (address_format_id)
);

insert into address_format (address_format_id, address_format, address_summary) values ('1', '$firstname $lastname$cr$streets$cr$city,$postcode$cr$statecomma$country', '$city / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('2', '$firstname $lastname$cr$streets$cr$city,$state    $postcode$cr$country', '$city,$state / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('3', '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('4', '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('5', '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('6', '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country', '$city / $country');
drop table if exists admin;
create table admin (
  admin_id int(11) not null auto_increment,
  admin_groups_id int(11) ,
  admin_username varchar(32) not null ,
  admin_firstname varchar(32) not null ,
  admin_lastname varchar(32) ,
  admin_email_address varchar(96) not null ,
  admin_password varchar(40) not null ,
  admin_created datetime ,
  admin_modified datetime not null ,
  admin_logdate datetime ,
  admin_lognum int(11) default '0' not null ,
  PRIMARY KEY (admin_id),
  UNIQUE admin_username (admin_username),
  UNIQUE admin_email_address (admin_email_address)
);

insert into admin (admin_id, admin_groups_id, admin_username, admin_firstname, admin_lastname, admin_email_address, admin_password, admin_created, admin_modified, admin_logdate, admin_lognum) values ('1', '1', 'admin', 'Muhammad', 'Nauman', 'mhmmd.nauman@gmail.com', '2ccf185565bc3254f5db8b7d57a42668:f0', '2015-04-04 21:05:54', '0000-00-00 00:00:00', '2015-04-04 22:17:36', '3');
drop table if exists admin_files;
create table admin_files (
  admin_files_id int(11) not null auto_increment,
  admin_files_name varchar(64) not null ,
  admin_display_name varchar(64) not null ,
  admin_files_is_boxes tinyint(5) default '0' not null ,
  admin_files_to_boxes int(11) default '0' not null ,
  admin_groups_id set('1','2') default '1' not null ,
  admin_sort_order int(3) not null ,
  PRIMARY KEY (admin_files_id)
);

insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('1', 'administrator.php', 'BOX_HEADING_ADMINISTRATOR', '1', '0', '1', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('2', 'configuration.php', 'BOX_HEADING_CONFIGURATION', '1', '0', '1', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('3', 'catalog.php', 'BOX_HEADING_CATALOG', '1', '0', '1,2', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('4', 'modules.php', 'BOX_HEADING_MODULES', '1', '0', '1', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('5', 'customers.php', 'BOX_HEADING_CUSTOMERS', '1', '0', '1,2', '5');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('6', 'taxes.php', 'BOX_HEADING_LOCATION_AND_TAXES', '1', '0', '1', '6');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('7', 'localization.php', 'BOX_HEADING_LOCALIZATION', '1', '0', '1,2', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('8', 'reports.php', 'BOX_HEADING_REPORTS', '1', '0', '1,2', '8');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('9', 'tools.php', 'BOX_HEADING_TOOLS', '1', '0', '1,2', '9');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('10', 'admin_members.php', 'BOX_ADMINISTRATOR_MEMBERS', '0', '1', '1', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('11', 'admin_files.php', 'BOX_ADMINISTRATOR_BOXES', '0', '1', '1', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('13', 'categories.php', 'BOX_CATALOG_CATEGORIES_PRODUCTS', '0', '3', '1,2', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('14', 'products_attributes.php', 'BOX_CATALOG_CATEGORIES_PRODUCTS_ATTRIBUTES', '0', '3', '1,2', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('15', 'manufacturers.php', 'BOX_CATALOG_MANUFACTURERS', '0', '3', '1,2', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('16', 'reviews.php', 'BOX_CATALOG_REVIEWS', '0', '3', '1,2', '5');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('17', 'specials.php', 'BOX_CATALOG_SPECIALS', '0', '3', '1,2', '6');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('18', 'products_expected.php', 'BOX_CATALOG_PRODUCTS_EXPECTED', '0', '3', '1,2', '12');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('20', 'customers.php', 'BOX_CUSTOMERS_CUSTOMERS', '0', '5', '1,2', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('21', 'orders.php', 'BOX_CUSTOMERS_ORDERS', '0', '5', '1,2', '6');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('22', 'countries.php', 'BOX_TAXES_COUNTRIES', '0', '6', '1', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('23', 'zones.php', 'BOX_TAXES_ZONES', '0', '6', '1', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('24', 'geo_zones.php', 'BOX_TAXES_GEO_ZONES', '0', '6', '1', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('25', 'tax_classes.php', 'BOX_TAXES_TAX_CLASSES', '0', '6', '1', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('26', 'tax_rates.php', 'BOX_TAXES_TAX_RATES', '0', '6', '1', '5');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('27', 'currencies.php', 'BOX_LOCALIZATION_CURRENCIES', '0', '7', '1,2', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('28', 'languages.php', 'BOX_LOCALIZATION_LANGUAGES', '0', '7', '1', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('29', 'orders_status.php', 'BOX_LOCALIZATION_ORDERS_STATUS', '0', '7', '1,2', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('30', 'stats_products_viewed.php', 'BOX_REPORTS_PRODUCTS_VIEWED', '0', '8', '1,2', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('31', 'stats_products_purchased.php', 'BOX_REPORTS_PRODUCTS_PURCHASED', '0', '8', '1,2', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('32', 'stats_customers.php', 'BOX_REPORTS_ORDERS_TOTAL', '0', '8', '1,2', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('33', 'backup.php', 'BOX_TOOLS_BACKUP', '0', '9', '1,2', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('34', 'banner_manager.php', 'BOX_TOOLS_BANNER_MANAGER', '0', '9', '1,2', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('35', 'cache.php', 'BOX_TOOLS_CACHE', '0', '1', '1', '9');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('38', 'mail.php', 'BOX_TOOLS_MAIL', '0', '9', '1,2', '5');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('39', 'newsletters.php', 'BOX_TOOLS_NEWSLETTER_MANAGER', '0', '9', '1,2', '6');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('40', 'server_info.php', 'BOX_TOOLS_SERVER_INFO', '0', '9', '1', '11');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('41', 'whos_online.php', 'BOX_TOOLS_WHOS_ONLINE', '0', '9', '1,2', '12');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('42', 'banner_statistics.php', 'FILE_BANNER_STATISTICS', '0', '9', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('43', 'affiliate.php', 'BOX_HEADING_AFFILIATES', '1', '0', '1,2', '10');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('44', 'affiliate_affiliates.php', 'BOX_AFFILIATE', '0', '43', '1,2', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('45', 'affiliate_clicks.php', 'BOX_AFFILIATE_CLICKS', '0', '43', '1,2', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('46', 'affiliate_banners.php', 'BOX_AFFILIATE_BANNERS', '0', '43', '1,2', '6');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('47', 'affiliate_contact.php', 'BOX_AFFILIATE_CONTACT', '0', '43', '1,2', '9');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('48', 'affiliate_invoice.php', 'FILE_AFFILIATE', '0', '43', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('49', 'affiliate_payment.php', 'BOX_AFFILIATE_PAYMENT', '0', '43', '1,2', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('50', 'affiliate_popup_image.php', 'FILE_AFFILIATE', '0', '43', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('51', 'affiliate_sales.php', 'BOX_AFFILIATE_SALES', '0', '43', '1,2', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('52', 'affiliate_statistics.php', 'FILE_AFFILIATE', '0', '43', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('53', 'affiliate_summary.php', 'BOX_AFFILIATE_SUMMARY', '0', '43', '1,2', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('54', 'gv_admin.php', 'BOX_HEADING_VOUCHERS', '1', '0', '1,2', '11');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('55', 'coupon_admin.php', 'BOX_COUPON_ADMIN', '0', '54', '1,2', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('56', 'gv_queue.php', 'BOX_GV_ADMIN_QUEUE', '0', '54', '1,2', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('57', 'gv_mail.php', 'BOX_GV_ADMIN_MAIL', '0', '54', '1,2', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('58', 'gv_sent.php', 'BOX_GV_ADMIN_SENT', '0', '54', '1,2', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('62', 'coupon_restrict.php', 'FILE_COUPON_RESTRICT', '0', '54', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('65', 'easypopulate.php', 'BOX_CATALOG_EASYPOPULATE', '0', '3', '1,2', '9');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('70', 'edit_orders.php', 'FILE_ORDER', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('71', 'validproducts.php', 'FILE_VALID_PRODUCTS', '0', '54', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('72', 'validcategories.php', 'FILE_VALID_CATEGORIES', '0', '54', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('73', 'listcategories.php', 'FILE_LIST_CATEGORIES', '0', '54', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('74', 'listproducts.php', 'FILE_LIST_PRODUCTS', '0', '54', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('75', 'new_attributes.php', 'BOX_CATALOG_ATTRIBUTE_MANAGER', '0', '3', '1,2', '11');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('78', 'paypal_ipn.php', 'FILE_PAYPAL', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('80', 'paypal_ipn_order.php', 'FILE_PAYPAL', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('81', 'articles.php', 'BOX_HEADING_ARTICLES', '1', '0', '1,2', '12');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('82', 'article_reviews.php', 'BOX_ARTICLES_REVIEWS', '0', '81', '1,2', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('83', 'articles.php', 'BOX_TOPICS_ARTICLES', '0', '81', '1,2', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('85', 'articles_xsell.php', 'BOX_ARTICLES_XSELL', '0', '81', '1,2', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('86', 'authors.php', 'BOX_ARTICLES_AUTHORS', '0', '81', '1,2', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('87', 'recover_cart_sales.php', 'BOX_TOOLS_RECOVER_CART', '0', '9', '1,2', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('88', 'stats_recover_cart_sales.php', 'BOX_REPORTS_RECOVER_CART_SALES', '0', '8', '1,2', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('89', 'stats_monthly_sales.php', 'BOX_REPORTS_MONTHLY_SALES', '0', '8', '1,2', '6');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('90', 'batch_print.php', 'BOX_TOOLS_BATCH_CENTER', '0', '9', '1,2', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('91', 'stock.php', 'FILE_STOCK', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('92', 'stats_low_stock_attrib.php', 'BOX_REPORTS_STATS_LOW_STOCK_ATTRIB', '0', '8', '1,2', '9');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('98', 'customers_groups.php', 'BOX_CUSTOMERS_GROUPS', '0', '5', '1,2', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('102', 'xsell.php', 'BOX_CATALOG_XSELL_PRODUCTS', '0', '3', '1,2', '8');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('103', 'create_account.php', 'BOX_MANUAL_ORDER_CREATE_ACCOUNT', '0', '5', '1,2', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('104', 'create_account_process.php', 'FILE_CREATE_ACCOUNT', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('105', 'create_account_success.php', 'FILE_CREATE_ACCOUNT', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('106', 'create_order.php', 'BOX_MANUAL_ORDER_CREATE_ORDER', '0', '5', '1,2', '5');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('107', 'create_order_process.php', 'FILE_ORDER', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('108', 'easypopulate_functions.php', 'FILE_EASYPOPULATE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('109', 'new_attributes_change.php', 'FILE_ATTRIBUTE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('110', 'new_attributes_config.php', 'FILE_NEW_ATTRIBUTES_CONFIG', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('111', 'new_attributes_functions.php', 'FILE_ATTRIBUTE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('112', 'new_attributes_include.php', 'FILE_ATTRIBUTE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('113', 'new_attributes_select.php', 'FILE_ATTRIBUTE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('114', 'ship_fedex.php', 'FILE_FEDEX', '0', '8', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('115', 'fedex_popup.php', 'FILE_FEDEX', '0', '8', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('116', 'shipping_manifest.php', 'BOX_SHIPPING_MANIFEST', '0', '8', '1,2', '8');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('117', 'track_fedex.php', 'FILE_FEDEX', '0', '8', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('118', 'paypal_info.php', 'BOX_PAYPAL_INFO', '0', '1', '1', '15');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('119', 'affiliate_info.php', 'BOX_HEADING_AFFILIATES', '0', '1', '1', '11');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('124', 'affiliate_news.php', 'BOX_AFFILIATE_NEWS', '0', '43', '1,2', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('125', 'affiliate_newsletters.php', 'BOX_AFFILIATE_NEWSLETTER_MANAGER', '0', '43', '1,2', '8');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('126', 'affiliate_validcats.php', 'FILE_AFFILIATE', '0', '43', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('127', 'affiliate_validproducts.php', 'FILE_AFFILIATE', '0', '43', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('128', 'edit_orders_add_product.php', 'FILE_ORDER', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('129', 'edit_orders_ajax.php', 'FILE_ORDER', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('130', 'attributeManager.php', 'FILE_ATTRIBUTE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('131', 'phone_order.php', 'BOX_PHONE_ORDER', '0', '5', '1,2', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('132', 'stats_admin_logging.php', 'BOX_REPORTS_ADMIN_LOGGING', '0', '8', '1,2', '11');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('133', 'stats_cust_logging.php', 'BOX_REPORTS_CUST_LOGGING', '0', '8', '1,2', '12');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('134', 'customer_export.php', 'BOX_CUSTOMERS_EXPORT', '0', '5', '1,2', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('135', 'packaging.php', 'BOX_TOOLS_PACKAGING', '0', '9', '1,2', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('136', 'ups_boxes_used.php', 'BOX_TOOLS_UPS_BOXES_USED', '0', '9', '1,2', '8');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('137', 'stats_credits.php', 'BOX_REPORTS_CREDITS', '0', '8', '1,2', '10');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('138', 'treeview.php', 'FILE_TREE_VIEW', '0', '54', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('139', 'qtprodoctor.php', 'BOX_TOOLS_QTPRODOCTOR', '0', '9', '1,2', '9');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('140', 'googlesitemap.php', 'BOX_CONFIGURATION_GOOGLE_SITEMAP', '0', '2', '1', '42');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('141', 'common_reports.php', 'FILE_COMMON_REPORTS', '0', '8', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('142', 'stats_http_error.php', 'BOX_REPORTS_HTTP_ERROR', '0', '8', '1,2', '13');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('143', 'stats_register_customer_no_purchase.php', 'BOX_REPORTS_STATS_REGISTER_CUSTOMER_NO_PURCHASE', '0', '8', '1,2', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('144', 'quick_links.php', 'BOX_TOOLS_QUICK_LINKS', '0', '1', '1', '12');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('145', 'feedmachine.php', 'BOX_CATALOG_FEEDMACHINE', '0', '3', '1,2', '10');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('146', 'feedmachine_admin.php', 'FILE_FEEDMACHINE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('147', 'feedmachine_auto.php', 'FILE_FEEDMACHINE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('148', 'feedmachine_config.php', 'FILE_FEEDMACHINE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('149', 'feedmachine_loader.php', 'FILE_FEEDMACHINE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('150', 'feedmachine_loadingbay.php', 'FILE_FEEDMACHINE', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('151', 'discount_categories.php', 'BOX_CATALOG_CATEGORIES_DISCOUNT_CATEGORIES', '0', '3', '1,2', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('152', 'discount_categories_groups_pp.php', 'FILE_DISCOUNT_CATEGORIES', '0', '3', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('153', 'premade_comments.php', 'BOX_PREMADE', '0', '7', '1,2', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('154', 'page_modules_configuration.php', 'BOX_CONFIGURATION_PAGE_MODULES', '0', '2', '1', '21');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('155', 'stats_wishlist.php', 'BOX_REPORTS_WISHLIST', '0', '8', '1,2', '5');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('156', 'slideshow.php', 'BOX_TOOLS_SLIDESHOW', '0', '2', '1', '31');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('157', 'extra_fields.php', 'BOX_CATALOG_PRODUCTS_EXTRA_FIELDS', '0', '3', '1,2', '13');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('158', 'extra_values.php', 'BOX_CATALOG_PRODUCTS_EXTRA_VALUES', '0', '3', '1,2', '14');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('159', 'information_form.php', 'FILE_INFORMATION', '0', '2', '1', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('160', 'information_list.php', 'FILE_INFORMATION', '0', '2', '1', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('161', 'information_manager.php', 'FILE_INFORMATION', '0', '2', '1', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('162', 'images_regen.php', 'BOX_TOOLS_REGEN', '0', '9', '1,2', '10');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('163', 'gc_dashboard.php', 'FILE_GC_DASHBOARD', '0', '4', '1', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('164', 'specialsbycategory.php', 'BOX_CATALOG_SPECIALS_BY_CAT', '0', '3', '1,2', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('165', 'configuration.php?gID=14', 'BOX_CONFIGURATION_GZIP', '0', '1', '1', '4');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('166', 'admin_members.php?gID=groups', 'BOX_ADMIN_GROUPS', '0', '1', '1', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('167', 'configuration.php?gID=10', 'BOX_CONFIGURATION_LOGGING_CACHE', '0', '1', '1', '6');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('168', 'configuration.php?gID=11', 'BOX_CONFIGURATION_CACHE', '0', '1', '1', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('169', 'configuration.php?gID=55', 'BOX_CONFIGURATION_PAGE_CACHE', '0', '1', '1', '8');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('170', 'configuration.php?gID=15', 'BOX_CONFIGURATION_SESSIONS', '0', '1', '1', '9');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('171', 'configuration.php?gID=16', 'BOX_CONFIGURATION_MAINTENANCE', '0', '1', '1', '10');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('172', 'merchant_info.php', 'BOX_MERCHANT_INFO', '0', '1', '1', '13');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('175', 'modules.php?set=payment', 'BOX_MODULES_PAYMENT', '0', '4', '1', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('176', 'modules.php?set=shipping', 'BOX_MODULES_SHIPPING', '0', '4', '1', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('177', 'modules.php?set=ordertotal', 'BOX_MODULES_ORDER_TOTAL', '0', '4', '1', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('178', 'configuration.php?gID=1', 'BOX_CONFIGURATION_MYSTORE', '0', '2', '1', '1');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('179', 'configuration.php?gID=2', 'BOX_CONFIGURATION_MIN_VALUES', '0', '2', '1', '2');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('180', 'configuration.php?gID=3', 'BOX_CONFIGURATION_MAX_VALUES', '0', '2', '1', '3');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('181', 'configuration.php?gID=4', 'BOX_CONFIGURATION_IMAGES', '0', '2', '1', '5');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('182', 'configuration.php?gID=45', 'BOX_CONFIGURATION_MOPICS', '0', '2', '1', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('183', 'configuration.php?gID=5', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', '0', '2', '1', '8');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('184', 'configuration.php?gID=7', 'BOX_CONFIGURATION_SHIPPING', '0', '2', '1', '9');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('185', 'configuration.php?gID=8', 'BOX_CONFIGURATION_PRODUCT_LISTING', '0', '2', '1', '10');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('186', 'configuration.php?gID=50', 'BOX_CONFIGURATION_PRODUCT_INFO', '0', '2', '1', '12');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('187', 'configuration.php?gID=88', 'BOX_CONFIGURATION_PRODUCT_PRICE_BREAKS', '0', '2', '1', '13');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('188', 'configuration.php?gID=9', 'BOX_CONFIGURATION_STOCK', '0', '2', '1', '14');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('189', 'configuration.php?gID=13', 'BOX_CONFIGURATION_DOWNLOAD', '0', '2', '1', '15');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('190', 'configuration.php?gID=30', 'BOX_CONFIGURATION_PRINT', '0', '2', '1', '16');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('191', 'configuration.php?gID=12', 'BOX_CONFIGURATION_EMAIL', '0', '2', '1', '17');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('192', 'configuration.php?gID=206', 'BOX_CONFIGURATION_MC', '0', '2', '1', '17');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('193', 'configuration.php?gID=25', 'BOX_CONFIGURATION_WYSIWYG', '0', '2', '1', '18');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('194', 'configuration.php?gID=201', 'BOX_CONFIGURATION_TEMPLATE_SETUP', '0', '2', '1', '19');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('195', 'infobox_configuration.php', 'BOX_HEADING_BOXES', '0', '2', '1', '20');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('196', 'information_manager.php?gID=1', 'BOX_CONFIGURATION_INFO_PAGES', '0', '2', '1', '21');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('197', 'information_manager.php?gID=2', 'BOX_CONFIGURATION_WELCOME', '0', '2', '1', '22');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('198', 'configuration.php?gID=99', 'BOX_CONFIGURATION_OFS', '0', '2', '1', '23');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('199', 'configuration.php?gID=7575', 'BOX_CONFIGURATION_OPC', '0', '2', '1', '24');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('200', 'configuration.php?gID=204', 'BOX_CONFIGURATION_SLIDESHOW', '0', '2', '1', '25');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('201', 'configuration.php?gID=205', 'BOX_CONFIGURATION_CORNER_BANNERS', '0', '2', '1', '26');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('202', 'configuration.php?gID=207', 'BOX_CONFIGURATION_CONTACT', '0', '2', '1', '26');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('203', 'configuration.php?gID=87', 'BOX_CONFIGURATION_RECAPTCHA', '0', '2', '1', '27');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('204', 'configuration.php?gID=203', 'BOX_CONFIGURATION_NOTIFICATIONS', '0', '2', '1', '28');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('205', 'configuration.php?gID=65', 'BOX_CONFIGURATION_WISHLIST', '0', '2', '1', '28');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('206', 'configuration.php?gID=35', 'BOX_CONFIGURATION_AFFILIATE', '0', '2', '1', '29');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('207', 'configuration.php?gID=80', 'BOX_TOOLS_RECOVER_CART', '0', '2', '1', '30');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('208', 'configuration.php?gID=456', 'BOX_ARTICLES_CONFIG', '0', '2', '1', '32');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('209', 'configuration.php?gID=60', 'BOX_CONFIGURATION_SEO_URLS', '0', '2', '1', '33');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('210', 'configuration.php?gID=86', 'BOX_CONFIGURATION_SEO_POPOUT', '0', '2', '1', '34');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('211', 'configuration.php?gID=70', 'BOX_CONFIGURATION_EDITOR', '0', '2', '1', '35');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('212', 'configuration.php?gID=85', 'BOX_CONFIGURATION_GOOGLE_ANALYTICS', '0', '2', '1', '36');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('213', 'configuration.php?gID=89', 'BOX_CONFIGURATION_GOOGLE_MAPS', '0', '2', '1', '37');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('214', 'upgrade.php', 'BOX_ADMINISTRATOR_UPGRADE', '0', '1', '1', '20');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('215', 'stats_keywords.php', 'BOX_REPORTS_KEYWORDS', '0', '8', '1', '10');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('216', 'configuration.php?gID=46', 'BOX_CONFIGURATION_SLIMBOX', '0', '2', '1', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('217', 'configuration.php?gID=47', 'BOX_CONFIGURATION_CLOUDZOOM', '0', '2', '1', '7');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('218', 'paypal_wpp_capture.php', 'FILE_PAYPAL', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('219', 'paypal_wpp_charge.php', 'FILE_PAYPAL', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('220', 'paypal_wpp_include.php', 'FILE_PAYPAL', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('221', 'paypal_wpp_refund.php', 'FILE_PAYPAL', '0', '5', '1,2', '99');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('222', 'configuration.php?gID=208', 'BOX_CONFIGURATION_ADDTHIS', '0', '2', '1', '26');
insert into admin_files (admin_files_id, admin_files_name, admin_display_name, admin_files_is_boxes, admin_files_to_boxes, admin_groups_id, admin_sort_order) values ('223', 'customers_extra_fields.php', 'BOX_CUSTOMERS_EXTRA_FIELDS_MANAGER', '0', '5', '1', '0');
drop table if exists admin_groups;
create table admin_groups (
  admin_groups_id int(11) not null auto_increment,
  admin_groups_name varchar(64) ,
  PRIMARY KEY (admin_groups_id),
  UNIQUE admin_groups_name (admin_groups_name)
);

insert into admin_groups (admin_groups_id, admin_groups_name) values ('2', 'Customer Service');
insert into admin_groups (admin_groups_id, admin_groups_name) values ('1', 'Top Administrator');
drop table if exists admin_log;
create table admin_log (
  login_number int(11) not null auto_increment,
  user_name varchar(32) ,
  ip_address varchar(32) ,
  type varchar(32) ,
  login_time varchar(32) ,
  PRIMARY KEY (login_number)
);

insert into admin_log (login_number, user_name, ip_address, type, login_time) values ('1', 'admin', '::1', 'Logged In', '2015-04-04 21:06:49');
insert into admin_log (login_number, user_name, ip_address, type, login_time) values ('2', 'admin', '::1', 'Logged In', '2015-04-04 21:44:50');
insert into admin_log (login_number, user_name, ip_address, type, login_time) values ('3', 'admin', '::1', 'Config Change: 457', '2015-04-04 21:45:03');
insert into admin_log (login_number, user_name, ip_address, type, login_time) values ('4', 'admin', '::1', 'Logged In', '2015-04-04 22:17:36');
drop table if exists affiliate_affiliate;
create table affiliate_affiliate (
  affiliate_id int(11) not null auto_increment,
  affiliate_gender char(1) not null ,
  affiliate_firstname varchar(32) not null ,
  affiliate_lastname varchar(32) not null ,
  affiliate_dob datetime not null ,
  affiliate_email_address varchar(96) not null ,
  affiliate_telephone varchar(32) not null ,
  affiliate_fax varchar(32) not null ,
  affiliate_password varchar(40) not null ,
  affiliate_homepage varchar(96) not null ,
  affiliate_street_address varchar(64) not null ,
  affiliate_suburb varchar(64) not null ,
  affiliate_city varchar(32) not null ,
  affiliate_postcode varchar(10) not null ,
  affiliate_state varchar(32) not null ,
  affiliate_country_id int(11) default '0' not null ,
  affiliate_zone_id int(11) default '0' not null ,
  affiliate_agb tinyint(4) default '0' not null ,
  affiliate_company varchar(60) not null ,
  affiliate_company_taxid varchar(64) not null ,
  affiliate_commission_percent decimal(4,2) default '0.00' not null ,
  affiliate_payment_check varchar(100) not null ,
  affiliate_payment_paypal varchar(64) not null ,
  affiliate_payment_bank_name varchar(64) not null ,
  affiliate_payment_bank_branch_number varchar(64) not null ,
  affiliate_payment_bank_swift_code varchar(64) not null ,
  affiliate_payment_bank_account_name varchar(64) not null ,
  affiliate_payment_bank_account_number varchar(64) not null ,
  affiliate_date_of_last_logon datetime default '0001-01-01 01:01:01' not null ,
  affiliate_number_of_logons int(11) default '0' not null ,
  affiliate_date_account_created datetime default '0001-01-01 01:01:01' not null ,
  affiliate_date_account_last_modified datetime default '0001-01-01 01:01:01' not null ,
  affiliate_lft int(11) not null ,
  affiliate_rgt int(11) not null ,
  affiliate_root int(11) not null ,
  affiliate_newsletter char(1) default '1' not null ,
  PRIMARY KEY (affiliate_id)
);

drop table if exists affiliate_banners;
create table affiliate_banners (
  affiliate_banners_id int(11) not null auto_increment,
  affiliate_banners_title varchar(64) not null ,
  affiliate_products_id int(11) default '0' not null ,
  affiliate_category_id int(11) default '0' not null ,
  affiliate_banners_image varchar(64) not null ,
  affiliate_banners_group varchar(10) not null ,
  affiliate_banners_html_text text ,
  affiliate_expires_impressions int(7) default '0' ,
  affiliate_expires_date datetime ,
  affiliate_date_scheduled datetime ,
  affiliate_date_added datetime default '0001-01-01 01:01:01' not null ,
  affiliate_date_status_change datetime ,
  affiliate_status int(1) default '1' not null ,
  PRIMARY KEY (affiliate_banners_id)
);

drop table if exists affiliate_banners_history;
create table affiliate_banners_history (
  affiliate_banners_history_id int(11) not null auto_increment,
  affiliate_banners_products_id int(11) default '0' not null ,
  affiliate_banners_id int(11) default '0' not null ,
  affiliate_banners_affiliate_id int(11) default '0' not null ,
  affiliate_banners_shown int(11) default '0' not null ,
  affiliate_banners_clicks tinyint(4) default '0' not null ,
  affiliate_banners_history_date date default '0001-01-01' not null ,
  PRIMARY KEY (affiliate_banners_history_id, affiliate_banners_products_id)
);

drop table if exists affiliate_clickthroughs;
create table affiliate_clickthroughs (
  affiliate_clickthrough_id int(11) not null auto_increment,
  affiliate_id int(11) default '0' not null ,
  affiliate_clientdate datetime default '0001-01-01 01:01:01' not null ,
  affiliate_clientbrowser varchar(200) default 'Could Not Find This Data' ,
  affiliate_clientip varchar(50) default 'Could Not Find This Data' ,
  affiliate_clientreferer varchar(200) default 'none detected (maybe a direct link)' ,
  affiliate_products_id int(11) default '0' ,
  affiliate_banner_id int(11) default '0' not null ,
  PRIMARY KEY (affiliate_clickthrough_id),
  KEY refid (affiliate_id)
);

drop table if exists affiliate_news;
create table affiliate_news (
  news_id int(11) not null auto_increment,
  date_added datetime default '0001-01-01 01:01:01' not null ,
  news_status tinyint(1) default '0' not null ,
  PRIMARY KEY (news_id)
);

drop table if exists affiliate_news_contents;
create table affiliate_news_contents (
  affiliate_news_contents_id int(11) not null auto_increment,
  affiliate_news_id int(11) default '0' not null ,
  affiliate_news_languages_id int(11) default '0' not null ,
  affiliate_news_headlines varchar(255) not null ,
  affiliate_news_contents text not null ,
  PRIMARY KEY (affiliate_news_contents_id),
  KEY affiliate_news_id (affiliate_news_id),
  KEY affiliate_news_languages_id (affiliate_news_languages_id)
);

drop table if exists affiliate_newsletters;
create table affiliate_newsletters (
  affiliate_newsletters_id int(11) not null auto_increment,
  title varchar(255) not null ,
  content text not null ,
  module varchar(255) not null ,
  date_added datetime default '0001-01-01 01:01:01' not null ,
  date_sent datetime ,
  status int(1) ,
  locked int(1) default '0' ,
  PRIMARY KEY (affiliate_newsletters_id)
);

drop table if exists affiliate_payment;
create table affiliate_payment (
  affiliate_payment_id int(11) not null auto_increment,
  affiliate_id int(11) default '0' not null ,
  affiliate_payment decimal(15,2) default '0.00' not null ,
  affiliate_payment_tax decimal(15,2) default '0.00' not null ,
  affiliate_payment_total decimal(15,2) default '0.00' not null ,
  affiliate_payment_date datetime default '0001-01-01 01:01:01' not null ,
  affiliate_payment_last_modified datetime default '0001-01-01 01:01:01' not null ,
  affiliate_payment_status int(5) default '0' not null ,
  affiliate_firstname varchar(32) not null ,
  affiliate_lastname varchar(32) not null ,
  affiliate_street_address varchar(64) not null ,
  affiliate_suburb varchar(64) not null ,
  affiliate_city varchar(32) not null ,
  affiliate_postcode varchar(10) not null ,
  affiliate_country varchar(32) default '0' not null ,
  affiliate_company varchar(60) not null ,
  affiliate_state varchar(32) default '0' not null ,
  affiliate_address_format_id int(5) default '0' not null ,
  affiliate_last_modified datetime default '0001-01-01 01:01:01' not null ,
  PRIMARY KEY (affiliate_payment_id)
);

drop table if exists affiliate_payment_status;
create table affiliate_payment_status (
  affiliate_payment_status_id int(11) default '0' not null ,
  affiliate_language_id int(11) default '1' not null ,
  affiliate_payment_status_name varchar(32) not null ,
  PRIMARY KEY (affiliate_payment_status_id, affiliate_language_id),
  KEY idx_affiliate_payment_status_name (affiliate_payment_status_name)
);

insert into affiliate_payment_status (affiliate_payment_status_id, affiliate_language_id, affiliate_payment_status_name) values ('1', '2', 'Ausgezahlt');
insert into affiliate_payment_status (affiliate_payment_status_id, affiliate_language_id, affiliate_payment_status_name) values ('0', '2', 'Offen');
insert into affiliate_payment_status (affiliate_payment_status_id, affiliate_language_id, affiliate_payment_status_name) values ('1', '3', 'Pagado');
insert into affiliate_payment_status (affiliate_payment_status_id, affiliate_language_id, affiliate_payment_status_name) values ('1', '1', 'Paid');
insert into affiliate_payment_status (affiliate_payment_status_id, affiliate_language_id, affiliate_payment_status_name) values ('0', '3', 'Pendiente');
insert into affiliate_payment_status (affiliate_payment_status_id, affiliate_language_id, affiliate_payment_status_name) values ('0', '1', 'Pending');
drop table if exists affiliate_payment_status_history;
create table affiliate_payment_status_history (
  affiliate_status_history_id int(11) not null auto_increment,
  affiliate_payment_id int(11) default '0' not null ,
  affiliate_new_value int(5) default '0' not null ,
  affiliate_old_value int(5) ,
  affiliate_date_added datetime default '0001-01-01 01:01:01' not null ,
  affiliate_notified int(1) default '0' ,
  PRIMARY KEY (affiliate_status_history_id)
);

drop table if exists affiliate_sales;
create table affiliate_sales (
  affiliate_id int(11) default '0' not null ,
  affiliate_date datetime default '0001-01-01 01:01:01' not null ,
  affiliate_browser varchar(100) not null ,
  affiliate_ipaddress varchar(20) not null ,
  affiliate_orders_id int(11) default '0' not null ,
  affiliate_value decimal(15,2) default '0.00' not null ,
  affiliate_payment decimal(15,2) default '0.00' not null ,
  affiliate_clickthroughs_id int(11) default '0' not null ,
  affiliate_billing_status int(5) default '0' not null ,
  affiliate_payment_date datetime not null ,
  affiliate_payment_id int(11) default '0' not null ,
  affiliate_percent decimal(4,2) default '0.00' not null ,
  affiliate_salesman int(11) default '0' not null ,
  PRIMARY KEY (affiliate_orders_id, affiliate_id)
);

drop table if exists article_reviews;
create table article_reviews (
  reviews_id int(11) not null auto_increment,
  articles_id int(11) default '0' not null ,
  customers_id int(11) ,
  customers_name varchar(64) not null ,
  reviews_rating int(1) ,
  date_added datetime ,
  last_modified datetime ,
  reviews_read int(5) default '0' not null ,
  approved tinyint(3) unsigned default '0' ,
  PRIMARY KEY (reviews_id)
);

drop table if exists article_reviews_description;
create table article_reviews_description (
  reviews_id int(11) default '0' not null ,
  languages_id int(11) default '0' not null ,
  reviews_text text not null ,
  PRIMARY KEY (reviews_id, languages_id)
);

drop table if exists articles;
create table articles (
  articles_id int(11) not null auto_increment,
  articles_date_added datetime not null ,
  articles_last_modified datetime ,
  articles_date_available datetime ,
  articles_status tinyint(1) default '0' not null ,
  articles_index_status tinyint(1) default '0' not null ,
  authors_id int(11) ,
  PRIMARY KEY (articles_id),
  KEY idx_articles_date_added (articles_date_added)
);

drop table if exists articles_description;
create table articles_description (
  articles_id int(11) not null auto_increment,
  language_id int(11) default '1' not null ,
  articles_name varchar(64) not null ,
  articles_description text ,
  articles_url varchar(255) ,
  articles_viewed int(5) default '0' ,
  articles_head_title_tag varchar(80) ,
  articles_head_desc_tag text ,
  articles_head_keywords_tag text ,
  PRIMARY KEY (articles_id, language_id),
  KEY articles_name (articles_name)
);

drop table if exists articles_to_topics;
create table articles_to_topics (
  articles_id int(11) default '0' not null ,
  topics_id int(11) default '0' not null ,
  PRIMARY KEY (articles_id, topics_id)
);

drop table if exists articles_xsell;
create table articles_xsell (
  ID int(10) not null auto_increment,
  articles_id int(10) unsigned default '1' not null ,
  xsell_id int(10) unsigned default '1' not null ,
  sort_order int(10) unsigned default '1' not null ,
  PRIMARY KEY (ID)
);

drop table if exists authors;
create table authors (
  authors_id int(11) not null auto_increment,
  authors_name varchar(32) not null ,
  authors_image varchar(64) ,
  date_added datetime ,
  last_modified datetime ,
  PRIMARY KEY (authors_id),
  KEY IDX_AUTHORS_NAME (authors_name)
);

insert into authors (authors_id, authors_name, authors_image, date_added, last_modified) values ('1', '', NULL, '2015-04-04 22:18:52', NULL);
drop table if exists authors_info;
create table authors_info (
  authors_id int(11) default '0' not null ,
  languages_id int(11) default '0' not null ,
  authors_description text ,
  authors_url varchar(255) not null ,
  url_clicked int(5) default '0' not null ,
  date_last_click datetime ,
  PRIMARY KEY (authors_id, languages_id)
);

insert into authors_info (authors_id, languages_id, authors_description, authors_url, url_clicked, date_last_click) values ('1', '1', '', '', '0', NULL);
insert into authors_info (authors_id, languages_id, authors_description, authors_url, url_clicked, date_last_click) values ('1', '2', '', '', '0', NULL);
insert into authors_info (authors_id, languages_id, authors_description, authors_url, url_clicked, date_last_click) values ('1', '3', '', '', '0', NULL);
drop table if exists banners;
create table banners (
  banners_id int(11) not null auto_increment,
  banners_title varchar(64) not null ,
  banners_url varchar(255) not null ,
  banners_image varchar(64) not null ,
  banners_group varchar(10) not null ,
  banners_html_text text ,
  expires_impressions int(7) default '0' ,
  expires_date datetime ,
  date_scheduled datetime ,
  date_added datetime not null ,
  date_status_change datetime ,
  status int(1) default '1' not null ,
  PRIMARY KEY (banners_id),
  KEY idx_banners_group (banners_group)
);

drop table if exists banners_history;
create table banners_history (
  banners_history_id int(11) not null auto_increment,
  banners_id int(11) not null ,
  banners_shown int(5) default '0' not null ,
  banners_clicked int(5) default '0' not null ,
  banners_history_date datetime not null ,
  PRIMARY KEY (banners_history_id),
  KEY idx_banners_history_banners_id (banners_id)
);

drop table if exists cache;
create table cache (
  cache_id varchar(32) not null ,
  cache_language_id tinyint(1) default '0' not null ,
  cache_name varchar(255) not null ,
  cache_data mediumtext not null ,
  cache_global tinyint(1) default '1' not null ,
  cache_gzip tinyint(1) default '1' not null ,
  cache_method varchar(20) default 'RETURN' not null ,
  cache_date datetime not null ,
  cache_expires datetime not null ,
  PRIMARY KEY (cache_id, cache_language_id),
  KEY cache_id (cache_id),
  KEY cache_language_id (cache_language_id),
  KEY cache_global (cache_global)
);

drop table if exists categories;
create table categories (
  categories_id int(11) not null auto_increment,
  categories_image varchar(64) ,
  parent_id int(11) default '0' not null ,
  sort_order int(3) ,
  categories_featured_until date ,
  categories_featured tinyint(1) default '0' ,
  date_added datetime ,
  last_modified datetime ,
  categories_hide_from_groups varchar(255) default '@' not null ,
  PRIMARY KEY (categories_id),
  KEY idx_categories_parent_id (parent_id)
);

drop table if exists categories_description;
create table categories_description (
  categories_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  categories_name varchar(32) not null ,
  categories_heading_title varchar(64) ,
  categories_description text ,
  PRIMARY KEY (categories_id, language_id),
  KEY idx_categories_name (categories_name)
);

drop table if exists configuration;
create table configuration (
  configuration_id int(11) not null auto_increment,
  configuration_title varchar(255) not null ,
  configuration_key varchar(255) not null ,
  configuration_value varchar(512) not null ,
  configuration_description varchar(255) not null ,
  configuration_group_id int(11) not null ,
  sort_order int(5) ,
  last_modified datetime ,
  date_added datetime not null ,
  use_function varchar(255) ,
  set_function text ,
  PRIMARY KEY (configuration_id)
);

insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1', 'CT_STORE_NAME', 'STORE_NAME', 'Test Store', 'CD_STORE_NAME', '1', '1', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2', 'CT_STORE_OWNER', 'STORE_OWNER', 'Muhammad Nauman', 'CD_STORE_OWNER', '1', '3', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3', 'CT_STORE_OWNER_EMAIL_ADDRESS', 'STORE_OWNER_EMAIL_ADDRESS', 'mhmmd.nauman@gmail.com', 'CD_STORE_OWNER_EMAIL_ADDRESS', '1', '4', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('4', 'CT_EMAIL_FROM', 'EMAIL_FROM', 'admin@yourshop.com', 'CD_EMAIL_FROM', '1', '5', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('5', 'CT_STORE_COUNTRY', 'STORE_COUNTRY', '223', 'CD_STORE_COUNTRY', '1', '6', NULL, '2015-04-04 21:02:46', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('6', 'CT_STORE_ZONE', 'STORE_ZONE', '4', 'CD_STORE_ZONE', '1', '7', NULL, '2015-04-04 21:02:46', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('7', 'CT_EXPECTED_PRODUCTS_SORT', 'EXPECTED_PRODUCTS_SORT', 'desc', 'CD_EXPECTED_PRODUCTS_SORT', '1', '8', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('8', 'CT_EXPECTED_PRODUCTS_FIELD', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'CD_EXPECTED_PRODUCTS_FIELD', '1', '9', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('9', 'CT_USE_DEFAULT_LANGUAGE_CURRENCY', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'CD_USE_DEFAULT_LANGUAGE_CURRENCY', '1', '10', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('10', 'CT_SEND_EXTRA_ORDER_EMAILS_TO', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'CD_SEND_EXTRA_ORDER_EMAILS_TO', '1', '12', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('12', 'CT_DISPLAY_CART', 'DISPLAY_CART', 'true', 'CD_DISPLAY_CART', '1', '14', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('13', 'CT_ALLOW_GUEST_TO_TELL_A_FRIEND', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'CD_ALLOW_GUEST_TO_TELL_A_FRIEND', '1', '15', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('14', 'CT_ADVANCED_SEARCH_DEFAULT_OPERATOR', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'CD_ADVANCED_SEARCH_DEFAULT_OPERATOR', '1', '17', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'and\',  \'or\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('15', 'CT_STORE_NAME_ADDRESS', 'STORE_NAME_ADDRESS', 'Store Name
Address
Country
Phone', 'CD_STORE_NAME_ADDRESS', '1', '18', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('16', 'CT_SHOW_COUNTS', 'SHOW_COUNTS', 'false', 'CD_SHOW_COUNTS', '1', '19', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('17', 'CT_TAX_DECIMAL_PLACES', 'TAX_DECIMAL_PLACES', '2', 'CD_TAX_DECIMAL_PLACES', '1', '20', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('18', 'CT_DISPLAY_PRICE_WITH_TAX', 'DISPLAY_PRICE_WITH_TAX', 'false', 'CD_DISPLAY_PRICE_WITH_TAX', '1', '21', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('19', 'CT_ENTRY_FIRST_NAME_MIN_LENGTH', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'CD_ENTRY_FIRST_NAME_MIN_LENGTH', '2', '1', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('20', 'CT_ENTRY_LAST_NAME_MIN_LENGTH', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'CD_ENTRY_LAST_NAME_MIN_LENGTH', '2', '2', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('21', 'CT_ENTRY_DOB_MIN_LENGTH', 'ENTRY_DOB_MIN_LENGTH', '10', 'CD_ENTRY_DOB_MIN_LENGTH', '2', '3', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('22', 'CT_ENTRY_EMAIL_ADDRESS_MIN_LENGTH', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'CD_ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '2', '4', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('23', 'CT_ENTRY_STREET_ADDRESS_MIN_LENGTH', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'CD_ENTRY_STREET_ADDRESS_MIN_LENGTH', '2', '5', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('24', 'CT_ENTRY_COMPANY_MIN_LENGTH', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'CD_ENTRY_COMPANY_MIN_LENGTH', '2', '6', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('25', 'CT_ENTRY_POSTCODE_MIN_LENGTH', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'CD_ENTRY_POSTCODE_MIN_LENGTH', '2', '7', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('26', 'CT_ENTRY_CITY_MIN_LENGTH', 'ENTRY_CITY_MIN_LENGTH', '3', 'CD_ENTRY_CITY_MIN_LENGTH', '2', '8', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('27', 'CT_ENTRY_STATE_MIN_LENGTH', 'ENTRY_STATE_MIN_LENGTH', '2', 'CD_ENTRY_STATE_MIN_LENGTH', '2', '9', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('28', 'CT_ENTRY_TELEPHONE_MIN_LENGTH', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'CD_ENTRY_TELEPHONE_MIN_LENGTH', '2', '10', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('29', 'CT_ENTRY_PASSWORD_MIN_LENGTH', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'CD_ENTRY_PASSWORD_MIN_LENGTH', '2', '11', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('30', 'CT_CC_OWNER_MIN_LENGTH', 'CC_OWNER_MIN_LENGTH', '3', 'CD_CC_OWNER_MIN_LENGTH', '2', '12', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('31', 'CT_CC_NUMBER_MIN_LENGTH', 'CC_NUMBER_MIN_LENGTH', '10', 'CD_CC_NUMBER_MIN_LENGTH', '2', '13', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('32', 'CT_REVIEW_TEXT_MIN_LENGTH', 'REVIEW_TEXT_MIN_LENGTH', '50', 'CD_REVIEW_TEXT_MIN_LENGTH', '2', '14', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('33', 'CT_MIN_DISPLAY_BESTSELLERS', 'MIN_DISPLAY_BESTSELLERS', '1', 'CD_MIN_DISPLAY_BESTSELLERS', '2', '15', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('34', 'CT_MIN_DISPLAY_ALSO_PURCHASED', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'CD_MIN_DISPLAY_ALSO_PURCHASED', '2', '16', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('35', 'CT_MAX_ADDRESS_BOOK_ENTRIES', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'CD_MAX_ADDRESS_BOOK_ENTRIES', '3', '1', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('36', 'CT_MAX_CATALOG_DISPLAY_SEARCH_RESULTS', 'MAX_CATALOG_DISPLAY_SEARCH_RESULTS', '20', 'CD_MAX_CATALOG_DISPLAY_SEARCH_RESULTS', '3', '2', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('37', 'CT_MAX_DISPLAY_PAGE_LINKS', 'MAX_DISPLAY_PAGE_LINKS', '5', 'CD_MAX_DISPLAY_PAGE_LINKS', '3', '3', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('38', 'CT_MAX_DISPLAY_SPECIAL_PRODUCTS', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'CD_MAX_DISPLAY_SPECIAL_PRODUCTS', '3', '4', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('39', 'CT_MAX_DISPLAY_NEW_PRODUCTS', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'CD_MAX_DISPLAY_NEW_PRODUCTS', '3', '5', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('40', 'CT_MAX_DISPLAY_UPCOMING_PRODUCTS', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'CD_MAX_DISPLAY_UPCOMING_PRODUCTS', '3', '6', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('41', 'CT_MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'CD_MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '3', '7', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('42', 'CT_MAX_MANUFACTURERS_LIST', 'MAX_MANUFACTURERS_LIST', '1', 'CD_MAX_MANUFACTURERS_LIST', '3', '7', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('43', 'CT_MAX_DISPLAY_MANUFACTURER_NAME_LEN', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'CD_MAX_DISPLAY_MANUFACTURER_NAME_LEN', '3', '8', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('44', 'CT_MAX_DISPLAY_NEW_REVIEWS', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'CD_MAX_DISPLAY_NEW_REVIEWS', '3', '9', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('45', 'CT_MAX_RANDOM_SELECT_REVIEWS', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'CD_MAX_RANDOM_SELECT_REVIEWS', '3', '10', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('46', 'CT_MAX_RANDOM_SELECT_NEW', 'MAX_RANDOM_SELECT_NEW', '10', 'CD_MAX_RANDOM_SELECT_NEW', '3', '11', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('47', 'CT_MAX_RANDOM_SELECT_SPECIALS', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'CD_MAX_RANDOM_SELECT_SPECIALS', '3', '12', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('48', 'CT_MAX_DISPLAY_CATEGORIES_PER_ROW', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'CD_MAX_DISPLAY_CATEGORIES_PER_ROW', '3', '13', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('49', 'CT_MAX_DISPLAY_PRODUCTS_NEW', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'CD_MAX_DISPLAY_PRODUCTS_NEW', '3', '14', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('50', 'CT_MAX_DISPLAY_BESTSELLERS', 'MAX_DISPLAY_BESTSELLERS', '10', 'CD_MAX_DISPLAY_BESTSELLERS', '3', '15', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('51', 'CT_MAX_DISPLAY_ALSO_PURCHASED', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'CD_MAX_DISPLAY_ALSO_PURCHASED', '3', '16', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('52', 'CT_MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'CD_MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '3', '17', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('53', 'CT_MAX_DISPLAY_ORDER_HISTORY', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'CD_MAX_DISPLAY_ORDER_HISTORY', '3', '18', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('54', 'CT_MAX_QTY_IN_CART', 'MAX_QTY_IN_CART', '99', 'CD_MAX_QTY_IN_CART', '3', '19', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('55', 'CT_SMALL_IMAGE_WIDTH', 'SMALL_IMAGE_WIDTH', '120', 'CD_SMALL_IMAGE_WIDTH', '4', '5', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('56', 'CT_SMALL_IMAGE_HEIGHT', 'SMALL_IMAGE_HEIGHT', '', 'CD_SMALL_IMAGE_HEIGHT', '4', '6', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('57', 'CT_HEADING_IMAGE_WIDTH', 'HEADING_IMAGE_WIDTH', '100', 'CD_HEADING_IMAGE_WIDTH', '4', '8', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('58', 'CT_HEADING_IMAGE_HEIGHT', 'HEADING_IMAGE_HEIGHT', '', 'CD_HEADING_IMAGE_HEIGHT', '4', '9', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('59', 'CT_SUBCATEGORY_IMAGE_WIDTH', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'CD_SUBCATEGORY_IMAGE_WIDTH', '4', '10', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('60', 'CT_SUBCATEGORY_IMAGE_HEIGHT', 'SUBCATEGORY_IMAGE_HEIGHT', '', 'CD_SUBCATEGORY_IMAGE_HEIGHT', '4', '11', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('61', 'CT_CONFIG_CALCULATE_IMAGE_SIZE', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'CD_CONFIG_CALCULATE_IMAGE_SIZE', '4', '4', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('62', 'CT_CATEGORY_IMAGE_REQUIRED', 'CATEGORY_IMAGE_REQUIRED', 'true', 'CD_CATEGORY_IMAGE_REQUIRED', '4', '1', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('63', 'CT_ACCOUNT_GENDER', 'ACCOUNT_GENDER', 'false', 'CD_ACCOUNT_GENDER', '5', '1', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('64', 'CT_ACCOUNT_DOB', 'ACCOUNT_DOB', 'false', 'CD_ACCOUNT_DOB', '5', '2', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('65', 'CT_ACCOUNT_COMPANY', 'ACCOUNT_COMPANY', 'false', 'CD_ACCOUNT_COMPANY', '5', '3', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('66', 'CT_ACCOUNT_SUBURB', 'ACCOUNT_SUBURB', 'false', 'CD_ACCOUNT_SUBURB', '5', '4', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('67', 'CT_ACCOUNT_STATE', 'ACCOUNT_STATE', 'true', 'CD_ACCOUNT_STATE', '5', '5', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('68', 'CT_MODULE_PAYMENT_INSTALLED', 'MODULE_PAYMENT_INSTALLED', '', 'CD_MODULE_PAYMENT_INSTALLED', '6', '0', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('69', 'CT_MODULE_ORDER_TOTAL_INSTALLED', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_tax.php;ot_loyalty_discount.php;ot_loworderfee.php;ot_coupon.php;ot_gv.php;ot_total.php', 'CD_MODULE_ORDER_TOTAL_INSTALLED', '6', '0', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('70', 'CT_MODULE_SHIPPING_INSTALLED', 'MODULE_SHIPPING_INSTALLED', '', 'CD_MODULE_SHIPPING_INSTALLED', '6', '0', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('77', 'CT_GOOGLE_MAPS_KEY', 'GOOGLE_MAPS_KEY', 'YOURKEY', 'CD_GOOGLE_MAPS_KEY', '89', '25', NULL, '2015-04-04 21:02:53', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('85', 'CT_DEFAULT_CURRENCY', 'DEFAULT_CURRENCY', 'USD', 'CD_DEFAULT_CURRENCY', '6', '0', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('86', 'CT_DEFAULT_LANGUAGE', 'DEFAULT_LANGUAGE', 'en', 'CD_DEFAULT_LANGUAGE', '6', '0', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('87', 'CT_DEFAULT_ORDERS_STATUS_ID', 'DEFAULT_ORDERS_STATUS_ID', '1', 'CD_DEFAULT_ORDERS_STATUS_ID', '6', '0', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('88', 'CT_MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'CD_MODULE_ORDER_TOTAL_SHIPPING_STATUS', '6', '1', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('89', 'CT_MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '7', 'CD_MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '6', '2', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('90', 'CT_MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'CD_MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', '6', '3', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('91', 'CT_MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'CD_MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '6', '4', NULL, '2015-04-04 21:02:48', 'currencies->format', NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('92', 'CT_MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'CD_MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', '6', '5', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('93', 'CT_MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'CD_MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', '6', '1', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('94', 'CT_MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'CD_MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '6', '2', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('95', 'CT_MODULE_ORDER_TOTAL_TAX_STATUS', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'CD_MODULE_ORDER_TOTAL_TAX_STATUS', '6', '1', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('96', 'CT_MODULE_ORDER_TOTAL_TAX_SORT_ORDER', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '11', 'CD_MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '6', '2', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('97', 'CT_MODULE_ORDER_TOTAL_TOTAL_STATUS', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'CD_MODULE_ORDER_TOTAL_TOTAL_STATUS', '6', '1', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('98', 'CT_MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '15', 'CD_MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '6', '2', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('99', 'CT_SHIPPING_ORIGIN_COUNTRY', 'SHIPPING_ORIGIN_COUNTRY', '223', 'CD_SHIPPING_ORIGIN_COUNTRY', '7', '1', NULL, '2015-04-04 21:02:48', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('100', 'CT_SHIPPING_ORIGIN_ZIP', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'CD_SHIPPING_ORIGIN_ZIP', '7', '2', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('101', 'CT_SHIPPING_MAX_WEIGHT', 'SHIPPING_MAX_WEIGHT', '50', 'CD_SHIPPING_MAX_WEIGHT', '7', '3', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('102', 'CT_SHIPPING_BOX_WEIGHT', 'SHIPPING_BOX_WEIGHT', '1', 'CD_SHIPPING_BOX_WEIGHT', '7', '4', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('103', 'CT_SHIPPING_BOX_PADDING', 'SHIPPING_BOX_PADDING', '10', 'CD_SHIPPING_BOX_PADDING', '7', '5', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('104', 'CT_PRODUCT_LIST_IMAGE', 'PRODUCT_LIST_IMAGE', '2', 'CD_PRODUCT_LIST_IMAGE', '8', '2', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('105', 'CT_PRODUCT_LIST_MANUFACTURER', 'PRODUCT_LIST_MANUFACTURER', '0', 'CD_PRODUCT_LIST_MANUFACTURER', '8', '3', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('106', 'CT_PRODUCT_LIST_MODEL', 'PRODUCT_LIST_MODEL', '0', 'CD_PRODUCT_LIST_MODEL', '8', '4', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('107', 'CT_PRODUCT_LIST_NAME', 'PRODUCT_LIST_NAME', '3', 'CD_PRODUCT_LIST_NAME', '8', '5', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('108', 'CT_PRODUCT_LIST_PRICE', 'PRODUCT_LIST_PRICE', '4', 'CD_PRODUCT_LIST_PRICE', '8', '6', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('109', 'CT_PRODUCT_LIST_QUANTITY', 'PRODUCT_LIST_QUANTITY', '0', 'CD_PRODUCT_LIST_QUANTITY', '8', '7', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('110', 'CT_PRODUCT_LIST_WEIGHT', 'PRODUCT_LIST_WEIGHT', '0', 'CD_PRODUCT_LIST_WEIGHT', '8', '8', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('111', 'CT_PRODUCT_LIST_BUY_NOW', 'PRODUCT_LIST_BUY_NOW', '5', 'CD_PRODUCT_LIST_BUY_NOW', '8', '9', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('112', 'CT_PRODUCT_LIST_FILTER', 'PRODUCT_LIST_FILTER', '1', 'CD_PRODUCT_LIST_FILTER', '8', '10', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('113', 'CT_PREV_NEXT_BAR_LOCATION', 'PREV_NEXT_BAR_LOCATION', '3', 'CD_PREV_NEXT_BAR_LOCATION', '8', '11', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('114', 'CT_STOCK_CHECK', 'STOCK_CHECK', 'true', 'CD_STOCK_CHECK', '9', '1', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('115', 'CT_STOCK_LIMITED', 'STOCK_LIMITED', 'true', 'CD_STOCK_LIMITED', '9', '2', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('116', 'CT_STOCK_ALLOW_CHECKOUT', 'STOCK_ALLOW_CHECKOUT', 'true', 'CD_STOCK_ALLOW_CHECKOUT', '9', '3', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('117', 'CT_STOCK_MARK_PRODUCT_OUT_OF_STOCK', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'CD_STOCK_MARK_PRODUCT_OUT_OF_STOCK', '9', '4', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('118', 'CT_STOCK_REORDER_LEVEL', 'STOCK_REORDER_LEVEL', '5', 'CD_STOCK_REORDER_LEVEL', '9', '5', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('119', 'CT_STORE_PAGE_PARSE_TIME', 'STORE_PAGE_PARSE_TIME', 'false', 'CD_STORE_PAGE_PARSE_TIME', '10', '1', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('120', 'CT_STORE_PAGE_PARSE_TIME_LOG', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'CD_STORE_PAGE_PARSE_TIME_LOG', '10', '2', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('121', 'CT_STORE_PARSE_DATE_TIME_FORMAT', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'CD_STORE_PARSE_DATE_TIME_FORMAT', '10', '3', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('122', 'CT_DISPLAY_PAGE_PARSE_TIME', 'DISPLAY_PAGE_PARSE_TIME', 'false', 'CD_DISPLAY_PAGE_PARSE_TIME', '10', '5', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('123', 'CT_STORE_DB_TRANSACTIONS', 'STORE_DB_TRANSACTIONS', 'false', 'CD_STORE_DB_TRANSACTIONS', '10', '4', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('124', 'CT_USE_CACHE', 'USE_CACHE', 'false', 'CD_USE_CACHE', '11', '1', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('125', 'CT_DIR_FS_CACHE', 'DIR_FS_CACHE', 'cache/', 'CD_DIR_FS_CACHE', '11', '2', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('126', 'CT_EMAIL_TRANSPORT', 'EMAIL_TRANSPORT', 'sendmail', 'CD_EMAIL_TRANSPORT', '12', '1', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('127', 'CT_EMAIL_LINEFEED', 'EMAIL_LINEFEED', 'LF', 'CD_EMAIL_LINEFEED', '12', '2', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('128', 'CT_EMAIL_USE_HTML', 'EMAIL_USE_HTML', 'false', 'CD_EMAIL_USE_HTML', '12', '3', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('129', 'CT_ENTRY_EMAIL_ADDRESS_CHECK', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'CD_ENTRY_EMAIL_ADDRESS_CHECK', '12', '4', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('130', 'CT_SEND_EMAILS', 'SEND_EMAILS', 'true', 'CD_SEND_EMAILS', '12', '5', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('131', 'CT_DOWNLOAD_ENABLED', 'DOWNLOAD_ENABLED', 'true', 'CD_DOWNLOAD_ENABLED', '13', '1', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('132', 'CT_DOWNLOAD_BY_REDIRECT', 'DOWNLOAD_BY_REDIRECT', 'true', 'CD_DOWNLOAD_BY_REDIRECT', '13', '2', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('133', 'CT_DOWNLOAD_MAX_DAYS', 'DOWNLOAD_MAX_DAYS', '7', 'CD_DOWNLOAD_MAX_DAYS', '13', '3', NULL, '2015-04-04 21:02:49', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('134', 'CT_DOWNLOAD_MAX_COUNT', 'DOWNLOAD_MAX_COUNT', '5', 'CD_DOWNLOAD_MAX_COUNT', '13', '4', NULL, '2015-04-04 21:02:49', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('135', 'CT_GZIP_COMPRESSION', 'GZIP_COMPRESSION', 'false', 'CD_GZIP_COMPRESSION', '14', '1', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('136', 'CT_GZIP_LEVEL', 'GZIP_LEVEL', '5', 'CD_GZIP_LEVEL', '14', '2', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('137', 'CT_SESSION_WRITE_DIRECTORY', 'SESSION_WRITE_DIRECTORY', '/tmp', 'CD_SESSION_WRITE_DIRECTORY', '15', '1', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('138', 'CT_SESSION_FORCE_COOKIE_USE', 'SESSION_FORCE_COOKIE_USE', 'False', 'CD_SESSION_FORCE_COOKIE_USE', '15', '2', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('139', 'CT_SESSION_CHECK_SSL_SESSION_ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'CD_SESSION_CHECK_SSL_SESSION_ID', '15', '3', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('140', 'CT_SESSION_CHECK_USER_AGENT', 'SESSION_CHECK_USER_AGENT', 'False', 'CD_SESSION_CHECK_USER_AGENT', '15', '4', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('141', 'CT_SESSION_CHECK_IP_ADDRESS', 'SESSION_CHECK_IP_ADDRESS', 'False', 'CD_SESSION_CHECK_IP_ADDRESS', '15', '5', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('142', 'CT_SESSION_BLOCK_SPIDERS', 'SESSION_BLOCK_SPIDERS', 'True', 'CD_SESSION_BLOCK_SPIDERS', '15', '6', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('143', 'CT_SESSION_RECREATE', 'SESSION_RECREATE', 'True', 'CD_SESSION_RECREATE', '15', '7', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('144', 'CT_HTML_AREA_WYSIWYG_DISABLE', 'HTML_AREA_WYSIWYG_DISABLE', 'Enable', 'CD_HTML_AREA_WYSIWYG_DISABLE', '25', '0', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'Enable\', \'Disable\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('148', 'CT_HTML_AREA_WYSIWYG_DISABLE_EMAIL', 'HTML_AREA_WYSIWYG_DISABLE_EMAIL', 'Enable', 'CD_HTML_AREA_WYSIWYG_DISABLE_EMAIL', '25', '20', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'Enable\', \'Disable\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('152', 'CT_HTML_AREA_WYSIWYG_DISABLE_NEWSLETTER', 'HTML_AREA_WYSIWYG_DISABLE_NEWSLETTER', 'Enable', 'CD_HTML_AREA_WYSIWYG_DISABLE_NEWSLETTER', '25', '30', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'Enable\', \'Disable\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('156', 'CT_HTML_AREA_WYSIWYG_DISABLE_DEFINE', 'HTML_AREA_WYSIWYG_DISABLE_DEFINE', 'Enable', 'CD_HTML_AREA_WYSIWYG_DISABLE_DEFINE', '25', '40', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'Enable\', \'Disable\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('178', 'CT_MODULE_ORDER_TOTAL_COUPON_STATUS', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', 'CD_MODULE_ORDER_TOTAL_COUPON_STATUS', '6', '1', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('179', 'CT_MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '9', 'CD_MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '6', '2', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('180', 'CT_MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'true', 'CD_MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', '6', '5', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('181', 'CT_MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', 'CD_MODULE_ORDER_TOTAL_COUPON_INC_TAX', '6', '6', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('182', 'CT_MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'None', 'CD_MODULE_ORDER_TOTAL_COUPON_CALC_TAX', '6', '7', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('183', 'CT_MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', 'CD_MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '6', '0', NULL, '2015-04-04 21:02:48', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('184', 'CT_MODULE_ORDER_TOTAL_GV_STATUS', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', 'CD_MODULE_ORDER_TOTAL_GV_STATUS', '6', '1', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('185', 'CT_MODULE_ORDER_TOTAL_GV_SORT_ORDER', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '13', 'CD_MODULE_ORDER_TOTAL_GV_SORT_ORDER', '6', '2', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('186', 'CT_MODULE_ORDER_TOTAL_GV_QUEUE', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', 'CD_MODULE_ORDER_TOTAL_GV_QUEUE', '6', '3', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('187', 'CT_MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', 'CD_MODULE_ORDER_TOTAL_GV_INC_SHIPPING', '6', '5', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('188', 'CT_MODULE_ORDER_TOTAL_GV_INC_TAX', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'false', 'CD_MODULE_ORDER_TOTAL_GV_INC_TAX', '6', '6', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('189', 'CT_MODULE_ORDER_TOTAL_GV_CALC_TAX', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', 'CD_MODULE_ORDER_TOTAL_GV_CALC_TAX', '6', '7', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('190', 'CT_MODULE_ORDER_TOTAL_GV_TAX_CLASS', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', 'CD_MODULE_ORDER_TOTAL_GV_TAX_CLASS', '6', '0', NULL, '2015-04-04 21:02:48', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('191', 'CT_MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', 'CD_MODULE_ORDER_TOTAL_GV_CREDIT_TAX', '6', '8', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('192', 'CT_ALLOW_CATEGORY_DESCRIPTIONS', 'ALLOW_CATEGORY_DESCRIPTIONS', 'true', 'CD_ALLOW_CATEGORY_DESCRIPTIONS', '8', '11', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('193', 'CT_MAX_DISPLAY_SEARCH_RESULTS', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'CD_MAX_DISPLAY_SEARCH_RESULTS', '3', '2', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('358', 'CT_DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '100000', 'CD_DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '13', '90', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('360', 'CT_DOWNLOADS_CONTROLLER_ORDERS_STATUS', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', 'CD_DOWNLOADS_CONTROLLER_ORDERS_STATUS', '13', '92', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('378', 'CT_DOWN_FOR_MAINTENANCE', 'DOWN_FOR_MAINTENANCE', 'false', 'CD_DOWN_FOR_MAINTENANCE', '16', '1', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('379', 'CT_DOWN_FOR_MAINTENANCE_FILENAME', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance.php', 'CD_DOWN_FOR_MAINTENANCE_FILENAME', '16', '2', NULL, '2015-04-04 21:02:49', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('380', 'CT_DOWN_FOR_MAINTENANCE_HEADER_OFF', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'true', 'CD_DOWN_FOR_MAINTENANCE_HEADER_OFF', '16', '3', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('381', 'CT_DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'true', 'CD_DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', '16', '4', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('382', 'CT_DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'true', 'CD_DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', '16', '5', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('383', 'CT_DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'true', 'CD_DOWN_FOR_MAINTENANCE_FOOTER_OFF', '16', '6', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('384', 'CT_DOWN_FOR_MAINTENANCE_PRICES_OFF', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', 'CD_DOWN_FOR_MAINTENANCE_PRICES_OFF', '16', '7', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('385', 'CT_EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', '', 'CD_EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', '16', '8', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('386', 'CT_WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', 'CD_WARN_BEFORE_DOWN_FOR_MAINTENANCE', '16', '9', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('387', 'CT_PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '16/05/2003 between the hours of 2-3 PM', 'CD_PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '16', '10', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('388', 'CT_DISPLAY_MAINTENANCE_TIME', 'DISPLAY_MAINTENANCE_TIME', 'true', 'CD_DISPLAY_MAINTENANCE_TIME', '16', '11', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('389', 'CT_DISPLAY_MAINTENANCE_PERIOD', 'DISPLAY_MAINTENANCE_PERIOD', 'true', 'CD_DISPLAY_MAINTENANCE_PERIOD', '16', '12', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('390', 'CT_TEXT_MAINTENANCE_PERIOD_TIME', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', 'CD_TEXT_MAINTENANCE_PERIOD_TIME', '16', '13', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('391', 'CT_TEXT_DATE_TIME', 'TEXT_DATE_TIME', '2008-05-03 14:23:52', 'CD_TEXT_DATE_TIME', '16', '14', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('392', 'CT_DOWN_FOR_MAINTENANCE_INFO_ID', 'DOWN_FOR_MAINTENANCE_INFO_ID', '12', 'CD_DOWN_FOR_MAINTENANCE_INFO_ID', '16', '15', NULL, '2015-04-04 21:02:49', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('455', 'CT_NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '0', 'CD_NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '1', '24', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('456', 'CT_NEW_SIGNUP_DISCOUNT_COUPON', 'NEW_SIGNUP_DISCOUNT_COUPON', '', 'CD_NEW_SIGNUP_DISCOUNT_COUPON', '1', '25', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('457', 'CT_DIR_WS_TEMPLATES_DEFAULT', 'DIR_WS_TEMPLATES_DEFAULT', 'cigars-now', 'CD_DIR_WS_TEMPLATES_DEFAULT', '201', '1', '2015-04-04 21:45:03', '2015-04-04 21:02:53', NULL, 'tep_cfg_pull_down_templates(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('458', 'CT_TEMPLATE_SWITCHING_ALLOWED', 'TEMPLATE_SWITCHING_ALLOWED', 'false', 'CD_TEMPLATE_SWITCHING_ALLOWED', '201', '2', NULL, '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('459', 'CT_TEMPLATE_SWITCHING_MENU', 'TEMPLATE_SWITCHING_MENU', 'false', 'CD_TEMPLATE_SWITCHING_MENU', '201', '4', NULL, '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('497', 'CT_IMAGEZOOMER', 'IMAGEZOOMER', 'true', 'CD_IMAGEZOOMER', '47', '1', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('498', 'CT_DYNAMIC_MOPICS_PRODUCTS_DIR', 'DYNAMIC_MOPICS_PRODUCTS_DIR', 'products/', 'CD_DYNAMIC_MOPICS_PRODUCTS_DIR', '45', '0', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('499', 'CT_DYNAMIC_MOPICS_BIGIMAGES_DIR', 'DYNAMIC_MOPICS_BIGIMAGES_DIR', 'images_big/', 'CD_DYNAMIC_MOPICS_BIGIMAGES_DIR', '45', '0', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('500', 'CT_DYNAMIC_MOPICS_THUMBS_DIR', 'DYNAMIC_MOPICS_THUMBS_DIR', 'thumbs/', 'CD_DYNAMIC_MOPICS_THUMBS_DIR', '45', '0', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('502', 'CT_DYNAMIC_MOPICS_PATTERN', 'DYNAMIC_MOPICS_PATTERN', 'imagebase_{1}', 'CD_DYNAMIC_MOPICS_PATTERN', '45', '1', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('503', 'CT_DYNAMIC_MOPICS_THUMB_IMAGE_TYPES', 'DYNAMIC_MOPICS_THUMB_IMAGE_TYPES', 'jpg,gif,jpeg,tiff,png,bmp', 'CD_DYNAMIC_MOPICS_THUMB_IMAGE_TYPES', '45', '0', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('504', 'CT_DYNAMIC_MOPICS_BIG_IMAGE_TYPES', 'DYNAMIC_MOPICS_BIG_IMAGE_TYPES', 'jpg,gif,jpeg,tiff,png,bmp', 'CD_DYNAMIC_MOPICS_BIG_IMAGE_TYPES', '45', '0', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('505', 'CT_DISPLAY_NEW_ARTICLES', 'DISPLAY_NEW_ARTICLES', 'false', 'CD_DISPLAY_NEW_ARTICLES', '456', '1', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('506', 'CT_NEW_ARTICLES_DAYS_DISPLAY', 'NEW_ARTICLES_DAYS_DISPLAY', '30', 'CD_NEW_ARTICLES_DAYS_DISPLAY', '456', '2', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('507', 'CT_MAX_NEW_ARTICLES_PER_PAGE', 'MAX_NEW_ARTICLES_PER_PAGE', '10', 'CD_MAX_NEW_ARTICLES_PER_PAGE', '456', '3', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('508', 'CT_DISPLAY_ALL_ARTICLES', 'DISPLAY_ALL_ARTICLES', 'true', 'CD_DISPLAY_ALL_ARTICLES', '456', '4', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('509', 'CT_MAX_ARTICLES_PER_PAGE', 'MAX_ARTICLES_PER_PAGE', '10', 'CD_MAX_ARTICLES_PER_PAGE', '456', '5', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('510', 'CT_MAX_DISPLAY_UPCOMING_ARTICLES', 'MAX_DISPLAY_UPCOMING_ARTICLES', '5', 'CD_MAX_DISPLAY_UPCOMING_ARTICLES', '456', '6', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('511', 'CT_ENABLE_ARTICLE_REVIEWS', 'ENABLE_ARTICLE_REVIEWS', 'true', 'CD_ENABLE_ARTICLE_REVIEWS', '456', '7', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('512', 'CT_ENABLE_TELL_A_FRIEND_ARTICLE', 'ENABLE_TELL_A_FRIEND_ARTICLE', 'true', 'CD_ENABLE_TELL_A_FRIEND_ARTICLE', '456', '8', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('513', 'CT_MIN_DISPLAY_ARTICLES_XSELL', 'MIN_DISPLAY_ARTICLES_XSELL', '1', 'CD_MIN_DISPLAY_ARTICLES_XSELL', '456', '9', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('514', 'CT_MAX_DISPLAY_ARTICLES_XSELL', 'MAX_DISPLAY_ARTICLES_XSELL', '6', 'CD_MAX_DISPLAY_ARTICLES_XSELL', '456', '10', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('515', 'CT_SHOW_ARTICLE_COUNTS', 'SHOW_ARTICLE_COUNTS', 'true', 'CD_SHOW_ARTICLE_COUNTS', '456', '11', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('516', 'CT_MAX_DISPLAY_AUTHOR_NAME_LEN', 'MAX_DISPLAY_AUTHOR_NAME_LEN', '20', 'CD_MAX_DISPLAY_AUTHOR_NAME_LEN', '456', '12', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('517', 'CT_MAX_DISPLAY_AUTHORS_IN_A_LIST', 'MAX_DISPLAY_AUTHORS_IN_A_LIST', '1', 'CD_MAX_DISPLAY_AUTHORS_IN_A_LIST', '456', '13', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('518', 'CT_MAX_AUTHORS_LIST', 'MAX_AUTHORS_LIST', '1', 'CD_MAX_AUTHORS_LIST', '456', '14', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('519', 'CT_DISPLAY_AUTHOR_ARTICLE_LISTING', 'DISPLAY_AUTHOR_ARTICLE_LISTING', 'true', 'CD_DISPLAY_AUTHOR_ARTICLE_LISTING', '456', '15', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('520', 'CT_DISPLAY_TOPIC_ARTICLE_LISTING', 'DISPLAY_TOPIC_ARTICLE_LISTING', 'true', 'CD_DISPLAY_TOPIC_ARTICLE_LISTING', '456', '16', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('521', 'CT_DISPLAY_ABSTRACT_ARTICLE_LISTING', 'DISPLAY_ABSTRACT_ARTICLE_LISTING', 'true', 'CD_DISPLAY_ABSTRACT_ARTICLE_LISTING', '456', '17', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('522', 'CT_DISPLAY_DATE_ADDED_ARTICLE_LISTING', 'DISPLAY_DATE_ADDED_ARTICLE_LISTING', 'true', 'CD_DISPLAY_DATE_ADDED_ARTICLE_LISTING', '456', '18', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('523', 'CT_MAX_ARTICLE_ABSTRACT_LENGTH', 'MAX_ARTICLE_ABSTRACT_LENGTH', '300', 'CD_MAX_ARTICLE_ABSTRACT_LENGTH', '456', '19', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('524', 'CT_ARTICLE_LIST_FILTER', 'ARTICLE_LIST_FILTER', 'true', 'CD_ARTICLE_LIST_FILTER', '456', '20', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('525', 'CT_ARTICLE_PREV_NEXT_BAR_LOCATION', 'ARTICLE_PREV_NEXT_BAR_LOCATION', 'bottom', 'CD_ARTICLE_PREV_NEXT_BAR_LOCATION', '456', '21', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'top\',\'bottom\',\'both\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('526', 'CT_ARTICLE_WYSIWYG_ENABLE', 'ARTICLE_WYSIWYG_ENABLE', 'Enable', 'CD_ARTICLE_WYSIWYG_ENABLE', '456', '22', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'Enable\',\'Disable\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('589', 'CT_PRODINFO_ATTRIBUTE_PLUGIN', 'PRODINFO_ATTRIBUTE_PLUGIN', 'multiple_dropdowns', 'CD_PRODINFO_ATTRIBUTE_PLUGIN', '50', '1', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_pull_down_class_files(\'pad_\',');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('590', 'CT_PRODINFO_ATTRIBUTE_SHOW_OUT_OF_STOCK', 'PRODINFO_ATTRIBUTE_SHOW_OUT_OF_STOCK', 'True', 'CD_PRODINFO_ATTRIBUTE_SHOW_OUT_OF_STOCK', '50', '10', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('591', 'CT_PRODINFO_ATTRIBUTE_MARK_OUT_OF_STOCK', 'PRODINFO_ATTRIBUTE_MARK_OUT_OF_STOCK', 'Right', 'CD_PRODINFO_ATTRIBUTE_MARK_OUT_OF_STOCK', '50', '20', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'None\',\'Right\',\'Left\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('592', 'CT_PRODINFO_ATTRIBUTE_OUT_OF_STOCK_MSGLINE', 'PRODINFO_ATTRIBUTE_OUT_OF_STOCK_MSGLINE', 'False', 'CD_PRODINFO_ATTRIBUTE_OUT_OF_STOCK_MSGLINE', '50', '30', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('593', 'CT_PRODINFO_ATTRIBUTE_NO_ADD_OUT_OF_STOCK', 'PRODINFO_ATTRIBUTE_NO_ADD_OUT_OF_STOCK', 'True', 'CD_PRODINFO_ATTRIBUTE_NO_ADD_OUT_OF_STOCK', '9', '8', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('594', 'CT_PRODINFO_ATTRIBUTE_DISPLAY_STOCK_LIST', 'PRODINFO_ATTRIBUTE_DISPLAY_STOCK_LIST', 'true', 'CD_PRODINFO_ATTRIBUTE_DISPLAY_STOCK_LIST', '9', '6', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('595', 'CT_PRODUCT_IMAGE_WIDTH', 'PRODUCT_IMAGE_WIDTH', '300', 'CD_PRODUCT_IMAGE_WIDTH', '4', '20', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('596', 'CT_PRODUCT_IMAGE_HEIGHT', 'PRODUCT_IMAGE_HEIGHT', '', 'CD_PRODUCT_IMAGE_HEIGHT', '4', '21', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('597', 'CT_POPUP_IMAGE_WIDTH', 'POPUP_IMAGE_WIDTH', '800', 'CD_POPUP_IMAGE_WIDTH', '4', '24', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('598', 'CT_POPUP_IMAGE_HEIGHT', 'POPUP_IMAGE_HEIGHT', '600', 'CD_POPUP_IMAGE_HEIGHT', '4', '25', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('599', 'CT_CATEGORY_IMAGES_DIR', 'CATEGORY_IMAGES_DIR', 'categories/', 'CD_CATEGORY_IMAGES_DIR', '45', '0', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('600', 'CT_POPUP_IMAGE_RESIZE', 'POPUP_IMAGE_RESIZE', 'true', 'CD_POPUP_IMAGE_RESIZE', '4', '3', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('601', 'CT_SMALL_IMAGE_COMPRESSION', 'SMALL_IMAGE_COMPRESSION', '75', 'CD_SMALL_IMAGE_COMPRESSION', '4', '7', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('602', 'CT_SUBCATEGORY_IMAGE_COMPRESSION', 'SUBCATEGORY_IMAGE_COMPRESSION', '75', 'CD_SUBCATEGORY_IMAGE_COMPRESSION', '4', '12', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('603', 'CT_PRODUCT_IMAGE_COMPRESSION', 'PRODUCT_IMAGE_COMPRESSION', '80', 'CD_PRODUCT_IMAGE_COMPRESSION', '4', '22', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('604', 'CT_POPUP_IMAGE_COMPRESSION', 'POPUP_IMAGE_COMPRESSION', '85', 'CD_POPUP_IMAGE_COMPRESSION', '4', '26', NULL, '2015-04-04 21:02:47', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('631', 'CT_MODULE_LOYALTY_DISCOUNT_STATUS', 'MODULE_LOYALTY_DISCOUNT_STATUS', 'false', 'CD_MODULE_LOYALTY_DISCOUNT_STATUS', '6', '1', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('632', 'CT_MODULE_LOYALTY_DISCOUNT_SORT_ORDER', 'MODULE_LOYALTY_DISCOUNT_SORT_ORDER', '5', 'CD_MODULE_LOYALTY_DISCOUNT_SORT_ORDER', '6', '2', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('633', 'CT_MODULE_LOYALTY_DISCOUNT_INC_SHIPPING', 'MODULE_LOYALTY_DISCOUNT_INC_SHIPPING', 'true', 'CD_MODULE_LOYALTY_DISCOUNT_INC_SHIPPING', '6', '3', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('634', 'CT_MODULE_LOYALTY_DISCOUNT_INC_TAX', 'MODULE_LOYALTY_DISCOUNT_INC_TAX', 'true', 'CD_MODULE_LOYALTY_DISCOUNT_INC_TAX', '6', '4', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('635', 'CT_MODULE_LOYALTY_DISCOUNT_CALC_TAX', 'MODULE_LOYALTY_DISCOUNT_CALC_TAX', 'false', 'CD_MODULE_LOYALTY_DISCOUNT_CALC_TAX', '6', '5', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('636', 'CT_MODULE_LOYALTY_DISCOUNT_CUMORDER_PERIOD', 'MODULE_LOYALTY_DISCOUNT_CUMORDER_PERIOD', 'year', 'CD_MODULE_LOYALTY_DISCOUNT_CUMORDER_PERIOD', '6', '6', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'alltime\',\'year\',\'quarter\',\'month\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('637', 'CT_MODULE_LOYALTY_DISCOUNT_TABLE', 'MODULE_LOYALTY_DISCOUNT_TABLE', '1000:5,1500:7.5,2000:10,3000:12.5,5000:15', 'CD_MODULE_LOYALTY_DISCOUNT_TABLE', '6', '7', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('638', 'CT_MODULE_LOYALTY_DISCOUNT_ORDER_STATUS', 'MODULE_LOYALTY_DISCOUNT_ORDER_STATUS', '3', 'CD_MODULE_LOYALTY_DISCOUNT_ORDER_STATUS', '6', '8', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('639', 'CT_MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', 'CD_MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', '6', '1', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('640', 'CT_MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '3', 'CD_MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '6', '2', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('641', 'CT_MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', 'CD_MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', '6', '3', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('642', 'CT_MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', 'CD_MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '6', '4', NULL, '2015-04-04 21:02:48', 'currencies->format', NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('643', 'CT_MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', 'CD_MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '6', '5', NULL, '2015-04-04 21:02:48', 'currencies->format', NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('644', 'CT_MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', 'CD_MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', '6', '6', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'national\',\'international\',\'both\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('645', 'CT_MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', 'CD_MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '6', '7', NULL, '2015-04-04 21:02:48', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('646', 'CT_INDEX_TAB', 'INDEX_TAB', '6', 'CD_INDEX_TAB', '6', '100', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('650', 'CT_PRODUCT_LIST_TYPE', 'PRODUCT_LIST_TYPE', '1', 'CD_PRODUCT_LIST_TYPE', '8', '11', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('700', 'CT_PRODUCT_LIST_NUM_COLUMNS', 'PRODUCT_LIST_NUM_COLUMNS', '3', 'CD_PRODUCT_LIST_NUM_COLUMNS', '8', '14', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('701', 'CT_MIN_DISPLAY_XSELL', 'MIN_DISPLAY_XSELL', '1', 'CD_MIN_DISPLAY_XSELL', '8', '20', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('729', 'CT_PRODUCT_LIST_ENABLE', 'PRODUCT_LIST_ENABLE', 'true', 'CD_PRODUCT_LIST_ENABLE', '30', '0', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('730', 'CT_PRODUCT_LIST_CUSTOMER_DISCOUNT', 'PRODUCT_LIST_CUSTOMER_DISCOUNT', 'show', 'CD_PRODUCT_LIST_CUSTOMER_DISCOUNT', '30', '0', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('731', 'CT_PRODUCT_LIST_PAGEBREAK_NUMBERS_PERPAGE', 'PRODUCT_LIST_PAGEBREAK_NUMBERS_PERPAGE', '10', 'CD_PRODUCT_LIST_PAGEBREAK_NUMBERS_PERPAGE', '30', '2', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('732', 'CT_PRODUCT_LIST_CATALOG_PERPAGE', 'PRODUCT_LIST_CATALOG_PERPAGE', '10', 'CD_PRODUCT_LIST_CATALOG_PERPAGE', '30', '3', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('733', 'CT_PRODUCT_LIST_DESCRIPTION_LENGTH', 'PRODUCT_LIST_DESCRIPTION_LENGTH', '400', 'CD_PRODUCT_LIST_DESCRIPTION_LENGTH', '30', '4', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('734', 'CT_PRODUCT_LIST_CATALOG_IMAGE', 'PRODUCT_LIST_CATALOG_IMAGE', 'show', 'CD_PRODUCT_LIST_CATALOG_IMAGE', '30', '5', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('735', 'CT_PRODUCT_LIST_CATALOG_IMAGE_FULL', 'PRODUCT_LIST_CATALOG_IMAGE_FULL', 'hide', 'CD_PRODUCT_LIST_CATALOG_IMAGE_FULL', '30', '6', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('736', 'CT_PRODUCT_LIST_CATALOG_OPTIONS', 'PRODUCT_LIST_CATALOG_OPTIONS', 'hide', 'CD_PRODUCT_LIST_CATALOG_OPTIONS', '30', '7', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('737', 'CT_PRODUCT_LIST_CATALOG_NAME', 'PRODUCT_LIST_CATALOG_NAME', 'show', 'CD_PRODUCT_LIST_CATALOG_NAME', '30', '8', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('738', 'CT_PRODUCT_LIST_CATALOG_MANUFACTURERS', 'PRODUCT_LIST_CATALOG_MANUFACTURERS', 'hide', 'CD_PRODUCT_LIST_CATALOG_MANUFACTURERS', '30', '9', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('739', 'CT_PRODUCT_LIST_CATALOG_DESCRIPTION', 'PRODUCT_LIST_CATALOG_DESCRIPTION', 'hide', 'CD_PRODUCT_LIST_CATALOG_DESCRIPTION', '30', '10', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('740', 'CT_PRODUCT_LIST_CATALOG_CATEGORIES', 'PRODUCT_LIST_CATALOG_CATEGORIES', 'show', 'CD_PRODUCT_LIST_CATALOG_CATEGORIES', '30', '11', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('741', 'CT_PRODUCT_LIST_CATALOG_MODEL', 'PRODUCT_LIST_CATALOG_MODEL', 'show', 'CD_PRODUCT_LIST_CATALOG_MODEL', '30', '12', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('742', 'CT_PRODUCT_LIST_CATALOG_UPC', 'PRODUCT_LIST_CATALOG_UPC', 'hide', 'CD_PRODUCT_LIST_CATALOG_UPC', '30', '13', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('743', 'CT_PRODUCT_LIST_CATALOG_QUANTITY', 'PRODUCT_LIST_CATALOG_QUANTITY', 'hide', 'CD_PRODUCT_LIST_CATALOG_QUANTITY', '30', '14', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('744', 'CT_PRODUCT_LIST_CATALOG_WEIGHT', 'PRODUCT_LIST_CATALOG_WEIGHT', 'hide', 'CD_PRODUCT_LIST_CATALOG_WEIGHT', '30', '15', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('745', 'CT_PRODUCT_LIST_CATALOG_PRICE', 'PRODUCT_LIST_CATALOG_PRICE', 'show', 'CD_PRODUCT_LIST_CATALOG_PRICE', '30', '16', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('746', 'CT_PRODUCT_LIST_CATALOG_DATE', 'PRODUCT_LIST_CATALOG_DATE', 'hide', 'CD_PRODUCT_LIST_CATALOG_DATE', '30', '17', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('747', 'CT_PRODUCT_LIST_CATALOG_DATE_SHOW', 'PRODUCT_LIST_CATALOG_DATE_SHOW', 'hide', 'CD_PRODUCT_LIST_CATALOG_DATE_SHOW', '30', '18', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('748', 'CT_PRODUCT_LIST_CATALOG_CURRENCY', 'PRODUCT_LIST_CATALOG_CURRENCY', 'hide', 'CD_PRODUCT_LIST_CATALOG_CURRENCY', '30', '19', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'show\',\'hide\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('774', 'CT_ENABLE_PAGE_CACHE', 'ENABLE_PAGE_CACHE', 'false', 'CD_ENABLE_PAGE_CACHE', '55', '1', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('775', 'CT_PAGE_CACHE_LIFETIME', 'PAGE_CACHE_LIFETIME', '5', 'CD_PAGE_CACHE_LIFETIME', '55', '2', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('776', 'CT_PAGE_CACHE_DEBUG_MODE', 'PAGE_CACHE_DEBUG_MODE', 'false', 'CD_PAGE_CACHE_DEBUG_MODE', '55', '3', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('777', 'CT_PAGE_CACHE_DISABLE_PARAMETERS', 'PAGE_CACHE_DISABLE_PARAMETERS', 'false', 'CD_PAGE_CACHE_DISABLE_PARAMETERS', '55', '4', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('778', 'CT_PAGE_CACHE_DELETE_FILES', 'PAGE_CACHE_DELETE_FILES', 'true', 'CD_PAGE_CACHE_DELETE_FILES', '55', '5', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('779', 'CT_PAGE_CACHE_UPDATE_CONFIG_FILES', 'PAGE_CACHE_UPDATE_CONFIG_FILES', 'none', 'CD_PAGE_CACHE_UPDATE_CONFIG_FILES', '55', '6', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1073', 'CT_MOVE_TAX_TO_TOTAL_AMOUNT', 'MOVE_TAX_TO_TOTAL_AMOUNT', 'True', 'CD_MOVE_TAX_TO_TOTAL_AMOUNT', '6', '4', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1150', 'CT_SLIMBOX_LOOP', 'SLIMBOX_LOOP', 'false', 'CD_SLIMBOX_LOOP', '46', '30', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1151', 'CT_SLIMBOX_OPACITY', 'SLIMBOX_OPACITY', '0.8', 'CD_SLIMBOX_OPACITY', '46', '31', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1152', 'CT_SLIMBOX_FADE', 'SLIMBOX_FADE', '400', 'CD_SLIMBOX_FADE', '46', '32', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1153', 'CT_SLIMBOX_RESIZE', 'SLIMBOX_RESIZE', '400', 'CD_SLIMBOX_RESIZE', '46', '33', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1154', 'CT_SLIMBOX_EASING', 'SLIMBOX_EASING', '\"swing\"', 'CD_SLIMBOX_EASING', '46', '34', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1155', 'CT_SLIMBOX_WIDTH', 'SLIMBOX_WIDTH', '100', 'CD_SLIMBOX_WIDTH', '46', '35', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1156', 'CT_SLIMBOX_HEIGHT', 'SLIMBOX_HEIGHT', '100', 'CD_SLIMBOX_HEIGHT', '46', '36', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1157', 'CT_SLIMBOX_IMAGE', 'SLIMBOX_IMAGE', '400', 'CD_SLIMBOX_IMAGE', '46', '37', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1158', 'CT_SLIMBOX_CAPTION', 'SLIMBOX_CAPTION', '400', 'CD_SLIMBOX_CAPTION', '46', '38', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1159', 'CT_SLIMBOX_COUNTER', 'SLIMBOX_COUNTER', '\"Image {x} of {y}\"', 'CD_SLIMBOX_COUNTER', '46', '39', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1204', 'CT_AFFILIATE_EMAIL_ADDRESS', 'AFFILIATE_EMAIL_ADDRESS', '<affiliate@localhost.com>', 'CD_AFFILIATE_EMAIL_ADDRESS', '35', '1', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1205', 'CT_AFFILIATE_PERCENT', 'AFFILIATE_PERCENT', '10.0000', 'CD_AFFILIATE_PERCENT', '35', '2', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1206', 'CT_AFFILIATE_THRESHOLD', 'AFFILIATE_THRESHOLD', '50.00', 'CD_AFFILIATE_THRESHOLD', '35', '3', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1207', 'CT_AFFILIATE_COOKIE_LIFETIME', 'AFFILIATE_COOKIE_LIFETIME', '7200', 'CD_AFFILIATE_COOKIE_LIFETIME', '35', '4', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1208', 'CT_AFFILIATE_BILLING_TIME', 'AFFILIATE_BILLING_TIME', '30', 'CD_AFFILIATE_BILLING_TIME', '35', '5', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1209', 'CT_AFFILIATE_PAYMENT_ORDER_MIN_STATUS', 'AFFILIATE_PAYMENT_ORDER_MIN_STATUS', '3', 'CD_AFFILIATE_PAYMENT_ORDER_MIN_STATUS', '35', '6', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1210', 'CT_AFFILIATE_USE_CHECK', 'AFFILIATE_USE_CHECK', 'true', 'CD_AFFILIATE_USE_CHECK', '35', '7', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1211', 'CT_AFFILIATE_USE_PAYPAL', 'AFFILIATE_USE_PAYPAL', 'true', 'CD_AFFILIATE_USE_PAYPAL', '35', '8', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1212', 'CT_AFFILIATE_USE_BANK', 'AFFILIATE_USE_BANK', 'true', 'CD_AFFILIATE_USE_BANK', '35', '9', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1213', 'CT_AFFILATE_INDIVIDUAL_PERCENTAGE', 'AFFILATE_INDIVIDUAL_PERCENTAGE', 'true', 'CD_AFFILATE_INDIVIDUAL_PERCENTAGE', '35', '10', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1214', 'CT_AFFILATE_USE_TIER', 'AFFILATE_USE_TIER', 'false', 'CD_AFFILATE_USE_TIER', '35', '11', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1215', 'CT_AFFILIATE_TIER_LEVELS', 'AFFILIATE_TIER_LEVELS', '0', 'CD_AFFILIATE_TIER_LEVELS', '35', '12', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1216', 'CT_AFFILIATE_TIER_PERCENTAGE', 'AFFILIATE_TIER_PERCENTAGE', '8.00;5.00;1.00', 'CD_AFFILIATE_TIER_PERCENTAGE', '35', '13', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1217', 'CT_MAX_DISPLAY_AFFILIATE_NEWS', 'MAX_DISPLAY_AFFILIATE_NEWS', '3', 'CD_MAX_DISPLAY_AFFILIATE_NEWS', '35', '14', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1218', 'CT_AFFILIATE_NOTIFY_AFTER_BILLING', 'AFFILIATE_NOTIFY_AFTER_BILLING', 'true', 'CD_AFFILIATE_NOTIFY_AFTER_BILLING', '35', '15', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1219', 'CT_AFFILIATE_DELETE_ORDERS', 'AFFILIATE_DELETE_ORDERS', 'true', 'CD_AFFILIATE_DELETE_ORDERS', '35', '16', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1220', 'CT_AFFILIATE_TAX_ID', 'AFFILIATE_TAX_ID', '1', 'CD_AFFILIATE_TAX_ID', '35', '17', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1221', 'CT_AFFILIATE_DELETE_CLICKTHROUGHS', 'AFFILIATE_DELETE_CLICKTHROUGHS', 'false', 'CD_AFFILIATE_DELETE_CLICKTHROUGHS', '35', '18', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1222', 'CT_AFFILIATE_DELETE_AFFILIATE_BANNER_HISTORY', 'AFFILIATE_DELETE_AFFILIATE_BANNER_HISTORY', 'false', 'CD_AFFILIATE_DELETE_AFFILIATE_BANNER_HISTORY', '35', '19', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1223', 'CT_AFFILIATE_KIND_OF_BANNERS', 'AFFILIATE_KIND_OF_BANNERS', '2', 'CD_AFFILIATE_KIND_OF_BANNERS', '35', '20', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1224', 'CT_AFFILIATE_SHOW_BANNERS_DEBUG', 'AFFILIATE_SHOW_BANNERS_DEBUG', 'false', 'CD_AFFILIATE_SHOW_BANNERS_DEBUG', '35', '21', NULL, '2015-04-04 21:02:50', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1225', 'CT_AFFILIATE_SHOW_BANNERS_DEFAULT_PIC', 'AFFILIATE_SHOW_BANNERS_DEFAULT_PIC', 'DIR_WS_IMAGES', 'CD_AFFILIATE_SHOW_BANNERS_DEFAULT_PIC', '35', '21', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1291', 'CT_MAX_DISPLAY_WISHLIST_PRODUCTS', 'MAX_DISPLAY_WISHLIST_PRODUCTS', '12', 'CD_MAX_DISPLAY_WISHLIST_PRODUCTS', '65', '0', NULL, '2015-04-04 21:02:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1292', 'CT_MAX_DISPLAY_WISHLIST_BOX', 'MAX_DISPLAY_WISHLIST_BOX', '4', 'CD_MAX_DISPLAY_WISHLIST_BOX', '65', '0', NULL, '2015-04-04 21:02:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1293', 'CT_DISPLAY_WISHLIST_EMAILS', 'DISPLAY_WISHLIST_EMAILS', '3', 'CD_DISPLAY_WISHLIST_EMAILS', '65', '0', NULL, '2015-04-04 21:02:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1294', 'CT_WISHLIST_REDIRECT', 'WISHLIST_REDIRECT', 'No', 'CD_WISHLIST_REDIRECT', '65', '0', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'Yes\',\'No\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1304', 'CT_ORDER_EDITOR_PAYMENT_DROPDOWN', 'ORDER_EDITOR_PAYMENT_DROPDOWN', 'true', 'CD_ORDER_EDITOR_PAYMENT_DROPDOWN', '70', '1', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1305', 'CT_ORDER_EDITOR_USE_SPPC', 'ORDER_EDITOR_USE_SPPC', 'true', 'CD_ORDER_EDITOR_USE_SPPC', '70', '3', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1306', 'CT_ORDER_EDITOR_USE_AJAX', 'ORDER_EDITOR_USE_AJAX', 'true', 'CD_ORDER_EDITOR_USE_AJAX', '70', '4', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1307', 'CT_ORDER_EDITOR_CREDIT_CARD', 'ORDER_EDITOR_CREDIT_CARD', 'Credit Card', 'CD_ORDER_EDITOR_CREDIT_CARD', '70', '5', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_pull_down_payment_methods(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1308', 'CT_ORDER_EDITOR_DEFAULT_PAYMENT_METHOD', 'ORDER_EDITOR_DEFAULT_PAYMENT_METHOD', 'Please Select...', 'CD_ORDER_EDITOR_CREDIT_CARD', '70', '6', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_pull_down_payment_methods(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1449', 'CT_PURCHASE_WITHOUT_ACCOUNT', 'PURCHASE_WITHOUT_ACCOUNT', 'no', 'CD_PURCHASE_WITHOUT_ACCOUNT', '5', '10', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'yes\',\'no\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1450', 'CT_PURCHASE_WITHOUT_ACCOUNT_SEPARATE_SHIPPING', 'PURCHASE_WITHOUT_ACCOUNT_SEPARATE_SHIPPING', 'yes', 'CD_PURCHASE_WITHOUT_ACCOUNT_SEPARATE_SHIPPING', '5', '11', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'yes\',\'no\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1487', 'CT_SHIPPING_DIMENSIONS_SUPPORT', 'SHIPPING_DIMENSIONS_SUPPORT', 'No', 'CD_SHIPPING_DIMENSIONS_SUPPORT', '7', '6', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'No\', \'Ready-to-ship only\', \'With product dimensions\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1488', 'CT_SHIPPING_UNIT_WEIGHT', 'SHIPPING_UNIT_WEIGHT', 'LBS', 'CD_SHIPPING_UNIT_WEIGHT', '7', '7', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'LBS\', \'KGS\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1489', 'CT_SHIPPING_UNIT_LENGTH', 'SHIPPING_UNIT_LENGTH', 'IN', 'CD_SHIPPING_UNIT_LENGTH', '7', '8', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'IN\', \'CM\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1490', 'CT_SHIPPING_STORE_BOXES_USED', 'SHIPPING_STORE_BOXES_USED', 'false', 'CD_SHIPPING_STORE_BOXES_USED', '7', '9', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1491', 'CT_RCS_BASE_DAYS', 'RCS_BASE_DAYS', '30', 'CD_RCS_BASE_DAYS', '80', '10', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1492', 'CT_RCS_SKIP_DAYS', 'RCS_SKIP_DAYS', '5', 'CD_RCS_SKIP_DAYS', '80', '11', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1493', 'CT_RCS_REPORT_DAYS', 'RCS_REPORT_DAYS', '90', 'CD_RCS_REPORT_DAYS', '80', '15', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1494', 'CT_RCS_INCLUDE_TAX_IN_PRICES', 'RCS_INCLUDE_TAX_IN_PRICES', 'false', 'CD_RCS_INCLUDE_TAX_IN_PRICES', '80', '16', NULL, '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1495', 'CT_RCS_USE_FIXED_TAX_IN_PRICES', 'RCS_USE_FIXED_TAX_IN_PRICES', 'false', 'CD_RCS_USE_FIXED_TAX_IN_PRICES', '80', '17', NULL, '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1496', 'CT_RCS_FIXED_TAX_RATE', 'RCS_FIXED_TAX_RATE', '10.00', 'CD_RCS_FIXED_TAX_RATE', '80', '18', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1497', 'CT_RCS_EMAIL_TTL', 'RCS_EMAIL_TTL', '90', 'CD_RCS_EMAIL_TTL', '80', '20', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1498', 'CT_RCS_EMAIL_FRIENDLY', 'RCS_EMAIL_FRIENDLY', 'true', 'CD_RCS_EMAIL_FRIENDLY', '80', '30', NULL, '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1499', 'CT_RCS_EMAIL_COPIES_TO', 'RCS_EMAIL_COPIES_TO', '', 'CD_RCS_EMAIL_COPIES_TO', '80', '35', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1500', 'CT_RCS_SHOW_ATTRIBUTES', 'RCS_SHOW_ATTRIBUTES', 'false', 'CD_RCS_SHOW_ATTRIBUTES', '80', '40', NULL, '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1501', 'CT_RCS_CHECK_SESSIONS', 'RCS_CHECK_SESSIONS', 'false', 'CD_RCS_CHECK_SESSIONS', '80', '40', NULL, '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1502', 'CT_RCS_CURCUST_COLOR', 'RCS_CURCUST_COLOR', '0000FF', 'CD_RCS_CURCUST_COLOR', '80', '50', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1503', 'CT_RCS_UNCONTACTED_COLOR', 'RCS_UNCONTACTED_COLOR', '9FFF9F', 'CD_RCS_UNCONTACTED_COLOR', '80', '60', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1504', 'CT_RCS_CONTACTED_COLOR', 'RCS_CONTACTED_COLOR', 'FF9F9F', 'CD_RCS_CONTACTED_COLOR', '80', '70', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1505', 'CT_RCS_MATCHED_ORDER_COLOR', 'RCS_MATCHED_ORDER_COLOR', '9FFFFF', 'CD_RCS_MATCHED_ORDER_COLOR', '80', '72', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1506', 'CT_RCS_SKIP_MATCHED_CARTS', 'RCS_SKIP_MATCHED_CARTS', 'true', 'CD_RCS_SKIP_MATCHED_CARTS', '80', '80', NULL, '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1507', 'CT_RCS_AUTO_CHECK', 'RCS_AUTO_CHECK', 'true', 'CD_RCS_AUTO_CHECK', '80', '82', NULL, '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1508', 'CT_RCS_CARTS_MATCH_ALL_DATES', 'RCS_CARTS_MATCH_ALL_DATES', 'true', 'CD_RCS_CARTS_MATCH_ALL_DATES', '80', '84', NULL, '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1509', 'CT_RCS_PENDING_SALE_STATUS', 'RCS_PENDING_SALE_STATUS', '1', 'CD_RCS_PENDING_SALE_STATUS', '80', '85', NULL, '2015-04-04 21:02:52', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1510', 'CT_RCS_REPORT_EVEN_STYLE', 'RCS_REPORT_EVEN_STYLE', 'dataTableRow', 'CD_RCS_REPORT_EVEN_STYLE', '80', '90', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1511', 'CT_RCS_REPORT_ODD_STYLE', 'RCS_REPORT_ODD_STYLE', '', 'CD_RCS_REPORT_ODD_STYLE', '80', '92', NULL, '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1999', 'CT_SHOW_SITEMAP', 'SHOW_SITEMAP', 'true', 'CD_SHOW_SITEMAP', '86', '5', '2015-04-04 21:02:52', '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2100', 'CT_GOOGLE_ANALYTICS_STATUS', 'GOOGLE_ANALYTICS_STATUS', 'false', 'CD_GOOGLE_ANALYTICS_STATUS', '85', '1', '0000-00-00 00:00:00', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2101', 'CT_GOOGLE_UA_CODE', 'GOOGLE_UA_CODE', 'UA-XXXXXXX-X', 'CD_GOOGLE_UA_CODE', '85', '2', '0000-00-00 00:00:00', '2015-04-04 21:02:52', '', 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2102', 'CT_GOOGLE_SUBDOMAIN', 'GOOGLE_SUBDOMAIN', 'none', 'CD_GOOGLE_SUBDOMAIN', '85', '3', '0000-00-00 00:00:00', '2015-04-04 21:02:52', '', 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2103', 'CT_PRODUCT_IMAGE_REPLACE', 'PRODUCT_IMAGE_REPLACE', 'true', 'CD_PRODUCT_IMAGE_REPLACE', '4', '2', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2500', 'CT_USE_PRODUCT_DESCRIPTION_TABS', 'USE_PRODUCT_DESCRIPTION_TABS', 'True', 'CD_USE_PRODUCT_DESCRIPTION_TABS', '8', '20', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2501', 'CT_FWR_SUCKERTREE_MENU_ON', 'FWR_SUCKERTREE_MENU_ON', 'false', 'CD_FWR_SUCKERTREE_MENU_ON', '86', '1', '2015-04-04 21:02:52', '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2502', 'CT_FWR_MENU_ORDER_BY', 'FWR_MENU_ORDER_BY', 'c.categories_id', 'CD_FWR_MENU_ORDER_BY', '86', '2', '2015-04-04 21:02:52', '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'c.categories_id\', \'c.sort_order\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2503', 'CT_FWR_MENU_CACHE_PATH', 'FWR_MENU_CACHE_PATH', 'DIR_FS_CACHE', 'CD_FWR_MENU_CACHE_PATH', '86', '3', '2015-04-04 21:02:52', '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'DIR_FS_CACHE\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2504', 'CT_FWR_MENU_RESET', 'FWR_MENU_RESET', 'false', 'CD_FWR_MENU_RESET', '86', '4', '2015-04-04 21:02:52', '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2505', 'CT_RECAPTCHA_ON', 'RECAPTCHA_ON', 'false', 'CD_RECAPTCHA_ON', '87', '1', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2506', 'CT_RECAPTCHA_PUBLIC_KEY', 'RECAPTCHA_PUBLIC_KEY', '', 'CD_RECAPTCHA_PUBLIC_KEY', '87', '3', NULL, '2015-04-04 21:02:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2507', 'CT_RECAPTCHA_PRIVATE_KEY', 'RECAPTCHA_PRIVATE_KEY', '', 'CD_RECAPTCHA_PRIVATE_KEY', '87', '4', NULL, '2015-04-04 21:02:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2508', 'CT_STOCK_IMAGE_SWITCH', 'STOCK_IMAGE_SWITCH', 'true', 'CD_STOCK_IMAGE_SWITCH', '9', '7', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2509', 'CT_PRICE_BREAK_NOF_LEVELS', 'PRICE_BREAK_NOF_LEVELS', '10', 'CD_PRICE_BREAK_NOF_LEVELS', '88', '1', '2015-04-04 21:02:52', '2015-04-04 21:02:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2510', 'CT_NOF_PRICE_BREAKS_FOR_DROPDOWN', 'NOF_PRICE_BREAKS_FOR_DROPDOWN', '5', 'CD_NOF_PRICE_BREAKS_FOR_DROPDOWN', '88', '2', '2015-04-04 21:02:52', '2015-04-04 21:02:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2511', 'CT_CUSTOMER_COMMENTS_NOTIFY', 'CUSTOMER_COMMENTS_NOTIFY', 'false', 'CD_CUSTOMER_COMMENTS_NOTIFY', '5', '50', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2512', 'CT_CUSTOMER_COMMENTS_NEW_STATUS', 'CUSTOMER_COMMENTS_NEW_STATUS', '4', 'CD_CUSTOMER_COMMENTS_NEW_STATUS', '5', '51', '2015-04-04 21:02:47', '2015-04-04 21:02:47', 'tep_get_orders_status_name', 'tep_cfg_pull_down_status_change_cancel_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2513', 'CT_CUSTOMER_COMMENTS_NEW_STATUS_DL', 'CUSTOMER_COMMENTS_NEW_STATUS_DL', '5', 'CD_CUSTOMER_COMMENTS_NEW_STATUS_DL', '5', '52', '2015-04-04 21:02:47', '2015-04-04 21:02:47', 'tep_get_orders_status_name', 'tep_cfg_pull_down_status_change_cancel_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2514', 'CT_STORE_WIDTH', 'STORE_WIDTH', '980', 'CD_STORE_WIDTH', '201', '3', NULL, '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2515', 'CT_STORE_ALIGN', 'STORE_ALIGN', 'center', 'CD_STORE_ALIGN', '201', '5', NULL, '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2516', 'CT_CHECKOUT_SHIPPING_DATE', 'CHECKOUT_SHIPPING_DATE', 'false', 'CD_CHECKOUT_SHIPPING_DATE', '5', '53', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2517', 'CT_ACCOUNT_EMAIL_CONFIRMATION', 'ACCOUNT_EMAIL_CONFIRMATION', 'false', 'CD_ACCOUNT_EMAIL_CONFIRMATION', '5', '6', NULL, '2015-04-04 21:02:47', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2518', 'CT_BOX_WIDTH_LEFT', 'BOX_WIDTH_LEFT', '150', 'CD_BOX_WIDTH_LEFT', '201', '6', NULL, '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2519', 'CT_BOX_WIDTH_RIGHT', 'BOX_WIDTH_RIGHT', '150', 'CD_BOX_WIDTH_RIGHT', '201', '7', NULL, '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2520', 'CT_LEFT_COLUMN_SHOW', 'LEFT_COLUMN_SHOW', 'true', 'CD_LEFT_COLUMN_SHOW', '201', '8', NULL, '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2521', 'CT_RIGHT_COLUMN_SHOW', 'RIGHT_COLUMN_SHOW', 'true', 'CD_RIGHT_COLUMN_SHOW', '201', '9', NULL, '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2522', 'CT_BREADCRUMB_SHOW_PRODUCT_MODEL', 'BREADCRUMB_SHOW_PRODUCT_MODEL', 'False', 'CD_BREADCRUMB_SHOW_PRODUCT_MODEL', '8', '20', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2523', 'CT_MANUFACTURERS_IMAGES_DIR', 'MANUFACTURERS_IMAGES_DIR', 'manufacturers/', 'CD_MANUFACTURERS_IMAGES_DIR', '45', '0', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2524', 'CT_NO_OF_DYNAMIC_MOPICS', 'NO_OF_DYNAMIC_MOPICS', '5', 'CD_NO_OF_DYNAMIC_MOPICS', '45', '50', NULL, '2015-04-04 21:02:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2525', 'CT_STOCK_SET_INACTIVE', 'STOCK_SET_INACTIVE', 'false', 'CD_STOCK_SET_INACTIVE', '9', '9', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2550', 'CT_RECAPTCHA_EMAIL_URL', 'RECAPTCHA_EMAIL_URL', '', 'CD_RECAPTCHA_EMAIL_URL', '87', '5', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2551', 'CT_RECAPTCHA_EMAIL_FROM', 'RECAPTCHA_EMAIL_FROM', 'CLICK', 'CD_RECAPTCHA_EMAIL_FROM', '87', '6', NULL, '2015-04-04 21:02:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2552', 'CT_RECAPTCHA_CREATE_ACCOUNT', 'RECAPTCHA_CREATE_ACCOUNT', 'true', 'CD_RECAPTCHA_CREATE_ACCOUNT', '87', '7', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2553', 'CT_RECAPTCHA_CONTACT_US', 'RECAPTCHA_CONTACT_US', 'true', 'CD_RECAPTCHA_CONTACT_US', '87', '8', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2554', 'CT_RECAPTCHA_STYLE', 'RECAPTCHA_STYLE', 'white', 'CD_RECAPTCHA_STYLE', '87', '2', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'white\', \'red\', \'blackglass\',\'clean\',\'custom\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2555', 'CT_RECAPTCHA_PRODUCT_REVIEWS_WRITE', 'RECAPTCHA_PRODUCT_REVIEWS_WRITE', 'true', 'CD_RECAPTCHA_PRODUCT_REVIEWS_WRITE', '87', '9', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2556', 'CT_RECAPTCHA_WISHLIST', 'RECAPTCHA_WISHLIST', 'true', 'CD_RECAPTCHA_WISHLIST', '87', '10', NULL, '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2601', 'CT_SEO_URLS_ENABLED', 'SEO_URLS_ENABLED', 'false', 'CD_SEO_URLS_ENABLED', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2602', 'CT_SEO_URLS_ADD_CPATH_TO_PRODUCT_URLS', 'SEO_URLS_ADD_CPATH_TO_PRODUCT_URLS', 'false', 'CD_SEO_URLS_ADD_CPATH_TO_PRODUCT_URLS', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2603', 'CT_SEO_URLS_ADD_CAT_PARENT', 'SEO_URLS_ADD_CAT_PARENT', 'true', 'CD_SEO_URLS_ADD_CAT_PARENT', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2604', 'CT_SEO_URLS_FILTER_SHORT_WORDS', 'SEO_URLS_FILTER_SHORT_WORDS', '1', 'CD_SEO_URLS_FILTER_SHORT_WORDS', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'1\', \'2\', \'3\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2605', 'CT_SEO_URLS_USE_W3C_VALID', 'SEO_URLS_USE_W3C_VALID', 'true', 'CD_SEO_URLS_USE_W3C_VALID', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2606', 'CT_SEO_URLS_TYPE', 'SEO_URLS_TYPE', 'rewrite', 'CD_SEO_URLS_TYPE', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'rewrite\', \'standard\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2607', 'CT_SEO_URLS_CHAR_CONVERT_SET', 'SEO_URLS_CHAR_CONVERT_SET', '', 'CD_SEO_URLS_CHAR_CONVERT_SET', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2608', 'CT_SEO_URLS_REMOVE_ALL_SPEC_CHARS', 'SEO_URLS_REMOVE_ALL_SPEC_CHARS', 'true', 'CD_SEO_URLS_REMOVE_ALL_SPEC_CHARS', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2609', 'CT_SEO_URLS_CACHE_DAYS', 'SEO_URLS_CACHE_DAYS', '7', 'CD_SEO_URLS_CACHE_DAYS', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2610', 'CT_SEO_URLS_CACHE_RESET', 'SEO_URLS_CACHE_RESET', 'false', 'CD_SEO_URLS_CACHE_RESET', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', 'tep_reset_cache_data_seo_urls', 'tep_cfg_select_option(array(\'reset\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2611', 'CT_SEO_URLS_OUPUT_PERFORMANCE', 'SEO_URLS_OUPUT_PERFORMANCE', 'false', 'CD_SEO_URLS_OUPUT_PERFORMANCE', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2612', 'CT_SEO_URLS_CACHE_SYSTEM', 'SEO_URLS_CACHE_SYSTEM', 'FileSystem', 'CD_SEO_URLS_CACHE_SYSTEM', '60', '902', '2015-04-04 21:02:52', '2015-04-04 21:02:52', '', 'tep_cfg_select_option(array(\'FileSystem\', \'Database\', \'Memcached\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2613', 'CT_MAT', 'MAT', 'false', 'CD_MAT', '203', '0', '2015-04-04 21:02:54', '2015-04-04 21:02:54', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2614', 'CT_MATC', 'MATC', 'false', 'CD_MATC', '203', '1', '2015-04-04 21:02:54', '2015-04-04 21:02:54', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2615', 'CT_JAVASCRIPT_CHECK', 'JAVASCRIPT_CHECK', 'false', 'CD_JAVASCRIPT_CHECK', '203', '2', '2015-04-04 21:02:54', '2015-04-04 21:02:54', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2616', 'CT_IE6_CHECK', 'IE6_CHECK', 'false', 'CD_IE6_CHECK', '203', '3', '2015-04-04 21:02:54', '2015-04-04 21:02:54', '', 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2617', 'CT_SLIDESHOW_WIDTH', 'SLIDESHOW_WIDTH', '640', 'CD_SLIDESHOW_WIDTH', '204', '1', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2618', 'CT_SLIDESHOW_HEIGHT', 'SLIDESHOW_HEIGHT', '250', 'CD_SLIDESHOW_HEIGHT', '204', '2', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2619', 'CT_SLIDESHOW_TRANSITION', 'SLIDESHOW_TRANSITION', 'fade', 'CD_SLIDESHOW_TRANSITION', '204', '3', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'fade\',\'horizontal-slider\',\'vertical-slider\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2620', 'CT_SLIDESHOW_TRANSITION_SPEED', 'SLIDESHOW_TRANSITION_SPEED', '500', 'CD_SLIDESHOW_TRANSITION_SPEED', '204', '4', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2621', 'CT_SLIDESHOW_INTERVAL', 'SLIDESHOW_INTERVAL', '4000', 'CD_SLIDESHOW_INTERVAL', '204', '5', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2622', 'CT_SLIDESHOW_DISPLAY_TITLE', 'SLIDESHOW_DISPLAY_TITLE', 'true', 'CD_SLIDESHOW_DISPLAY_TITLE', '204', '6', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2623', 'CT_SLIDESHOW_TITLE_POSITION', 'SLIDESHOW_TITLE_POSITION', 'bottom', 'CD_SLIDESHOW_TITLE_POSITION', '204', '7', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'top\',\'bottom\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2624', 'CT_SLIDESHOW_TITLE_COLOR', 'SLIDESHOW_TITLE_COLOR', '#000000', 'CD_SLIDESHOW_TITLE_COLOR', '204', '8', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2625', 'CT_SLIDESHOW_TITLE_OPACITY', 'SLIDESHOW_TITLE_OPACITY', '0.5', 'CD_SLIDESHOW_TITLE_OPACITY', '204', '9', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2626', 'CT_SLIDESHOW_TITLE_HEIGHT', 'SLIDESHOW_TITLE_HEIGHT', '25', 'CD_SLIDESHOW_TITLE_HEIGHT', '204', '10', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2627', 'CT_SLIDESHOW_MINATURE', 'SLIDESHOW_MINATURE', 'false', 'CD_SLIDESHOW_MINATURE', '204', '11', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2628', 'CT_SLIDESHOW_THUMB_AUTOHIDE', 'SLIDESHOW_THUMB_AUTOHIDE', 'false', 'CD_SLIDESHOW_THUMB_AUTOHIDE', '204', '12', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2629', 'CT_SLIDESHOW_THUMB_WIDTH', 'SLIDESHOW_THUMB_WIDTH', '20', 'CD_SLIDESHOW_THUMB_WIDTH', '204', '13', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2630', 'CT_SLIDESHOW_THUMB_HEIGHT', 'SLIDESHOW_THUMB_HEIGHT', '20', 'CD_SLIDESHOW_THUMB_HEIGHT', '204', '14', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2631', 'CT_SLIDESHOW_THUMB_POS', 'SLIDESHOW_THUMB_POS', 'top-right', 'CD_SLIDESHOW_THUMB_POS', '204', '15', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'top-left\',\'top-right\',\'bottom-left\',\'bottom-right\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2632', 'CT_SLIDESHOW_THUMB_ORIENTATION', 'SLIDESHOW_THUMB_ORIENTATION', 'horizontal', 'CD_SLIDESHOW_THUMB_ORIENTATION', '204', '16', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'horizontal\',\'vertical\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2633', 'CT_SLIDESHOW_THUMB_BORDER_COLOR', 'SLIDESHOW_THUMB_BORDER_COLOR', '#dddddd', 'CD_SLIDESHOW_THUMB_BORDER_COLOR', '204', '17', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2634', 'CT_SLIDESHOW_THUMB_BACKGROUND_COLOR', 'SLIDESHOW_THUMB_BACKGROUND_COLOR', '#333333', 'CD_SLIDESHOW_THUMB_BACKGROUND_COLOR', '204', '18', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2635', 'CT_SLIDESHOW_THUMB_FONT_COLOR', 'SLIDESHOW_THUMB_FONT_COLOR', '#ffffff', 'CD_SLIDESHOW_THUMB_FONT_COLOR', '204', '19', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2636', 'CT_SLIDESHOW_NUMBER', 'SLIDESHOW_NUMBER', 'true', 'CD_SLIDESHOW_NUMBER', '204', '20', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2637', 'CT_SLIDESHOW_THUMB_FONT_SIZE', 'SLIDESHOW_THUMB_FONT_SIZE', '10', 'CD_SLIDESHOW_THUMB_FONT_SIZE', '204', '21', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2638', 'CT_SLIDESHOW_THUMB_ACTIVE_BORDER_COLOR', 'SLIDESHOW_THUMB_ACTIVE_BORDER_COLOR', '#333333', 'CD_SLIDESHOW_THUMB_ACTIVE_BORDER_COLOR', '204', '22', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2639', 'CT_SLIDESHOW_THUMB_ACTIVE_BACKGROUND_COLOR', 'SLIDESHOW_THUMB_ACTIVE_BACKGROUND_COLOR', '#dddddd', 'CD_SLIDESHOW_THUMB_ACTIVE_BACKGROUND_COLOR', '204', '23', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2640', 'CT_SLIDESHOW_THUMB_ACTIVE_FONT_COLOR', 'SLIDESHOW_THUMB_ACTIVE_FONT_COLOR', '#000000', 'CD_SLIDESHOW_THUMB_ACTIVE_FONT_COLOR', '204', '24', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2641', 'CT_SLIDESHOW_COMPRESSION', 'SLIDESHOW_COMPRESSION', '85', 'CD_SLIDESHOW_COMPRESSION', '204', '25', NULL, '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2642', 'CT_AJAX_SEARCH_SUGGEST', 'AJAX_SEARCH_SUGGEST', 'false', 'CD_AJAX_SEARCH_SUGGEST', '201', '25', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2643', 'CT_ENGLISH_SWITCH', 'ENGLISH_SWITCH', 'US', 'CD_ENGLISH_SWITCH', '1', '11', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'US\', \'AUS\', \'UK\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2644', 'CT_CB_LAST_FEW', 'CB_LAST_FEW', 'true', 'CD_CB_LAST_FEW', '205', '1', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2645', 'CT_CB_LAST_FEW_NO', 'CB_LAST_FEW_NO', '5', 'CD_CB_LAST_FEW_NO', '205', '2', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2646', 'CT_CB_TOP_RATED', 'CB_TOP_RATED', 'true', 'CD_CB_TOP_RATED', '205', '3', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2647', 'CT_CB_TOP_RATED_NO', 'CB_TOP_RATED_NO', '4', 'CD_CB_TOP_RATED_NO', '205', '4', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2648', 'CT_CB_FEATURED', 'CB_FEATURED', 'true', 'CD_CB_FEATURED', '205', '5', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2649', 'CT_CB_SPECIALS', 'CB_SPECIALS', 'true', 'CD_CB_SPECIALS', '205', '6', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2650', 'CT_CB_SPECIALS_NO', 'CB_SPECIALS_NO', '20', 'CD_CB_SPECIALS_NO', '205', '7', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2651', 'CT_CB_CALL_FOR_PRICE', 'CB_CALL_FOR_PRICE', 'true', 'CD_CB_CALL_FOR_PRICE', '205', '8', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2652', 'CT_CB_OUT_OF_STOCK', 'CB_OUT_OF_STOCK', 'true', 'CD_CB_OUT_OF_STOCK', '205', '9', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2653', 'CT_PRODUCT_CORNER_BANNER', 'PRODUCT_CORNER_BANNER', '1', 'CD_PRODUCT_CORNER_BANNER', '8', '1', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2654', 'CT_USE_XSELL_HORIZ_SCROLLER', 'USE_XSELL_HORIZ_SCROLLER', 'false', 'CD_USE_XSELL_HORIZ_SCROLLER', '201', '26', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2655', 'CT_SHOW_ASK_A_QUESTION', 'SHOW_ASK_A_QUESTION', 'False', 'CD_SHOW_ASK_A_QUESTION', '8', '21', NULL, '2015-04-04 21:02:48', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2656', 'CT_DISPLAY_QUERIES', 'DISPLAY_QUERIES', 'false', 'CD_DISPLAY_QUERIES', '10', '6', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2657', 'CT_DEFAULT_PRODUCT_TAX_CLASS', 'DEFAULT_PRODUCT_TAX_CLASS', '1', 'CD_DEFAULT_PRODUCT_TAX_CLASS', '1', '24', '2015-04-04 21:02:46', '2015-04-04 21:02:46', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2658', 'CT_USE_AP_HORIZ_SCROLLER', 'USE_AP_HORIZ_SCROLLER', 'false', 'CD_USE_AP_HORIZ_SCROLLER', '201', '27', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2659', 'CT_SHOW_MORE_INFO', 'SHOW_MORE_INFO', 'True', 'CD_SHOW_MORE_INFO', '8', '10', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2660', 'CT_SCROLLER_WIDTH', 'SCROLLER_WIDTH', '603', 'CD_SCROLLER_WIDTH', '201', '28', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2661', 'CT_SCROLLER_HEIGHT', 'SCROLLER_HEIGHT', '200', 'CD_SCROLLER_HEIGHT', '201', '29', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2662', 'CT_PRODUCT_SHORT_DESCRIPTION', 'PRODUCT_SHORT_DESCRIPTION', 'false', 'CD_PRODUCT_SHORT_DESCRIPTION', '8', '6', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2663', 'CT_DEFINE_MAINPAGE_TEXT_INFO_NO', 'DEFINE_MAINPAGE_TEXT_INFO_NO', '13', 'CD_DEFINE_MAINPAGE_TEXT_INFO_NO', '201', '31', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2664', 'CT_BASKET_CART', 'BASKET_CART', 'cart', 'CD_BASKET_CART', '201', '30', NULL, '2015-04-04 21:02:54', NULL, 'tep_cfg_select_option(array(\'cart\', \'basket\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2665', 'CT_PRODUCT_REVIEWS_ENABLE', 'PRODUCT_REVIEWS_ENABLE', 'True', 'CD_PRODUCT_REVIEWS_ENABLE', '8', '22', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2666', 'CT_DEFINE_AFFILIATE_INFO_INFO_NO', 'DEFINE_AFFILIATE_INFO_INFO_NO', '15', 'CD_DEFINE_AFFILIATE_INFO_INFO_NO', '201', '32', '2015-04-04 21:02:54', '2015-04-04 21:02:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2667', 'CT_ATTRIBUTE_PRICE_DISPLAY', 'ATTRIBUTE_PRICE_DISPLAY', 'separate', 'CD_ATTRIBUTE_PRICE_DISPLAY', '8', '23', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'separate\', \'combined\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2668', 'CT_PRODUCT_LIST_BESTSELLER', 'PRODUCT_LIST_BESTSELLER', '1', 'CD_PRODUCT_LIST_BESTSELLER', '8', '12', NULL, '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2670', 'CT_PRICE_BREAK_PERCENT_BEHAVIOUR', 'PRICE_BREAK_PERCENT_BEHAVIOUR', 'Off Price', 'CD_PRICE_BREAK_PERCENT_BEHAVIOUR', '88', '4', '2015-04-04 21:02:52', '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'Off Price\', \'To Pay\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2671', 'CT_PRICE_BREAK_PRICE_CHANGE_BEHAVIOUR', 'PRICE_BREAK_PRICE_CHANGE_BEHAVIOUR', 'Update Percent', 'CD_PRICE_BREAK_PRICE_CHANGE_BEHAVIOUR', '88', '5', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'Update Percent\', \'Update Prices\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2999', 'CT_PRICE_BREAK_PRICE', 'PRICE_BREAK_PRICE', 'off', 'CD_PRICE_BREAK_PRICE', '88', '3', '2015-04-04 21:02:52', '2015-04-04 21:02:52', NULL, 'tep_cfg_select_option(array(\'high\',\'low\',\'off\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3004', 'CT_OPEN_FEATURED_LIMIT_PRODUCTS_FEATURES', 'OPEN_FEATURED_LIMIT_PRODUCTS_FEATURES', 'true', 'CD_OPEN_FEATURED_LIMIT_PRODUCTS_FEATURES', '99', '5', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3005', 'CT_OPEN_FEATURED_LIMIT_CATEGORIES_FEATURES', 'OPEN_FEATURED_LIMIT_CATEGORIES_FEATURES', 'true', 'CD_OPEN_FEATURED_LIMIT_CATEGORIES_FEATURES', '99', '6', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3006', 'CT_SUSPEND_FEATURED_SETS_EXPIRING', 'SUSPEND_FEATURED_SETS_EXPIRING', 'false', 'CD_SUSPEND_FEATURED_SETS_EXPIRING', '99', '7', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3007', 'CT_FEATURED_SET_SHOW_BUY_NOW_BUTTONS', 'FEATURED_SET_SHOW_BUY_NOW_BUTTONS', 'true', 'CD_FEATURED_SET_SHOW_BUY_NOW_BUTTONS', '99', '8', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3008', 'CT_OPEN_FEATURED_LIMIT_DESCRIPTION_BY', 'OPEN_FEATURED_LIMIT_DESCRIPTION_BY', 'words', 'CD_OPEN_FEATURED_LIMIT_DESCRIPTION_BY', '99', '9', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'words\', \'chars\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3009', 'CT_FEATURED_PRODUCTS_DISPLAY', 'FEATURED_PRODUCTS_DISPLAY', 'true', 'CD_FEATURED_PRODUCTS_DISPLAY', '99', '11', '2015-04-04 21:02:53', '2015-04-04 21:02:53', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3010', 'CT_FEATURED_PRODUCTS_POSITION', 'FEATURED_PRODUCTS_POSITION', '1', 'CD_FEATURED_PRODUCTS_POSITION', '99', '12', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3011', 'CT_MAX_DISPLAY_FEATURED_PRODUCTS', 'MAX_DISPLAY_FEATURED_PRODUCTS', '6', 'CD_MAX_DISPLAY_FEATURED_PRODUCTS', '99', '13', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3012', 'CT_FEATURED_PRODUCTS_COLUMNS', 'FEATURED_PRODUCTS_COLUMNS', '3', 'CD_FEATURED_PRODUCTS_COLUMNS', '99', '14', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3013', 'CT_MAX_FEATURED_WORD_DESCRIPTION', 'MAX_FEATURED_WORD_DESCRIPTION', '24', 'CD_MAX_FEATURED_WORD_DESCRIPTION', '99', '15', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3014', 'CT_DAYS_UNTIL_FEATURED_PRODUCTS', 'DAYS_UNTIL_FEATURED_PRODUCTS', '30', 'CD_DAYS_UNTIL_FEATURED_PRODUCTS', '99', '16', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3015', 'CT_FEATURED_SET', 'FEATURED_SET', '4', 'CD_FEATURED_SET', '99', '17', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'1\', \'2\', \'3\', \'4\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3016', 'CT_FEATURED_SET_STYLE', 'FEATURED_SET_STYLE', '6', 'CD_FEATURED_SET_STYLE', '99', '18', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3017', 'CT_FEATURED_PRODUCTS_GROUPING', 'FEATURED_PRODUCTS_GROUPING', 'gbox', 'CD_FEATURED_PRODUCTS_GROUPING', '99', '19', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'gbox\', \'sbox\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3019', 'CT_FEATURED_PRODUCTS_SORT_ORDER', 'FEATURED_PRODUCTS_SORT_ORDER', 'rand()', 'CD_FEATURED_PRODUCTS_SORT_ORDER', '99', '21', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'p.products_id\', \'pd.products_name\', \'p.products_price\', \'rand()\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3020', 'CT_FEATURED_PRODUCTS_DIRECTION', 'FEATURED_PRODUCTS_DIRECTION', 'DESC', 'CD_FEATURED_PRODUCTS_DIRECTION', '99', '22', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'ASC\', \'DESC\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3021', 'CT_FEATURED_CELLPADDING', 'FEATURED_CELLPADDING', '0', 'CD_FEATURED_CELLPADDING', '99', '23', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3022', 'CT_FEATURED_VLINE_IMAGE_HEIGHT', 'FEATURED_VLINE_IMAGE_HEIGHT', '150', 'CD_FEATURED_VLINE_IMAGE_HEIGHT', '99', '24', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3023', 'CT_FEATURED_LINE_THICKNESS', 'FEATURED_LINE_THICKNESS', '2', 'CD_FEATURED_LINE_THICKNESS', '99', '25', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3024', 'CT_FEATURED_LINE_COLOR', 'FEATURED_LINE_COLOR', 'DDDDDD', 'CD_FEATURED_LINE_COLOR', '99', '26', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_color(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3025', 'CT_FEATURED_MANUFACTURERS_DISPLAY', 'FEATURED_MANUFACTURERS_DISPLAY', 'true', 'CD_FEATURED_MANUFACTURERS_DISPLAY', '99', '31', '2015-04-04 21:02:53', '2015-04-04 21:02:53', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3026', 'CT_FEATURED_MANUFACTURERS_POSITION', 'FEATURED_MANUFACTURERS_POSITION', '2', 'CD_FEATURED_MANUFACTURERS_POSITION', '99', '32', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3027', 'CT_MAX_DISPLAY_FEATURED_MANUFACTURERS', 'MAX_DISPLAY_FEATURED_MANUFACTURERS', '6', 'CD_MAX_DISPLAY_FEATURED_MANUFACTURERS', '99', '33', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3028', 'CT_FEATURED_MANUFACTURERS_COLUMNS', 'FEATURED_MANUFACTURERS_COLUMNS', '3', 'CD_FEATURED_MANUFACTURERS_COLUMNS', '99', '34', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3029', 'CT_DAYS_UNTIL_FEATURED_MANUFACTURERS', 'DAYS_UNTIL_FEATURED_MANUFACTURERS', '30', 'CD_DAYS_UNTIL_FEATURED_MANUFACTURERS', '99', '35', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3030', 'CT_FEATURED_MANUFACTURERS_SET_STYLE', 'FEATURED_MANUFACTURERS_SET_STYLE', '6', 'CD_FEATURED_MANUFACTURERS_SET_STYLE', '99', '36', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3031', 'CT_FEATURED_MANUFACTURERS_SORT_ORDER', 'FEATURED_MANUFACTURERS_SORT_ORDER', 'rand()', 'CD_FEATURED_MANUFACTURERS_SORT_ORDER', '99', '37', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'m.manufacturers_id\', \'m.manufacturers_name\', \'rand()\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3032', 'CT_FEATURED_MANUFACTURERS_DIRECTION', 'FEATURED_MANUFACTURERS_DIRECTION', 'DESC', 'CD_FEATURED_MANUFACTURERS_DIRECTION', '99', '38', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'ASC\', \'DESC\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3033', 'CT_FEATURED_MANUFACTURERS_CELLPADDING', 'FEATURED_MANUFACTURERS_CELLPADDING', '0', 'CD_FEATURED_MANUFACTURERS_CELLPADDING', '99', '39', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3034', 'CT_FEATURED_MANUFACTURERS_VLINE_IMAGE_HEIGHT', 'FEATURED_MANUFACTURERS_VLINE_IMAGE_HEIGHT', '150', 'CD_FEATURED_MANUFACTURERS_VLINE_IMAGE_HEIGHT', '99', '40', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3035', 'CT_FEATURED_MANUFACTURERS_LINE_THICKNESS', 'FEATURED_MANUFACTURERS_LINE_THICKNESS', '2', 'CD_FEATURED_MANUFACTURERS_LINE_THICKNESS', '99', '41', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3036', 'CT_FEATURED_MANUFACTURERS_LINE_COLOR', 'FEATURED_MANUFACTURERS_LINE_COLOR', 'DDDDDD', 'CD_FEATURED_MANUFACTURERS_LINE_COLOR', '99', '42', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_color(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3037', 'CT_FEATURED_MANUFACTURER_DISPLAY', 'FEATURED_MANUFACTURER_DISPLAY', 'true', 'CD_FEATURED_MANUFACTURER_DISPLAY', '99', '51', '2015-04-04 21:02:53', '2015-04-04 21:02:53', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3038', 'CT_FEATURED_MANUFACTURER_POSITION', 'FEATURED_MANUFACTURER_POSITION', '3', 'CD_FEATURED_MANUFACTURER_POSITION', '99', '52', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3039', 'CT_MAX_DISPLAY_FEATURED_MANUFACTURER', 'MAX_DISPLAY_FEATURED_MANUFACTURER', '3', 'CD_MAX_DISPLAY_FEATURED_MANUFACTURER', '99', '53', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3040', 'CT_FEATURED_MANUFACTURER_COLUMNS', 'FEATURED_MANUFACTURER_COLUMNS', '3', 'CD_FEATURED_MANUFACTURER_COLUMNS', '99', '54', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3041', 'CT_MAX_FEATURED_MANUFACTURER_WORD_DESCRIPTION', 'MAX_FEATURED_MANUFACTURER_WORD_DESCRIPTION', '24', 'CD_MAX_FEATURED_MANUFACTURER_WORD_DESCRIPTION', '99', '55', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3042', 'CT_DAYS_UNTIL_FEATURED_MANUFACTURER', 'DAYS_UNTIL_FEATURED_MANUFACTURER', '30', 'CD_DAYS_UNTIL_FEATURED_MANUFACTURER', '99', '56', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3043', 'CT_FEATURED_MANUFACTURER_SET', 'FEATURED_MANUFACTURER_SET', '4', 'CD_FEATURED_MANUFACTURER_SET', '99', '57', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'1\', \'2\', \'3\', \'4\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3044', 'CT_FEATURED_MANUFACTURER_SET_STYLE', 'FEATURED_MANUFACTURER_SET_STYLE', '4', 'CD_FEATURED_MANUFACTURER_SET_STYLE', '99', '58', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3045', 'CT_FEATURED_MANUFACTURER_GROUPING', 'FEATURED_MANUFACTURER_GROUPING', 'gbox', 'CD_FEATURED_MANUFACTURER_GROUPING', '99', '59', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'gbox\', \'sbox\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3047', 'CT_FEATURED_MANUFACTURER_SORT_ORDER', 'FEATURED_MANUFACTURER_SORT_ORDER', 'rand()', 'CD_FEATURED_MANUFACTURER_SORT_ORDER', '99', '61', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'m.manufacturers_id\', \'m.manufacturers_name\', \'p.products_id\', \'pd.products_name\', \'p.products_price\', \'rand()\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3048', 'CT_FEATURED_MANUFACTURER_DIRECTION', 'FEATURED_MANUFACTURER_DIRECTION', 'DESC', 'CD_FEATURED_MANUFACTURER_DIRECTION', '99', '62', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'ASC\', \'DESC\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3049', 'CT_MANUFACTURER_CELLPADDING', 'MANUFACTURER_CELLPADDING', '0', 'CD_MANUFACTURER_CELLPADDING', '99', '63', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3050', 'CT_MANUFACTURER_VLINE_IMAGE_HEIGHT', 'MANUFACTURER_VLINE_IMAGE_HEIGHT', '150', 'CD_MANUFACTURER_VLINE_IMAGE_HEIGHT', '99', '64', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3051', 'CT_MANUFACTURER_LINE_THICKNESS', 'MANUFACTURER_LINE_THICKNESS', '2', 'CD_MANUFACTURER_LINE_THICKNESS', '99', '65', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3052', 'CT_MANUFACTURER_LINE_COLOR', 'MANUFACTURER_LINE_COLOR', 'DDDDDD', 'CD_MANUFACTURER_LINE_COLOR', '99', '66', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_color(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3053', 'CT_FEATURED_CATEGORIES_DISPLAY', 'FEATURED_CATEGORIES_DISPLAY', 'true', 'CD_FEATURED_CATEGORIES_DISPLAY', '99', '71', '2015-04-04 21:02:53', '2015-04-04 21:02:53', '', 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3054', 'CT_FEATURED_CATEGORIES_POSITION', 'FEATURED_CATEGORIES_POSITION', '4', 'CD_FEATURED_CATEGORIES_POSITION', '99', '72', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3055', 'CT_MAX_DISPLAY_FEATURED_CATEGORIES', 'MAX_DISPLAY_FEATURED_CATEGORIES', '6', 'CD_MAX_DISPLAY_FEATURED_CATEGORIES', '99', '73', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3056', 'CT_FEATURED_CATEGORIES_COLUMNS', 'FEATURED_CATEGORIES_COLUMNS', '3', 'CD_FEATURED_CATEGORIES_COLUMNS', '99', '74', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3057', 'CT_MAX_FEATURED_CATEGORIES_WORD_DESCRIPTION', 'MAX_FEATURED_CATEGORIES_WORD_DESCRIPTION', '24', 'CD_MAX_FEATURED_CATEGORIES_WORD_DESCRIPTION', '99', '75', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3058', 'CT_DAYS_UNTIL_FEATURED_CATEGORIES', 'DAYS_UNTIL_FEATURED_CATEGORIES', '30', 'CD_DAYS_UNTIL_FEATURED_CATEGORIES', '99', '76', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3059', 'CT_FEATURED_CATEGORIES_SET', 'FEATURED_CATEGORIES_SET', '4', 'CD_FEATURED_CATEGORIES_SET', '99', '77', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'1\', \'2\', \'3\', \'4\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3060', 'CT_FEATURED_CATEGORIES_SET_STYLE', 'FEATURED_CATEGORIES_SET_STYLE', '6', 'CD_FEATURED_CATEGORIES_SET_STYLE', '99', '78', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3061', 'CT_FEATURED_CATEGORIES_GROUPING', 'FEATURED_CATEGORIES_GROUPING', 'gbox', 'CD_FEATURED_CATEGORIES_GROUPING', '99', '79', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_featured(array(\'gbox\', \'sbox\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3063', 'CT_FEATURED_CATEGORIES_SORT_ORDER', 'FEATURED_CATEGORIES_SORT_ORDER', 'rand()', 'CD_FEATURED_CATEGORIES_SORT_ORDER', '99', '81', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'c.categories_id\', \'cd.categories_name\', \'m.manufacturers_id\', \'p.products_id\', \'pd.products_name\', \'p.products_price\', \'rand()\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3064', 'CT_FEATURED_CATEGORIES_DIRECTION', 'FEATURED_CATEGORIES_DIRECTION', 'DESC', 'CD_FEATURED_CATEGORIES_DIRECTION', '99', '82', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_option(array(\'ASC\', \'DESC\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3065', 'CT_CATEGORIES_CELLPADDING', 'CATEGORIES_CELLPADDING', '0', 'CD_CATEGORIES_CELLPADDING', '99', '83', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3066', 'CT_CATEGORIES_VLINE_IMAGE_HEIGHT', 'CATEGORIES_VLINE_IMAGE_HEIGHT', '150', 'CD_CATEGORIES_VLINE_IMAGE_HEIGHT', '99', '84', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3067', 'CT_CATEGORIES_LINE_THICKNESS', 'CATEGORIES_LINE_THICKNESS', '2', 'CD_CATEGORIES_LINE_THICKNESS', '99', '85', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3068', 'CT_CATEGORIES_LINE_COLOR', 'CATEGORIES_LINE_COLOR', 'DDDDDD', 'CD_CATEGORIES_LINE_COLOR', '99', '86', '2015-04-04 21:02:53', '2015-04-04 21:02:53', NULL, 'tep_cfg_select_color(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3069', 'CT_ONEPAGE_CHECKOUT_ENABLED', 'ONEPAGE_CHECKOUT_ENABLED', 'True', 'CD_ONEPAGE_CHECKOUT_ENABLED', '7575', '1', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'False\',\'True\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3070', 'CT_ONEPAGE_DEFAULT_COUNTRY', 'ONEPAGE_DEFAULT_COUNTRY', '223', 'CD_ONEPAGE_DEFAULT_COUNTRY', '7575', '2', NULL, '2015-04-04 21:02:55', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3071', 'CT_ONEPAGE_ACCOUNT_CREATE', 'ONEPAGE_ACCOUNT_CREATE', 'create', 'CD_ONEPAGE_ACCOUNT_CREATE', '7575', '3', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'required\', \'optional\', \'create\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3072', 'CT_ONEPAGE_SHOW_CUSTOM_COLUMN', 'ONEPAGE_SHOW_CUSTOM_COLUMN', 'true', 'CD_ONEPAGE_SHOW_CUSTOM_COLUMN', '7575', '4', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3073', 'CT_ONEPAGE_LOGIN_REQUIRED', 'ONEPAGE_LOGIN_REQUIRED', 'false', 'CD_ONEPAGE_LOGIN_REQUIRED', '7575', '5', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3074', 'CT_ONEPAGE_SHOW_OSC_COLUMNS', 'ONEPAGE_SHOW_OSC_COLUMNS', 'true', 'CD_ONEPAGE_SHOW_OSC_COLUMNS', '7575', '6', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3075', 'CT_ONEPAGE_BOX_ONE_HEADING', 'ONEPAGE_BOX_ONE_HEADING', '100% Private Secure SSL Transaction', 'CD_ONEPAGE_BOX_ONE_HEADING', '7575', '15', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3076', 'CT_ONEPAGE_BOX_ONE_CONTENT', 'ONEPAGE_BOX_ONE_CONTENT', 'Your shopping cart transaction is taking place on an encrypted SSL webpage; meaning it is secure and safe. We respect all of your private information and none of it will be shared with anyone in anyway.', 'CD_ONEPAGE_BOX_ONE_CONTENT', '7575', '16', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3077', 'CT_ONEPAGE_BOX_TWO_HEADING', 'ONEPAGE_BOX_TWO_HEADING', 'Ordering Information', 'CD_ONEPAGE_BOX_TWO_HEADING', '7575', '17', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3078', 'CT_ONEPAGE_BOX_TWO_CONTENT', 'ONEPAGE_BOX_TWO_CONTENT', '<b>Processing Time</b><br>We will process your order as quickly as possible. Typical processing time for orders shipped ground is 1  2 days. For expedited shipping (2 day or overnight) we make every effort to ship the order the same day if ordered before 2pm.<br><br><b>Order Tracking</b><br>After your order is placed you can login anytime 24/7 to view the status of your order. When your order is shipped you will receive a shipment notification with a tracking number.', 'CD_ONEPAGE_BOX_TWO_CONTENT', '7575', '18', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3079', 'CT_ONEPAGE_DEBUG_EMAIL_ADDRESS', 'ONEPAGE_DEBUG_EMAIL_ADDRESS', 'set.me.to.valid@email.address', 'CD_ONEPAGE_DEBUG_EMAIL_ADDRESS', '7575', '19', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3080', 'CT_ONEPAGE_CHECKOUT_SHOW_ADDRESS_INPUT_FIELDS', 'ONEPAGE_CHECKOUT_SHOW_ADDRESS_INPUT_FIELDS', 'False', 'CD_ONEPAGE_CHECKOUT_SHOW_ADDRESS_INPUT_FIELDS', '7575', '20', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'False\',\'True\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3081', 'CT_ONEPAGE_CHECKOUT_LOADER_POPUP', 'ONEPAGE_CHECKOUT_LOADER_POPUP', 'True', 'CD_ONEPAGE_CHECKOUT_LOADER_POPUP', '7575', '21', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'False\',\'True\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3082', 'CT_ONEPAGE_AUTO_SHOW_BILLING_SHIPPING', 'ONEPAGE_AUTO_SHOW_BILLING_SHIPPING', 'True', 'CD_ONEPAGE_AUTO_SHOW_BILLING_SHIPPING', '7575', '33', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'False\',\'True\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3083', 'CT_ONEPAGE_AUTO_SHOW_DEFAULT_COUNTRY', 'ONEPAGE_AUTO_SHOW_DEFAULT_COUNTRY', '223', 'CD_ONEPAGE_AUTO_SHOW_DEFAULT_COUNTRY', '7575', '34', NULL, '2015-04-04 21:02:55', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3084', 'CT_ONEPAGE_AUTO_SHOW_DEFAULT_STATE', 'ONEPAGE_AUTO_SHOW_DEFAULT_STATE', '12', 'CD_ONEPAGE_AUTO_SHOW_DEFAULT_STATE', '7575', '35', NULL, '2015-04-04 21:02:55', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list_one_page(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3085', 'CT_ONEPAGE_AUTO_SHOW_DEFAULT_ZIP', 'ONEPAGE_AUTO_SHOW_DEFAULT_ZIP', '93401', 'CD_ONEPAGE_AUTO_SHOW_DEFAULT_ZIP', '7575', '36', NULL, '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3086', 'CT_ONEPAGE_TELEPHONE', 'ONEPAGE_TELEPHONE', 'False', 'CD_ONEPAGE_TELEPHONE', '7575', '37', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'False\',\'True\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3087', 'CT_ONEPAGE_ZIP_BELOW', 'ONEPAGE_ZIP_BELOW', 'False', 'CD_ONEPAGE_ZIP_BELOW', '7575', '38', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'False\',\'True\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3088', 'CT_ONEPAGE_CHECKOUT_HIDE_SHIPPING', 'ONEPAGE_CHECKOUT_HIDE_SHIPPING', 'true', 'CD_ONEPAGE_CHECKOUT_HIDE_SHIPPING', '7575', '100', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3089', 'CT_ONEPAGE_ADDR_LAYOUT', 'ONEPAGE_ADDR_LAYOUT', 'vertical', 'CD_ONEPAGE_ADDR_LAYOUT', '7575', '1000', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'vertical\', \'horizontal\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3125', 'CT_STORE_LOGO', 'STORE_LOGO', 'logo.png', 'CD_STORE_LOGO', '1', '2', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3250', 'CT_MAILCHIMP_ENABLE', 'MAILCHIMP_ENABLE', 'false', 'CD_MAILCHIMP_ENABLE', '206', '1', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'false\',\'true\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3251', 'CT_MAILCHIMP_API', 'MAILCHIMP_API', '', 'CD_MAILCHIMP_API', '206', '2', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3252', 'CT_MAILCHIMP_ID', 'MAILCHIMP_ID', '', 'CD_MAILCHIMP_ID', '206', '5', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3253', 'CT_MAILCHIMP_URL', 'MAILCHIMP_URL', '', 'CD_MAILCHIMP_URL', '206', '3', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3254', 'CT_MAILCHIMP_U', 'MAILCHIMP_U', '', 'CD_MAILCHIMP_U', '206', '4', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3255', 'CT_MAILCHIMP_OPT_IN', 'MAILCHIMP_OPT_IN', 'true', 'CD_MAILCHIMP_OPT_IN', '206', '6', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'false\',\'true\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3256', 'CT_MAILCHIMP_DELETE', 'MAILCHIMP_DELETE', 'false', 'CD_MAILCHIMP_DELETE', '206', '7', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'false\',\'true\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3257', 'CT_MAILCHIMP_SEND_GOODBYE', 'MAILCHIMP_SEND_GOODBYE', 'true', 'CD_MAILCHIMP_SEND_GOODBYE', '206', '8', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'false\',\'true\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3258', 'CT_MAILCHIMP_SEND_NOTIFY', 'MAILCHIMP_SEND_NOTIFY', 'true', 'CD_MAILCHIMP_SEND_NOTIFY', '206', '9', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'false\',\'true\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3259', 'CT_MAILCHIMP_LAST_SYNC', 'MAILCHIMP_LAST_SYNC', '', 'CD_MAILCHIMP_LAST_SYNC', '206', '10', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3300', 'CT_SHOW_STORE_OPENING_HOURS', 'SHOW_STORE_OPENING_HOURS', 'true', 'CD_SHOW_STORE_OPENING_HOURS', '207', '1', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'false\',\'true\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3301', 'CT_STORE_OPENING_HOURS_TEXT', 'STORE_OPENING_HOURS_TEXT', 'Our store is open from 9.30am to 5pm from Monday to Friday', 'CD_STORE_OPENING_HOURS_TEXT', '207', '2', NULL, '2015-04-04 21:02:55', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3302', 'CT_SHOW_EMAIL_ADDRESS', 'SHOW_EMAIL_ADDRESS', 'true', 'CD_SHOW_EMAIL_ADDRESS', '207', '3', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'false\',\'true\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3303', 'CT_SHOW_MAILING_ADDRESS', 'SHOW_MAILING_ADDRESS', 'true', 'CD_SHOW_MAILING_ADDRESS', '207', '4', '2015-04-04 21:02:55', '2015-04-04 21:02:55', NULL, 'tep_cfg_select_option(array(\'false\',\'true\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3305', 'CT_SHOW_TAX_RATE_NEAR_PRICE', 'SHOW_TAX_RATE_NEAR_PRICE', 'false', 'CD_SHOW_TAX_RATE_NEAR_PRICE', '1', '22', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3306', 'CT_SHOW_SHIPPING_NEAR_PRICE', 'SHOW_SHIPPING_NEAR_PRICE', 'false', 'CD_SHOW_SHIPPING_NEAR_PRICE', '1', '23', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3307', 'CT_PRODUCT_LIST_DATE_ADDED', 'PRODUCT_LIST_DATE_ADDED', 'true', 'CD_PRODUCT_LIST_DATE_ADDED', '8', '24', NULL, '2015-04-04 21:02:49', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3308', 'CT_CATEGORY_DROPDOWN_SWITCH', 'DISABLE_CATEGORY_DROPDOWN_SWITCH', 'false', 'CD_CATEGORY_DROPDOWN_SWITCH', '1', '26', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3309', 'CT_FORCE_CATALOG_LANGUAGE', 'FORCE_CATALOG_LANGUAGE', 'false', 'CD_FORCE_CATALOG_LANGUAGE', '1', '10', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3310', 'CT_FORCE_ADMIN_LANGUAGE', 'FORCE_ADMIN_LANGUAGE', 'false', 'CD_FORCE_ADMIN_LANGUAGE', '1', '10', NULL, '2015-04-04 21:02:46', NULL, 'tep_cfg_select_option(array(\'true\',  \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3311', 'CT_CODE_SUFFIX_SEPERATOR', 'CODE_SUFFIX_SEPERATOR', '-', 'CD_CODE_SUFFIX_SEPERATOR', '1', '27', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3312', 'CT_SEND_ALL_EMAIL_COPY_TO', 'SEND_ALL_EMAIL_COPY_TO', '', 'CD_SEND_ALL_EMAIL_COPY_TO', '1', '13', NULL, '2015-04-04 21:02:46', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3500', 'CT_CLOUDZOOM_WIDTH', 'CLOUDZOOM_WIDTH', 'auto', 'CD_CLOUDZOOM_WIDTH', '47', '2', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3501', 'CT_CLOUDZOOM_HEIGHT', 'CLOUDZOOM_HEIGHT', 'auto', 'CD_CLOUDZOOM_HEIGHT', '47', '3', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3502', 'CT_CLOUDZOOM_POSITION', 'CLOUDZOOM_POSITION', 'right', 'CD_CLOUDZOOM_POSITION', '47', '4', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3503', 'CT_CLOUDZOOM_ADJUSTX', 'CLOUDZOOM_ADJUSTX', '10', 'CD_CLOUDZOOM_ADJUSTX', '47', '5', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3504', 'CT_CLOUDZOOM_ADJUSTY', 'CLOUDZOOM_ADJUSTY', '-4', 'CD_CLOUDZOOM_ADJUSTY', '47', '6', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3505', 'CT_CLOUDZOOM_TINT', 'CLOUDZOOM_TINT', 'false', 'CD_CLOUDZOOM_TINT', '47', '7', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3506', 'CT_CLOUDZOOM_TINTOPACITY', 'CLOUDZOOM_TINTOPACITY', '0.5', 'CD_CLOUDZOOM_TINTOPACITY', '47', '8', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3507', 'CT_CLOUDZOOM_LENSOPACITY', 'CLOUDZOOM_LENSOPACITY', '0.5', 'CD_CLOUDZOOM_LENSOPACITY', '47', '9', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3508', 'CT_CLOUDZOOM_SOFTFOCUS', 'CLOUDZOOM_SOFTFOCUS', 'false', 'CD_CLOUDZOOM_SOFTFOCUS', '47', '10', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3509', 'CT_CLOUDZOOM_SMOOTHMOVE', 'CLOUDZOOM_SMOOTHMOVE', '3', 'CD_CLOUDZOOM_SMOOTHMOVE', '47', '11', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3510', 'CT_CLOUDZOOM_SHOWTITLE', 'CLOUDZOOM_SHOWTITLE', 'true', 'CD_CLOUDZOOM_SHOWTITLE', '47', '12', NULL, '2015-04-04 21:02:51', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3511', 'CT_CLOUDZOOM_TITLEOPACITY', 'CLOUDZOOM_TITLEOPACITY', '0.5', 'CD_CLOUDZOOM_TITLEOPACITY', '47', '13', NULL, '2015-04-04 21:02:51', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3512', 'CT_ADD_THIS_ENABLED', 'ADD_THIS_ENABLED', 'true', 'CD_ADD_THIS_ENABLED', '208', '1', '0000-00-00 00:00:00', '2015-04-04 21:02:55', '', 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3513', 'CT_ADD_THIS_CODE', 'ADD_THIS_CODE', '', 'CD_ADD_THIS_CODE', '208', '2', '0000-00-00 00:00:00', '2015-04-04 21:02:55', '', 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3514', 'CT_ADD_THIS_JAVASCRIPT', 'ADD_THIS_JAVASCRIPT', '', 'CD_ADD_THIS_JAVASCRIPT', '208', '3', '0000-00-00 00:00:00', '2015-04-04 21:02:55', '', 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3515', 'CT_ADD_THIS_ADDRESS_BAR', 'ADD_THIS_ADDRESS_BAR', '', 'CD_ADD_THIS_ADDRESS_BAR', '208', '4', '0000-00-00 00:00:00', '2015-04-04 21:02:55', '', 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3516', 'CT_ADD_THIS_ARTICLES', 'ADD_THIS_ARTICLES', 'true', 'CD_ADD_THIS_ARTICLES', '208', '5', '0000-00-00 00:00:00', '2015-04-04 21:02:55', '', 'tep_cfg_select_option(array(\'true\',\'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3525', 'CT_INDIVIDUAL_SHIP_HOME_COUNTRY', 'INDIVIDUAL_SHIP_HOME_COUNTRY', '223', 'CD_INDIVIDUAL_SHIP_HOME_COUNTRY', '7', NULL, '2015-04-04 21:02:48', '2015-04-04 21:02:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3526', 'CT_INDIVIDUAL_SHIP_INCREASE', 'INDIVIDUAL_SHIP_INCREASE', '3', 'CD_INDIVIDUAL_SHIP_INCREASE', '7', NULL, '2015-04-04 21:02:48', '2015-04-04 21:02:48', NULL, NULL);
drop table if exists configuration_group;
create table configuration_group (
  configuration_group_id int(11) not null auto_increment,
  configuration_group_title varchar(64) not null ,
  configuration_group_description varchar(255) not null ,
  sort_order int(5) ,
  visible int(1) default '1' ,
  PRIMARY KEY (configuration_group_id)
);

insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('1', 'BOX_CONFIGURATION_MYSTORE', 'General information about my store', '1', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('2', 'BOX_CONFIGURATION_MIN_VALUES', 'The minimum values for functions / data', '2', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('3', 'BOX_CONFIGURATION_MAX_VALUES', 'The maximum values for functions / data', '3', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('4', 'BOX_CONFIGURATION_IMAGES', 'Image parameters', '4', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('5', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', 'Customer account configuration', '5', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('6', 'Module Options', 'Hidden from configuration', '6', '0');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('7', 'BOX_CONFIGURATION_SHIPPING', 'Shipping options available at my store', '7', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('8', 'BOX_CONFIGURATION_PRODUCT_LISTING', 'Product Listing configuration options', '8', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('9', 'BOX_CONFIGURATION_STOCK', 'Stock configuration options', '9', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('10', 'BOX_CONFIGURATION_LOGGING', 'Logging configuration options', '10', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('11', 'BOX_CONFIGURATION_CACHE', 'Caching configuration options', '11', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('12', 'BOX_CONFIGURATION_EMAIL', 'General setting for E-Mail transport and HTML E-Mails', '12', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('13', 'BOX_CONFIGURATION_DOWNLOAD', 'Downloadable products options', '13', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('14', 'BOX_CONFIGURATION_GZIP', 'GZip compression options', '14', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('15', 'BOX_CONFIGURATION_SESSIONS', 'Session options', '15', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('16', 'BOX_CONFIGURATION_MAINTENANCE', 'Site Maintenance Options', '16', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('25', 'BOX_CONFIGURATION_WYSIWYG', 'CK Editor Options', '15', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('30', 'BOX_CONFIGURATION_PRINT', 'Options for Printable Catalog', '30', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('35', 'BOX_CONFIGURATION_AFFILIATE', 'Options for the Affiliate Program', '50', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('45', 'BOX_CONFIGURATION_MOPICS', 'The options which configure Dynamic MoPics.', '45', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('46', 'BOX_CONFIGURATION_SLIMBOX', 'The options which configure Slimbox.', '46', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('47', 'BOX_CONFIGURATION_CLOUDZOOM', 'The options which configure CloudZoom.', '47', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('50', 'BOX_CONFIGURATION_PRODUCT_INFO', 'Product Information page configuration options', '8', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('55', 'BOX_CONFIGURATION_PAGE_CACHE', 'Settings for the page cache contribution', '20', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('60', 'BOX_CONFIGURATION_SEO_URLS', 'Options for ULTIMATE Seo Urls 5 by FWR Media', '902', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('65', 'BOX_CONFIGURATION_WISHLIST', 'Settings for your Wish List', '25', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('70', 'BOX_CONFIGURATION_EDITOR', 'Configuration options for Order Editor', '903', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('80', 'BOX_TOOLS_RECOVER_CART', 'Recover Cart Sales (RCS) Configuration Values', '55', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('85', 'BOX_CONFIGURATION_GOOGLE_ANALYTICS', 'Google Analytics Settings', '99', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('86', 'BOX_CONFIGURATION_SEO_POPOUT', 'SEO Pop Out Multilayer Menu', '904', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('87', 'BOX_CONFIGURATION_RECAPTCHA', 'reCaptcha Settings', '905', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('88', 'BOX_CONFIGURATION_PRODUCT_PRICE_BREAKS', 'Configuration options for price breaks', '88', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('89', 'BOX_CONFIGURATION_GOOGLE_MAPS', 'Google Maps Settings', '89', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('99', 'BOX_CONFIGURATION_OFS', 'Configure featured sets', '99', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('201', 'BOX_CONFIGURATION_TEMPLATE_SETUP', 'Template Settings', '201', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('203', 'BOX_CONFIGURATION_NOTIFICATIONS', 'Notifications', '203', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('204', 'BOX_CONFIGURATION_SLIDESHOW_SETTINGS', 'SlideShow Settings', '204', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('205', 'BOX_CONFIGURATION_CORNER_BANNERS', 'Corner Banners', '205', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('206', 'BOX_CONFIGURATION_MC', 'MailChimp Newsletters', '206', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('207', 'BOX_CONFIGURATION_CONTACT', 'Contact Us Form', '207', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('208', 'BOX_CONFIGURATION_ADDTHIS', 'AddThis', '208', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('456', 'BOX_CONFIGURATION_ARTICLES', 'Settings for Articles', '456', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('7575', 'BOX_CONFIGURATION_OPC', 'Settings for one page checkout', '16', '1');
drop table if exists counter;
create table counter (
  startdate char(8) ,
  counter int(12) 
);

insert into counter (startdate, counter) values ('20150405', '3');
drop table if exists counter_history;
create table counter_history (
  month char(8) ,
  counter int(12) 
);

drop table if exists countries;
create table countries (
  countries_id int(11) not null auto_increment,
  countries_name varchar(64) not null ,
  countries_iso_code_2 char(2) not null ,
  countries_iso_code_3 char(3) not null ,
  address_format_id int(11) not null ,
  active tinyint(3) unsigned default '1' ,
  PRIMARY KEY (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
);

insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('1', 'Afghanistan', 'AF', 'AFG', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('2', 'Albania', 'AL', 'ALB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('3', 'Algeria', 'DZ', 'DZA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('4', 'American Samoa', 'AS', 'ASM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('5', 'Andorra', 'AD', 'AND', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('6', 'Angola', 'AO', 'AGO', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('7', 'Anguilla', 'AI', 'AIA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('8', 'Antarctica', 'AQ', 'ATA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('9', 'Antigua and Barbuda', 'AG', 'ATG', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('10', 'Argentina', 'AR', 'ARG', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('11', 'Armenia', 'AM', 'ARM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('12', 'Aruba', 'AW', 'ABW', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('13', 'Australia', 'AU', 'AUS', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('14', 'Austria', 'AT', 'AUT', '5', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('15', 'Azerbaijan', 'AZ', 'AZE', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('16', 'Bahamas', 'BS', 'BHS', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('17', 'Bahrain', 'BH', 'BHR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('18', 'Bangladesh', 'BD', 'BGD', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('19', 'Barbados', 'BB', 'BRB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('20', 'Belarus', 'BY', 'BLR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('21', 'Belgium', 'BE', 'BEL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('22', 'Belize', 'BZ', 'BLZ', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('23', 'Benin', 'BJ', 'BEN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('24', 'Bermuda', 'BM', 'BMU', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('25', 'Bhutan', 'BT', 'BTN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('26', 'Bolivia', 'BO', 'BOL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('27', 'Bosnia and Herzegowina', 'BA', 'BIH', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('28', 'Botswana', 'BW', 'BWA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('29', 'Bouvet Island', 'BV', 'BVT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('30', 'Brazil', 'BR', 'BRA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('31', 'British Indian Ocean Territory', 'IO', 'IOT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('32', 'Brunei Darussalam', 'BN', 'BRN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('33', 'Bulgaria', 'BG', 'BGR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('34', 'Burkina Faso', 'BF', 'BFA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('35', 'Burundi', 'BI', 'BDI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('36', 'Cambodia', 'KH', 'KHM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('37', 'Cameroon', 'CM', 'CMR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('38', 'Canada', 'CA', 'CAN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('39', 'Cape Verde', 'CV', 'CPV', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('40', 'Cayman Islands', 'KY', 'CYM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('41', 'Central African Republic', 'CF', 'CAF', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('42', 'Chad', 'TD', 'TCD', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('43', 'Chile', 'CL', 'CHL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('44', 'China', 'CN', 'CHN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('45', 'Christmas Island', 'CX', 'CXR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('46', 'Cocos (Keeling) Islands', 'CC', 'CCK', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('47', 'Colombia', 'CO', 'COL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('48', 'Comoros', 'KM', 'COM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('49', 'Congo', 'CG', 'COG', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('50', 'Cook Islands', 'CK', 'COK', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('51', 'Costa Rica', 'CR', 'CRI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('52', 'Cote D\'Ivoire', 'CI', 'CIV', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('53', 'Croatia', 'HR', 'HRV', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('54', 'Cuba', 'CU', 'CUB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('55', 'Cyprus', 'CY', 'CYP', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('56', 'Czech Republic', 'CZ', 'CZE', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('57', 'Denmark', 'DK', 'DNK', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('58', 'Djibouti', 'DJ', 'DJI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('59', 'Dominica', 'DM', 'DMA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('60', 'Dominican Republic', 'DO', 'DOM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('61', 'East Timor', 'TP', 'TMP', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('62', 'Ecuador', 'EC', 'ECU', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('63', 'Egypt', 'EG', 'EGY', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('64', 'El Salvador', 'SV', 'SLV', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('65', 'Equatorial Guinea', 'GQ', 'GNQ', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('66', 'Eritrea', 'ER', 'ERI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('67', 'Estonia', 'EE', 'EST', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('68', 'Ethiopia', 'ET', 'ETH', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('69', 'Falkland Islands (Malvinas)', 'FK', 'FLK', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('70', 'Faroe Islands', 'FO', 'FRO', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('71', 'Fiji', 'FJ', 'FJI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('72', 'Finland', 'FI', 'FIN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('73', 'France', 'FR', 'FRA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('74', 'France, Metropolitan', 'FX', 'FXX', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('75', 'French Guiana', 'GF', 'GUF', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('76', 'French Polynesia', 'PF', 'PYF', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('77', 'French Southern Territories', 'TF', 'ATF', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('78', 'Gabon', 'GA', 'GAB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('79', 'Gambia', 'GM', 'GMB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('80', 'Georgia', 'GE', 'GEO', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('81', 'Germany', 'DE', 'DEU', '5', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('82', 'Ghana', 'GH', 'GHA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('83', 'Gibraltar', 'GI', 'GIB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('84', 'Greece', 'GR', 'GRC', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('85', 'Greenland', 'GL', 'GRL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('86', 'Grenada', 'GD', 'GRD', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('87', 'Guadeloupe', 'GP', 'GLP', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('88', 'Guam', 'GU', 'GUM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('89', 'Guatemala', 'GT', 'GTM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('90', 'Guinea', 'GN', 'GIN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('91', 'Guinea-bissau', 'GW', 'GNB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('92', 'Guyana', 'GY', 'GUY', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('93', 'Haiti', 'HT', 'HTI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('94', 'Heard and Mc Donald Islands', 'HM', 'HMD', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('95', 'Honduras', 'HN', 'HND', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('96', 'Hong Kong', 'HK', 'HKG', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('97', 'Hungary', 'HU', 'HUN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('98', 'Iceland', 'IS', 'ISL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('99', 'India', 'IN', 'IND', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('100', 'Indonesia', 'ID', 'IDN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('101', 'Iran (Islamic Republic of)', 'IR', 'IRN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('102', 'Iraq', 'IQ', 'IRQ', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('103', 'Ireland', 'IE', 'IRL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('104', 'Israel', 'IL', 'ISR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('105', 'Italy', 'IT', 'ITA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('106', 'Jamaica', 'JM', 'JAM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('107', 'Japan', 'JP', 'JPN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('108', 'Jordan', 'JO', 'JOR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('109', 'Kazakhstan', 'KZ', 'KAZ', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('110', 'Kenya', 'KE', 'KEN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('111', 'Kiribati', 'KI', 'KIR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('112', 'Korea, Democratic People\'s Republic of', 'KP', 'PRK', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('113', 'Korea, Republic of', 'KR', 'KOR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('114', 'Kuwait', 'KW', 'KWT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('115', 'Kyrgyzstan', 'KG', 'KGZ', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('116', 'Lao People\'s Democratic Republic', 'LA', 'LAO', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('117', 'Latvia', 'LV', 'LVA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('118', 'Lebanon', 'LB', 'LBN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('119', 'Lesotho', 'LS', 'LSO', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('120', 'Liberia', 'LR', 'LBR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('121', 'Libyan Arab Jamahiriya', 'LY', 'LBY', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('122', 'Liechtenstein', 'LI', 'LIE', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('123', 'Lithuania', 'LT', 'LTU', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('124', 'Luxembourg', 'LU', 'LUX', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('125', 'Macau', 'MO', 'MAC', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('126', 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('127', 'Madagascar', 'MG', 'MDG', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('128', 'Malawi', 'MW', 'MWI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('129', 'Malaysia', 'MY', 'MYS', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('130', 'Maldives', 'MV', 'MDV', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('131', 'Mali', 'ML', 'MLI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('132', 'Malta', 'MT', 'MLT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('133', 'Marshall Islands', 'MH', 'MHL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('134', 'Martinique', 'MQ', 'MTQ', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('135', 'Mauritania', 'MR', 'MRT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('136', 'Mauritius', 'MU', 'MUS', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('137', 'Mayotte', 'YT', 'MYT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('138', 'Mexico', 'MX', 'MEX', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('139', 'Micronesia, Federated States of', 'FM', 'FSM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('140', 'Moldova, Republic of', 'MD', 'MDA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('141', 'Monaco', 'MC', 'MCO', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('142', 'Mongolia', 'MN', 'MNG', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('143', 'Montserrat', 'MS', 'MSR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('144', 'Morocco', 'MA', 'MAR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('145', 'Mozambique', 'MZ', 'MOZ', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('146', 'Myanmar', 'MM', 'MMR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('147', 'Namibia', 'NA', 'NAM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('148', 'Nauru', 'NR', 'NRU', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('149', 'Nepal', 'NP', 'NPL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('150', 'Netherlands', 'NL', 'NLD', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('151', 'Netherlands Antilles', 'AN', 'ANT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('152', 'New Caledonia', 'NC', 'NCL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('153', 'New Zealand', 'NZ', 'NZL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('154', 'Nicaragua', 'NI', 'NIC', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('155', 'Niger', 'NE', 'NER', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('156', 'Nigeria', 'NG', 'NGA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('157', 'Niue', 'NU', 'NIU', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('158', 'Norfolk Island', 'NF', 'NFK', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('159', 'Northern Mariana Islands', 'MP', 'MNP', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('160', 'Norway', 'NO', 'NOR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('161', 'Oman', 'OM', 'OMN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('162', 'Pakistan', 'PK', 'PAK', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('163', 'Palau', 'PW', 'PLW', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('164', 'Panama', 'PA', 'PAN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('165', 'Papua New Guinea', 'PG', 'PNG', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('166', 'Paraguay', 'PY', 'PRY', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('167', 'Peru', 'PE', 'PER', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('168', 'Philippines', 'PH', 'PHL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('169', 'Pitcairn', 'PN', 'PCN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('170', 'Poland', 'PL', 'POL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('171', 'Portugal', 'PT', 'PRT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('172', 'Puerto Rico', 'PR', 'PRI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('173', 'Qatar', 'QA', 'QAT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('174', 'Reunion', 'RE', 'REU', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('175', 'Romania', 'RO', 'ROM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('176', 'Russian Federation', 'RU', 'RUS', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('177', 'Rwanda', 'RW', 'RWA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('178', 'Saint Kitts and Nevis', 'KN', 'KNA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('179', 'Saint Lucia', 'LC', 'LCA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('180', 'Saint Vincent and the Grenadines', 'VC', 'VCT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('181', 'Samoa', 'WS', 'WSM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('182', 'San Marino', 'SM', 'SMR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('183', 'Sao Tome and Principe', 'ST', 'STP', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('184', 'Saudi Arabia', 'SA', 'SAU', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('185', 'Senegal', 'SN', 'SEN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('186', 'Seychelles', 'SC', 'SYC', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('187', 'Sierra Leone', 'SL', 'SLE', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('188', 'Singapore', 'SG', 'SGP', '4', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('189', 'Slovakia (Slovak Republic)', 'SK', 'SVK', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('190', 'Slovenia', 'SI', 'SVN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('191', 'Solomon Islands', 'SB', 'SLB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('192', 'Somalia', 'SO', 'SOM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('193', 'South Africa', 'ZA', 'ZAF', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('194', 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('195', 'Spain', 'ES', 'ESP', '3', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('196', 'Sri Lanka', 'LK', 'LKA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('197', 'St. Helena', 'SH', 'SHN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('198', 'St. Pierre and Miquelon', 'PM', 'SPM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('199', 'Sudan', 'SD', 'SDN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('200', 'Suriname', 'SR', 'SUR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('201', 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('202', 'Swaziland', 'SZ', 'SWZ', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('203', 'Sweden', 'SE', 'SWE', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('204', 'Switzerland', 'CH', 'CHE', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('205', 'Syrian Arab Republic', 'SY', 'SYR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('206', 'Taiwan', 'TW', 'TWN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('207', 'Tajikistan', 'TJ', 'TJK', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('208', 'Tanzania, United Republic of', 'TZ', 'TZA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('209', 'Thailand', 'TH', 'THA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('210', 'Togo', 'TG', 'TGO', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('211', 'Tokelau', 'TK', 'TKL', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('212', 'Tonga', 'TO', 'TON', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('213', 'Trinidad and Tobago', 'TT', 'TTO', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('214', 'Tunisia', 'TN', 'TUN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('215', 'Turkey', 'TR', 'TUR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('216', 'Turkmenistan', 'TM', 'TKM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('217', 'Turks and Caicos Islands', 'TC', 'TCA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('218', 'Tuvalu', 'TV', 'TUV', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('219', 'Uganda', 'UG', 'UGA', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('220', 'Ukraine', 'UA', 'UKR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('221', 'United Arab Emirates', 'AE', 'ARE', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('222', 'United Kingdom', 'GB', 'GBR', '6', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('223', 'United States', 'US', 'USA', '2', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('224', 'United States Minor Outlying Islands', 'UM', 'UMI', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('225', 'Uruguay', 'UY', 'URY', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('226', 'Uzbekistan', 'UZ', 'UZB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('227', 'Vanuatu', 'VU', 'VUT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('228', 'Vatican City State (Holy See)', 'VA', 'VAT', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('229', 'Venezuela', 'VE', 'VEN', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('230', 'Viet Nam', 'VN', 'VNM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('231', 'Virgin Islands (British)', 'VG', 'VGB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('232', 'Virgin Islands (U.S.)', 'VI', 'VIR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('233', 'Wallis and Futuna Islands', 'WF', 'WLF', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('234', 'Western Sahara', 'EH', 'ESH', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('235', 'Yemen', 'YE', 'YEM', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('236', 'Yugoslavia', 'YU', 'YUG', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('237', 'Zaire', 'ZR', 'ZAR', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('238', 'Zambia', 'ZM', 'ZMB', '1', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id, active) values ('239', 'Zimbabwe', 'ZW', 'ZWE', '1', '1');
drop table if exists coupon_email_track;
create table coupon_email_track (
  unique_id int(11) not null auto_increment,
  coupon_id int(11) default '0' not null ,
  customer_id_sent int(11) default '0' not null ,
  sent_firstname varchar(32) ,
  sent_lastname varchar(32) ,
  emailed_to varchar(32) ,
  date_sent datetime not null ,
  PRIMARY KEY (unique_id)
);

drop table if exists coupon_gv_customer;
create table coupon_gv_customer (
  customer_id int(5) default '0' not null ,
  amount decimal(8,4) default '0.0000' not null ,
  PRIMARY KEY (customer_id),
  KEY customer_id (customer_id)
);

drop table if exists coupon_gv_queue;
create table coupon_gv_queue (
  unique_id int(5) not null auto_increment,
  customer_id int(5) default '0' not null ,
  order_id int(5) default '0' not null ,
  amount decimal(8,4) default '0.0000' not null ,
  date_created datetime not null ,
  ipaddr varchar(32) not null ,
  release_flag char(1) default 'N' not null ,
  release_date datetime not null ,
  PRIMARY KEY (unique_id),
  KEY uid (unique_id, customer_id, order_id)
);

drop table if exists coupon_redeem_track;
create table coupon_redeem_track (
  unique_id int(11) not null auto_increment,
  coupon_id int(11) default '0' not null ,
  customer_id int(11) default '0' not null ,
  redeem_date datetime default '0001-01-01 01:01:01' not null ,
  redeem_ip varchar(32) not null ,
  order_id int(11) default '0' not null ,
  PRIMARY KEY (unique_id)
);

drop table if exists coupons;
create table coupons (
  coupon_id int(11) not null auto_increment,
  coupon_type char(1) default 'F' not null ,
  coupon_code varchar(32) not null ,
  coupon_amount decimal(8,4) default '0.0000' not null ,
  coupon_minimum_order decimal(8,4) default '0.0000' not null ,
  coupon_start_date datetime default '0001-01-01 01:01:01' not null ,
  coupon_expire_date datetime default '0001-01-01 01:01:01' not null ,
  uses_per_coupon int(5) default '1' not null ,
  uses_per_user int(5) default '0' not null ,
  restrict_to_products varchar(255) ,
  restrict_to_categories varchar(255) ,
  coupon_exclude_cg varchar(32) not null ,
  restrict_to_customers text ,
  coupon_active char(1) default 'Y' not null ,
  date_created datetime default '0001-01-01 01:01:01' not null ,
  date_modified datetime default '0001-01-01 01:01:01' not null ,
  PRIMARY KEY (coupon_id)
);

drop table if exists coupons_description;
create table coupons_description (
  coupon_id int(11) default '0' not null ,
  language_id int(11) default '0' not null ,
  coupon_name varchar(32) not null ,
  coupon_description text ,
  KEY coupon_id (coupon_id)
);

drop table if exists currencies;
create table currencies (
  currencies_id int(11) not null auto_increment,
  title varchar(32) not null ,
  code char(3) not null ,
  symbol_left varchar(12) ,
  symbol_right varchar(12) ,
  decimal_point char(1) ,
  thousands_point char(1) ,
  decimal_places char(1) ,
  value float(13,8) ,
  last_updated datetime ,
  PRIMARY KEY (currencies_id),
  KEY idx_currencies_code (code)
);

insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('1', 'US Dollar', 'USD', '$', '', '.', ',', '2', '1.00000000', '2015-04-04 21:03:00');
insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('2', 'Euro', 'EUR', '', 'EUR', '.', ',', '2', '1.00000000', '2015-04-04 21:03:00');
insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('3', 'UK Pound', 'GBP', '£', '', '.', ',', '2', '1.00000000', '2015-04-04 21:03:00');
drop table if exists customer_log;
create table customer_log (
  login_number int(11) not null auto_increment,
  user_name varchar(200) ,
  ip_address varchar(32) ,
  type varchar(200) ,
  login_time varchar(64) ,
  PRIMARY KEY (login_number)
);

drop table if exists customers;
create table customers (
  customers_id int(11) not null auto_increment,
  purchased_without_account tinyint(1) unsigned default '0' not null ,
  customers_gender char(1) not null ,
  customers_firstname varchar(32) not null ,
  customers_lastname varchar(32) not null ,
  customers_dob datetime default '0001-01-01 01:01:01' not null ,
  customers_email_address varchar(96) not null ,
  customers_default_address_id int(11) ,
  customers_telephone varchar(32) not null ,
  customers_fax varchar(32) ,
  customers_password varchar(40) not null ,
  customers_newsletter char(1) ,
  customers_newsletter_type varchar(32) default 'html' not null ,
  guest_account tinyint(1) default '0' not null ,
  customers_login varchar(96) ,
  customers_group_name varchar(27) default 'Retail' not null ,
  customers_group_id int(11) default '0' not null ,
  customers_group_ra enum('0','1') default '0' not null ,
  customers_payment_allowed varchar(255) not null ,
  customers_shipment_allowed varchar(255) not null ,
  customers_paypal_payerid varchar(20) ,
  customers_paypal_ec tinyint(1) unsigned default '0' not null ,
  PRIMARY KEY (customers_id),
  UNIQUE idx_customers_login (customers_login),
  KEY purchased_without_account (purchased_without_account),
  KEY idx_customers_email_address (customers_email_address)
);

insert into customers (customers_id, purchased_without_account, customers_gender, customers_firstname, customers_lastname, customers_dob, customers_email_address, customers_default_address_id, customers_telephone, customers_fax, customers_password, customers_newsletter, customers_newsletter_type, guest_account, customers_login, customers_group_name, customers_group_id, customers_group_ra, customers_payment_allowed, customers_shipment_allowed, customers_paypal_payerid, customers_paypal_ec) values ('1', '0', '', 'Muhammad', 'Nauman', '0001-01-01 01:01:01', 'mhmmd.nauman@gmail.com', '1', '+923134086188', '', '65c79dcb105fabdfbc1858b76e3f2046:5f', '', '', '0', NULL, 'Retail', '0', '0', '', '', NULL, '0');
drop table if exists customers_basket;
create table customers_basket (
  customers_basket_id int(11) not null auto_increment,
  customers_id int(11) not null ,
  products_id tinytext not null ,
  customers_basket_quantity int(2) not null ,
  final_price decimal(15,4) ,
  customers_basket_date_added char(8) ,
  PRIMARY KEY (customers_basket_id),
  KEY idx_customers_basket_customers_id (customers_id)
);

drop table if exists customers_basket_attributes;
create table customers_basket_attributes (
  customers_basket_attributes_id int(11) not null auto_increment,
  customers_id int(11) not null ,
  products_id tinytext not null ,
  products_options_id int(11) not null ,
  products_options_value_id int(11) not null ,
  products_options_value_text varchar(32) ,
  PRIMARY KEY (customers_basket_attributes_id),
  KEY idx_customers_basket_att_customers_id (customers_id)
);

drop table if exists customers_groups;
create table customers_groups (
  customers_group_id smallint(5) unsigned default '0' not null ,
  customers_group_name varchar(32) not null ,
  customers_group_show_tax enum('1','0') default '1' not null ,
  customers_group_tax_exempt enum('0','1') default '0' not null ,
  group_payment_allowed varchar(255) not null ,
  group_shipment_allowed varchar(255) not null ,
  PRIMARY KEY (customers_group_id)
);

insert into customers_groups (customers_group_id, customers_group_name, customers_group_show_tax, customers_group_tax_exempt, group_payment_allowed, group_shipment_allowed) values ('0', 'Retail', '1', '0', '', '');
insert into customers_groups (customers_group_id, customers_group_name, customers_group_show_tax, customers_group_tax_exempt, group_payment_allowed, group_shipment_allowed) values ('1', 'Wholesale', '0', '0', '', '');
drop table if exists customers_info;
create table customers_info (
  customers_info_id int(11) not null ,
  customers_info_date_of_last_logon datetime ,
  customers_info_number_of_logons int(5) ,
  customers_info_date_account_created datetime ,
  customers_info_date_account_last_modified datetime ,
  global_product_notifications int(1) default '0' ,
  PRIMARY KEY (customers_info_id)
);

insert into customers_info (customers_info_id, customers_info_date_of_last_logon, customers_info_number_of_logons, customers_info_date_account_created, customers_info_date_account_last_modified, global_product_notifications) values ('1', NULL, '0', '2015-04-04 22:03:28', '2015-04-04 22:03:47', '0');
drop table if exists customers_notes;
create table customers_notes (
  customers_notes_id int(11) not null auto_increment,
  customers_id int(11) not null ,
  customers_notes_message text not null ,
  customers_notes_editor varchar(20) not null ,
  customers_notes_date date not null ,
  PRIMARY KEY (customers_notes_id)
);

drop table if exists customers_to_extra_fields;
create table customers_to_extra_fields (
  customers_id int(11) default '0' not null ,
  fields_id int(11) default '0' not null ,
  value text 
);

drop table if exists customers_wishlist;
create table customers_wishlist (
  products_id int(11) not null ,
  customers_id int(11) default '0' not null 
);

drop table if exists customers_wishlist_attributes;
create table customers_wishlist_attributes (
  customers_wishlist_attributes_id int(11) not null auto_increment,
  customers_id int(11) default '0' not null ,
  products_id int(11) not null ,
  products_options_id int(11) default '0' not null ,
  products_options_value_id int(11) default '0' not null ,
  PRIMARY KEY (customers_wishlist_attributes_id)
);

drop table if exists db_version;
create table db_version (
  database_version varchar(128) 
);

insert into db_version (database_version) values ('v2.5.4');
drop table if exists discount_categories;
create table discount_categories (
  discount_categories_id int(11) not null auto_increment,
  discount_categories_name varchar(255) not null ,
  PRIMARY KEY (discount_categories_id)
);

drop table if exists extra_field_labels;
create table extra_field_labels (
  epf_id int(10) unsigned not null ,
  languages_id int(11) not null ,
  epf_label varchar(64) ,
  epf_active_for_language tinyint(1) default '1' not null ,
  PRIMARY KEY (epf_id, languages_id)
);

drop table if exists extra_field_values;
create table extra_field_values (
  value_id int(10) unsigned not null auto_increment,
  epf_id int(10) unsigned not null ,
  languages_id int(11) not null ,
  parent_id int(10) unsigned default '0' not null ,
  sort_order int(11) default '0' not null ,
  epf_value varchar(64) ,
  value_depends_on int(10) unsigned default '0' not null ,
  value_image varchar(255) ,
  PRIMARY KEY (value_id),
  KEY IDX_EPF (epf_id, languages_id),
  KEY IDX_LINK (value_depends_on)
);

drop table if exists extra_fields;
create table extra_fields (
  fields_id int(11) not null auto_increment,
  fields_input_type int(11) default '0' not null ,
  fields_input_value text not null ,
  fields_status tinyint(2) default '0' not null ,
  fields_required_status tinyint(2) default '0' not null ,
  fields_size int(5) default '0' not null ,
  fields_cef_cg_hide varchar(255) not null ,
  PRIMARY KEY (fields_id)
);

drop table if exists extra_fields_info;
create table extra_fields_info (
  fields_id int(11) default '0' not null ,
  languages_id int(11) default '0' not null ,
  fields_name varchar(32) not null 
);

drop table if exists extra_product_fields;
create table extra_product_fields (
  epf_id int(10) unsigned not null auto_increment,
  epf_order int(11) default '0' not null ,
  epf_status tinyint(1) default '1' not null ,
  epf_uses_value_list tinyint(1) default '0' not null ,
  epf_advanced_search tinyint(1) default '1' not null ,
  epf_show_in_listing tinyint(1) default '0' not null ,
  epf_size tinyint(3) unsigned default '64' not null ,
  epf_use_as_meta_keyword tinyint(1) default '0' not null ,
  epf_use_to_restrict_listings tinyint(1) default '0' not null ,
  epf_show_parent_chain tinyint(1) default '0' not null ,
  epf_quick_search tinyint(1) default '0' not null ,
  epf_multi_select tinyint(1) default '0' not null ,
  epf_checked_entry tinyint(1) default '0' not null ,
  epf_value_display_type tinyint(1) default '0' not null ,
  epf_num_columns tinyint(3) unsigned default '1' not null ,
  epf_has_linked_field tinyint(1) default '0' not null ,
  epf_links_to int(10) unsigned default '0' not null ,
  epf_textarea tinyint(1) default '0' not null ,
  epf_show_in_admin tinyint(1) default '1' not null ,
  epf_all_categories tinyint(1) default '1' not null ,
  epf_category_ids text ,
  PRIMARY KEY (epf_id),
  KEY IDX_ORDER (epf_order)
);

drop table if exists extra_value_exclude;
create table extra_value_exclude (
  value_id1 int(10) unsigned not null ,
  value_id2 int(10) unsigned not null ,
  PRIMARY KEY (value_id1, value_id2)
);

drop table if exists feedmachine;
create table feedmachine (
  id int(11) not null auto_increment,
  config_filename varchar(64) not null ,
  filename varchar(64) not null ,
  ftp_status tinyint(1) default '0' not null ,
  ftp_server varchar(128) not null ,
  ftp_path varchar(128) not null ,
  ftp_username varchar(64) not null ,
  ftp_password varchar(128) not null ,
  ftp_upload_period int(11) not null ,
  language_code char(2) not null ,
  currency_code char(3) not null ,
  countries_iso_2 char(2) not null ,
  url_parameters varchar(255) not null ,
  PRIMARY KEY (id),
  UNIQUE config_filename (config_filename)
);

drop table if exists geo_zones;
create table geo_zones (
  geo_zone_id int(11) not null auto_increment,
  geo_zone_name varchar(32) not null ,
  geo_zone_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime not null ,
  PRIMARY KEY (geo_zone_id)
);

insert into geo_zones (geo_zone_id, geo_zone_name, geo_zone_description, last_modified, date_added) values ('1', 'Florida', 'Florida local sales tax zone', NULL, '2015-04-04 21:03:03');
drop table if exists google_checkout;
create table google_checkout (
  customers_id int(11) ,
  buyer_id bigint(20) 
);

drop table if exists google_configuration;
create table google_configuration (
  google_configuration_key varchar(255) ,
  google_configuration_value text 
);

insert into google_configuration (google_configuration_key, google_configuration_value) values ('GOOGLE_ANALYTICS_ID', 'NONE');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('US_PO_BOX', 'True');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('ENABLE_CARRIER_CALCULATED_SHIPPING', 'True');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('CARRIER_CALCULATED_SHIPPING', 'fedexGrounddomestic_types_CCS:10|0|0, fedexHome Deliverydomestic_types_CCS:10|0|0, fedexExpress Saverdomestic_types_CCS:10|0|0, fedex2Daydomestic_types_CCS:10|0|0, fedexStandard Overnightdomestic_types_CCS:10|0|0, fedexPriority Overnightdomestic_types_CCS:10|0|0, fedexFirst Overnightdomestic_types_CCS:10|0|0, upsGrounddomestic_types_CCS:10|0|0, ups3 Day Selectdomestic_types_CCS:10|0|0, ups2nd Day Airdomestic_types_CCS:10|0|0, ups2nd Day Air AMdomestic_types_CCS:10|0|0, upsNext Day Air Saverdomestic_types_CCS:10|0|0, upsNext Day Airdomestic_types_CCS:10|0|0, upsNext Day Air Early AMdomestic_types_CCS:10|0|0, uspsMedia Maildomestic_types_CCS:10|0|0, uspsParcel Postdomestic_types_CCS:10|0|0, uspsExpress Maildomestic_types_CCS:10|0|0, uspsPriority Maildomestic_types_CCS:10|0|0');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('ROUNDING_MODE', 'HALF_EVEN');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('ROUNDING_RULE', 'PER_LINE');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('HTACCESS_AUTH_MODE', 'False');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('VIRTUAL_GOODS', 'False');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('SANDBOX_MERCHANT_CALLBACK_PROTOCOL', 'https');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('CART_EXPIRATION_TIME', 'NONE');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('USE_CART_MESSAGING', 'False');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('THIRD_PARTY_TRACKING_URL', 'NONE');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('RESTRICTED_CATEGORIES', '');
insert into google_configuration (google_configuration_key, google_configuration_value) values ('CONTINUE_SHOPPING_URL', 'gc_return.php');
drop table if exists google_orders;
create table google_orders (
  orders_id int(11) ,
  google_order_number bigint(20) ,
  order_amount decimal(15,4) 
);

drop table if exists help_pages;
create table help_pages (
  current_page varchar(255) not null ,
  help_page varchar(255) not null ,
  help_page_title varchar(255) not null ,
  language int(11) not null 
);

insert into help_pages (current_page, help_page, help_page_title, language) values ('index.php', 'http://wiki.oscdox.com/v2.5/oscmax_docs', 'Help Index', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('currencies.php', 'http://wiki.oscdox.com/v2.5/currencies', 'Currencies', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('countries.php', 'http://wiki.oscdox.com/v2.5/countries', 'Countries', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('admin_members.php', 'http://wiki.oscdox.com/v2.5/member_groups', 'Admin Members', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('admin_files.php', 'http://wiki.oscdox.com/v2.5/files_access', 'File Access', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('categories.php', 'http://wiki.oscdox.com/v2.5/categories_and_products', 'Categories', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('products_attributes.php', 'http://wiki.oscdox.com/v2.5/products_attributes', 'Product Attributes', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('manufacturers.php', 'http://wiki.oscdox.com/v2.5/manufacturers', 'Manufacturers', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('reviews.php', 'http://wiki.oscdox.com/v2.5/reviews', 'Reviews', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('easypopulate.php', 'http://wiki.oscdox.com/v2.5/easypopulate', 'Easy Populate', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('modules.php', 'http://wiki.oscdox.com/v2.5/modules', 'Modules', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('customers.php', 'http://wiki.oscdox.com/v2.5/customer', 'Customers', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('customer_groups.php', 'http://wiki.oscdox.com/v2.5/customers_groups', 'Customer Groups', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('create_order.php', 'http://wiki.oscdox.com/v2.5/create_order', 'Create Order', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('backup.php', 'http://wiki.oscdox.com/v2.5/database_backup', 'Database Backup', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('infobox_configuration.php', 'http://wiki.oscdox.com/v2.5/infoboxes', 'Infobox Configuration', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=1', 'http://wiki.oscdox.com/v2.5/my_store', 'My Store', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=2', 'http://wiki.oscdox.com/v2.5/minimum_values', 'Minimum Values', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=3', 'http://wiki.oscdox.com/v2.5/maximum_values', 'Maximum Values', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=4', 'http://wiki.oscdox.com/v2.5/images', 'Images', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=5', 'http://wiki.oscdox.com/v2.5/customer_details', 'Customer Details', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=7', 'http://wiki.oscdox.com/v2.5/shipping_packing', 'Shipping and Packing', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=8', 'http://wiki.oscdox.com/v2.5/product_listing', 'Product Listing', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=9', 'http://wiki.oscdox.com/v2.5/stock', 'Stock', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=10', 'http://wiki.oscdox.com/v2.5/logging', 'Logging', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=12', 'http://wiki.oscdox.com/v2.5/email_options', 'Email Options', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=13', 'http://wiki.oscdox.com/v2.5/downloads', 'Downloads', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=14', 'http://wiki.oscdox.com/v2.5/gzip_compression', 'GZip Compression', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=15', 'http://wiki.oscdox.com/v2.5/sessions', 'Sessions', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=16', 'http://wiki.oscdox.com/v2.5/site_maintenance', 'Site Maintenance', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=201', 'http://wiki.oscdox.com/v2.5/template_setup', 'Template Setup', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=203', 'http://wiki.oscdox.com/v2.5/notifications', 'Notifications', '0');
insert into help_pages (current_page, help_page, help_page_title, language) values ('configuration.php?gID=206', 'http://wiki.oscdox.com/v2.5/mailchimp_newsletters', 'Mail Chimp', '0');
drop table if exists http_error;
create table http_error (
  error_number int(11) not null auto_increment,
  error_code varchar(250) ,
  error_url varchar(250) ,
  error_ip varchar(250) ,
  error_browser varchar(250) ,
  error_refer varchar(250) ,
  error_timestamp varchar(250) ,
  PRIMARY KEY (error_number)
);

drop table if exists information;
create table information (
  information_id tinyint(3) unsigned not null auto_increment,
  information_group_id int(11) unsigned default '0' not null ,
  information_title varchar(255) not null ,
  information_description text not null ,
  information_url varchar(255) not null ,
  information_target varchar(255) not null ,
  parent_id int(11) ,
  sort_order tinyint(3) unsigned default '0' not null ,
  visible enum('1','0') default '1' not null ,
  show_in_infobox enum('1','0') default '1' not null ,
  language_id int(11) default '0' not null ,
  info_cg_hide varchar(255) ,
  PRIMARY KEY (information_id, language_id)
);

insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('1', '2', 'TEXT_GREETING_PERSONAL', 'Welcome back <span class=\"greetUser\">%s!</span> Would you like to see which <a href=\"%s\"><u>new products</u></a> are available to purchase?', '', '_top', '0', '1', '1', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('1', '2', 'TEXT_GREETING_PERSONAL', 'Sch&ouml;n das Sie wieder da sind <span class=\"greetUser\">%s!</span> M&ouml;chten Sie die <a href=\"%s\"><u>neue Produkte</u></a> ansehen?', '', '_top', '0', '1', '1', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('1', '2', 'TEXT_GREETING_PERSONAL', '¡Bienvenido de nuevo <span class=\"greetUser\">%s!</span> ¿Le gustaría ver qué <a href=\"%s\"><u>nuevos productos</u></a> hay disponibles?', '', '_top', '0', '1', '1', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('2', '2', 'TEXT_GREETING_PERSONAL_RELOGON', '<small>If you are not %s, please <a href=\"%s\"><u>log yourself in</u></a> with your account information.</small>', '', '_top', '0', '2', '1', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('2', '2', 'TEXT_GREETING_PERSONAL_RELOGON', '<small>Wenn Sie nicht %s sind, melden Sie sich bitte <a href=\"%s\"><u>hier</u></a> mit Ihrem Kundenkonto an.</small>', '', '_top', '0', '2', '1', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('2', '2', 'TEXT_GREETING_PERSONAL_RELOGON', '<small>Si no es %s, por favor <a href=\"%s\"><u>entre aquí</u></a> e introduzca sus datos.</small>', '', '_top', '0', '2', '1', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('3', '2', 'TEXT_GREETING_GUEST', 'Welcome <span class=\"greetUser\">Guest!</span> Would you like to <a href=\"%s\"><u>log yourself in</u></a>? Or would you prefer to <a href=\"%s\"><u>create an account</u></a>?', '', '_top', '0', '3', '1', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('3', '2', 'TEXT_GREETING_GUEST', 'Herzlich Willkommen <span class=\"greetUser\">Gast!</span> M&ouml;chten Sie sich <a href=\"%s\"><u>anmelden</u></a>? Oder wollen Sie ein <a href=\"%s\"><u>Kundenkonto</u></a> er&ouml;ffnen?', '', '_top', '0', '3', '1', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('3', '2', 'TEXT_GREETING_GUEST', '¡Bienvenido <span class=\"greetUser\">Invitado!</span> ¿Le gustaría <a href=\"%s\"><u>entrar en su cuenta</u></a> o preferiría <a href=\"%s\"><u>crear una cuenta nueva</u></a>?', '', '_top', '0', '3', '1', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('8', '1', 'Shipping &amp; Returns', '<p>
	This Page is for your shipping policies. Edit this in your admin panel under Configuration &gt;&gt; Templates &gt;&gt; Information Pages</p>', '', '_top', '0', '3', '1', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('8', '1', 'Versandkosten und Rücksendungen', '<p>
	&nbsp;</p>
<div style=\"font-family: Arial, Verdana, sans-serif; font-size: 12px; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255); \">
	<p>
		This Page is for your shipping policies. Edit this in your admin panel under Configuration &gt;&gt; Templates &gt;&gt; Information Pages</p>
</div>', '', '_top', '0', '3', '1', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('8', '1', 'Envíos/Devoluciones', '<p>
	&nbsp;</p>
<div style=\"font-family: Arial, Verdana, sans-serif; font-size: 12px; color: rgb(34, 34, 34); background-color: rgb(255, 255, 255); \">
	<p>
		Esta página es para las políticas de envío. Edítala en el panel de administración en la sección Configuración &gt;&gt; Plantillas &gt;&gt; Páginas de información</p>
</div>', '', '_top', '0', '3', '1', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('9', '1', 'Gift Voucher FAQ', '<p>
	<b>Purchasing Gift Vouchers</b></p>
<p>
	Gift Vouchers are purchased just like any other item in our store. You can pay for them using the store&#39;s standard payment method(s). Once purchased the value of the Gift Voucher will be added to your own personal Gift Voucher Account. If you have funds in your Gift Voucher Account, you will notice that the amount now shows in the Shopping Cart box, and also provides a link to a page where you can send the Gift Voucher to someone via email.</p>
<p>
	&nbsp;</p>
<p>
	<b>How to Send Gift Vouchers</b></p>
<p>
	To send a Gift Voucher that you have purchased, you need to go to our Send Gift Voucher Page. You can find the link to this page in the Shopping Cart Box in the right hand column of each page. When you send a Gift Voucher, you need to specify the following:<br />
	<br />
	The name of the person you are sending the Gift Voucher to.<br />
	The email address of the person you are sending the Gift Voucher to.<br />
	The amount you want to send. (Note you don&#39;t have to send the full amount that is in your Gift Voucher Account.)&nbsp;<br />
	A short message which will appear in the email.<br />
	<br />
	Please ensure that you have entered all of the information correctly, although you will be given the opportunity to change this as much as you want before the email is actually sent.</p>
<p>
	&nbsp;</p>
<p>
	<b>Buying with Gift Vouchers</b></p>
<p>
	If you have funds in your Gift Voucher Account, you can use those funds to purchase other items in our store. At the checkout stage, an extra box will appear. Clicking this box will apply those funds in your Gift Voucher Account. Please note, you will still have to select another payment method if there is not enough in your Gift Voucher Account to cover the cost of your purchase. If you have more funds in your Gift Voucher Account than the total cost of your purchase the balance will be left in your Gift Voucher Account for the future.</p>
<p>
	&nbsp;</p>
<p>
	<b>Redeeming Gift Vouchers</b></p>
<p>
	If you receive a Gift Voucher by email it will contain details of who sent you the Gift Voucher, along with possibly a short message from them. The Email will also contain the Gift Voucher Number. It is probably a good idea to print out this email for future reference. You can now redeem the Gift Voucher in two ways:</p>
<ol>
	<li>
		By clicking on the link contained within the email for this express purpose. This will take you to the store&#39;s Redeem Voucher page. you will then be requested to create an account, before the Gift Voucher is validated and placed in your Gift Voucher Account ready for you to spend it on whatever you want.<br />
		&nbsp;</li>
	<li>
		During the checkout process, on the same page that you select a payment method there will be a box to enter a Redeem Code. Enter the code here, and click the redeem button. The code will be validated and added to your Gift Voucher account. You can then use the amount to purchase any item from our store</li>
</ol>', '', '_top', '0', '4', '1', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('9', '1', 'Geschenkgutschein FAQ', '<p><b>Geschenkgutscheine kaufen</b></p><p>Geschenkgutscheine k&ouml;nnen Sie genau so wie jedes andere Produkt in unserem Shop erwerben. Die Bezahlung erfolgt &uuml;ber die angebotenen Zahlungsarten. Danach wird der Gutschein Ihrem pers&ouml;nlichen Gutscheinkonto hinzugef&uuml;gt. In diesem Fall wird der Gutscheinwert in Ihrem Warenkorb angezeigt. Dort finden Sie auch einen Link, &uuml;ber den Sie den Gutschein an jemanden per E-Mail verschenken k&ouml;nnen.</p><p>&nbsp;</p><p><b>Geschenkgutscheine versenden</b></p><p>Einen Geschenkgutschein, den Sie erworben haben,&nbsp; versenden Sie &uuml;ber die Seite &quot;Geschenkgutschein versenden&quot;.&nbsp; Den Link zu dieser Seite finden Sie im Warenkorbfenster in der rechten Spalte auf jeder Seite. Beim Versand eines Geschenkgutscheines m&uuml;ssen Sie Folgendes angeben:<br /><br />Der Name des Empf&auml;ngers<br />Die E-Mail-Adresse des Empf&auml;ngers&#39;<br />Den Wert des Gutscheines (Hinweis: Es mu&szlig; sich nicht um den Gesamtbetrag Ihres Gutscheinkontos handeln.)&nbsp;<br />Eine Nachricht an den Gutscheinempf&auml;nger<br /><br />Bitte versichern Sie sich, dass alle Angaben korrekt sind. Sie k&ouml;nnen die Angaben jedoch vor dem tats&auml;chlichen Versand der E-Mail unbegrenzt &auml;ndern.</p><p>&nbsp;</p><p><b>Mit Geschenkgutscheinen einkaufen</b></p><p>Falls Sie ein Guthaben auf Ihrem Geschenkgutscheinkonto haben, k&ouml;nnen Sie damit in unserem Shop einkaufen. W&auml;hrend des Bestellvorganges erscheint eine zus&auml;tzliche Box. Ein Klick auf diese Box zieht Ihr Guthaben vom Rechnungsbetrag ab. Falls das Guthaben nicht f&uuml;r den gesamten Rechnungsbetrag ausreicht, w&auml;hlen Sie bitte f&uuml;r den Rest eine der angebotenen Zahlungsarten. Falls Ihr Guthaben den Rechnungsbetrag &uuml;bersteigt, verbleibt die Differenz auf Ihrem Guthabenkonto.</p><p>&nbsp;</p><p><b>Geschenkgutscheine</b></p><p>Wenn&nbsp; Sie einen Geschenkgutschein per E-Mail erhalten haben, so enth&auml;lt finden Sie darin neben dem Absender und eventuell einer kurzen Nachricht die Gutscheinnummer. Sie k&ouml;nnen den Gutschein auf zweierlei Arten einl&ouml;sen:</p><ol><li>Klicken Sie auf den Link, der Sie auf eine Seite unseres Shops leitet, wo Sie den Gutschein mit Ihrem Kundenkonto verkn&uuml;pfen k&ouml;nnen. Nachdem der Gutschein von uns freigeschaltet wurde, k&ouml;nnen Sie den Betrag nach Belieben f&uuml;r Eink&auml;ufe in unserem Shop verwenden.<br />&nbsp;</li><li>W&auml;hrend des Bestellvorganges k&ouml;nnen Sie die Gutscheinnummer direkt in ein Formularfeld eingeben. Durch einen Klick auf &quot;Einl&ouml;sen&quot; wird der Betrag Ihrem Gutscheink&ouml;nto hinzugef&uuml;gt und kann f&uuml;r Eink&auml;ufe verwendet werden.</li></ol>', '', '_top', '0', '4', '1', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('9', '1', 'FAQ cheques regalo', '', '', '_top', '0', '4', '1', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('10', '1', 'Privacy Notice', '<p>
	Privacy Policy</p>', '', '_top', '0', '5', '1', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('10', '1', 'Privatsphäre und Datenschutz', '', '', '_top', '0', '5', '1', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('10', '1', 'Privacidad', '', '', '_top', '0', '5', '1', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('11', '1', 'Conditions of Use', '<p>
	Conditions of Use</p>', '', '_top', '0', '6', '1', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('11', '1', 'AGB', '<p>Unsere Allgemeinen Gesch&auml;ftsbedingungen</p>', '', '_top', '0', '6', '1', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('11', '1', 'Condiciones de uso', '<p>
	Condiciones de uso</p>', '', '_top', '0', '6', '1', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('12', '1', 'Down for maintenance', '<p>The site is currently down for maintenance. Please excuse the dust, and try back later.</p>', '', '_top', '0', '2', '0', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('12', '1', 'Wartungsarbeiten', '<p>Diese Website ist derzeit wegen Wartungsarbeiten leider nicht erreichbar. Bitte besuchen Sie uns sp&auml;ter noch einmal.</p>', '', '_top', '0', '2', '0', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('12', '1', 'Cerrado por mantenimiento', '<p>El sitio está actualmente cerrado por mantenimiento. Por favor, inténtelo de nuevo más tarde.</p>', '', '_top', '0', '2', '0', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('13', '1', 'Index Page Text', '<p><font face=\"arial, helvetica, sans-serif\">To modify the content of this page, go to your Admin Panel -> Configuration -> Templates -> Information Pages.</font></p><hr /><p><font face=\"arial, helvetica, sans-serif\">This is osCmax v2.5, the power e-commerce shopping cart system.</font></p><p><font face=\"Arial\">The official <strong><em>osCmax </em></strong>Support Site is <a href=\"http://www.oscmax.com/\"><font color=\"#800080\">http://www.oscmax.com</font></a> . There are very active support forums, the wiki, documentation, downloads, and everything else related to <strong><em>osCmax.</em></strong></font></p>', '', '_top', '0', '1', '0', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('13', '1', 'Index-Seite Text', '<p><font face=\"arial, helvetica, sans-serif\">&Auml;ndern Sie diesen Text im Admin Panel unter -&gt; Einstellungen -&gt; Templates -&gt; Informationsseiten.</font></p><hr /><p><font face=\"arial, helvetica, sans-serif\">Dies ist osCmax v2.5, das m&auml;chtige Onlineshop-System.</font></p><p><font face=\"Arial\">Die offizielle osCmax Support Seite finden Sie unter <a href=\"http://www.oscmax.com\">http://www.oscmax.com</a>. Es existieren dort sehr aktive Support-Foren, ein Wiki, Anleitungen, Downloads und vieles mehr.</font></p>', '', '_top', '0', '1', '0', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('13', '1', 'Texto página inicio', '<p><font face=\"arial, helvetica, sans-serif\">Para modificar el contenido de esta página, vaya al Panel de administración -> Configuración -> Plantillas -> Páginas de información.</font></p><hr /><p><font face=\"arial, helvetica, sans-serif\">Esto es osCmax v2.5, completo sistema de compras de comercio electrónico.</font></p><p><font face=\"Arial\">El sitio web de soporte es <a href=\"http://www.oscmax.com/\"><font color=\"#800080\">http://www.oscmax.com</font></a>. Hay foros de soporte muy activos, wiki, documentación, descargas y todo lo relacionado con <strong><em>osCmax.</em></strong>.</font></p>', '', '_top', '0', '1', '0', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('14', '1', 'Affiliate Terms and Conditions', '<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
	<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(255, 0, 0); font-weight: bold; \">By filling out the signup form you acknowledge that you have read the terms and conditions below for the YOURCOMPANYNAMEorWEBSITE AFFILIATE Program, understand, and agree with them.</span></p>
<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
	<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \"><b>1. Joining the Program</b><br />
	By filling out the signup form you will automatically become an AFFILIATE and are bound by the terms of this agreement. Your participation in the program is solely for this purpose: to legally advertise our website to receive a commission on products purchased by your referral individuals.</span></p>
<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
	<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \"><b>2. Payment Schedule</b></span></p>
<ol type=\"a\">
	<li>
		<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \">Eligible payments - all AFFILIATE monies due for orders generated as a result of AFFILIATE links/Web Site will be held for 30 days after the Shipping Date of an order. Orders are typically shipped 1-7 days after a order is placed. This allows us ample time to compensate for returns, exchanges or canceled orders. Payments will be calculated and checks sent out to AFFILIATE during the last week of any given month according to the terms and conditions of this document.</span></li>
	<li>
		<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \">AFFILIATE Payments - payment to AFFILIATE will not be rendered for amounts less than $10.00 USD unless requested by AFFILIATE. Example: if you have a total of $50.00 in sales you would have $5.00 in your affiliate account, thus your account will carry over ino the next months cycle. When your account total reaches $10.00 or more you will be sent a check provided all orders associated meet the condiditons set forth in (a) above.</span></li>
	<li>
		<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \">Store Credit (Doggie Dollars) can be issued upon request in lieu of payment by check to AFFILIATE.</span></li>
</ol>
<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
	&nbsp;</p>
<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
	<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \"><b>3. Revocation of AFFILIATE Status</b><br />
	Your AFFILIATE application and status in the program may be suspended or terminated for any of the following reasons:</span></p>
<p>
	<li>
		<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \">Inappropriate advertisements (False claims, misleading hyperlinks)</span></li>
</p>
<p>
	<li>
		<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \">Spamming (mass email, mass newsgroup posting, etc...)</span></li>
</p>
<p>
	<li>
		<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \">Advertising on sites containing/promoting illegal activities</span></li>
</p>
<p>
	<li>
		<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \">Violation of intellectual property rights.</span>
		<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
			<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \"><b>4. AFFILIATE Links</b><br />
			You may use graphic and text links both on your Web Site and in emails. The site may also be advertised &quot;offline&quot; in classified ads, magazines, and newpapers. You may use the graphics and text provided to you by us, or you may create your own as long as they are approved by us first.</span></p>
		<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
			<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \"><b>5. AFFILIATE Tracking</b><br />
			When a web surfer clicks through your AFFILIATE link, a cookie is set in their browser that contains your AFFILIATE username. Also, their IP address is tracked in the database along with your AFFILIATE name. When this person decides to buy a product, the script will look for this cookie and/or try to match their IP address to identify the AFFILIATE who will be awarded the commission. Visitors sent through your AFFILIATE link may make a purchase later in time and the commission will still be awarded if the cookie is present in their browser and/or the are using the same IP address as the one logged in the database.</span></p>
		<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
			<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \"><b>6. Terms of the agreement</b><br />
			These terms will begin upon your signup with the AFFILIATE program and will end when your AFFILIATE account is terminated. The terms of this agreement may be modified by us at any time. If any modification to the terms is unnacceptable to you, your only choice is to terminate your AFFILIATE account. Your continuing participation in the program will constitute your acceptance of any change.</span></p>
		<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
			<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \"><b>7. Liability</b><br />
			We will not be liable for indirect or accidental damages (loss of revenue, commissions) due to AFFILIATE tracking failures, loss of database files, and any results of &quot;intents of harm&quot; to the program or our website. We do not make any expressed or implied warranties with respect to the AFFILIATE program and/or products sold at this site. We make no claim that the operation of the AFFILIATE program and our website will be error-free and we will not be liable for any interruptions or errors.&nbsp;<br />
			<br />
			Affiliate further agrees and warrants that it will comply with all local, state and federal laws (including, but not limited to, the &quot;CAN-SPAM&quot; Act, effective January 1, 2004) regarding the sending of e-mails.&nbsp;<br />
			<br />
			AFFILIATE shall indemnify and hold YOURCOMPANYNAMEorWEBSITE harmless from any and all legal actions, damages or liabilities incurred from the day-to-day operations of AFFILIATE. Under no circumstances will YOURCOMPANYNAMEorWEBSITE be liable whether in tort, contract or otherwise for indirect, incidental, consequential, special or exemplary damages (including but not limited to damages for any loss of revenue, profits, business interruption, loss of business information or data, loss of goodwill, work stoppage, hardware or software failure, or other pecuniary loss) arising from or relating to any provision of this Agreement or the program. Without limiting the foregoing, YOURCOMPANYNAMEorWEBSITE aggregate liability arising with respect to this Agreement will not exceed the total fees paid or payable to AFFILIATE under this agreement.&nbsp;<br />
			<br />
			YOURCOMPANYNAMEorWEBSITE will own all right, title and interest in and to all information that is created or collected in the operation of the YOURCOMPANYNAMEorWEBSITE Web site and reserves the right to amend or terminate this Agreement at any time, with or without notice to AFFILIATE.&nbsp;<br />
			<br />
			The laws of the State of California shall govern this Agreement. Should there be any legal dispute between the parties, then both parties agree to take the matter before arbitration/mediation in Placer County , CA should YOURCOMPANYNAMEorWEBSITE request arbitration/mediation in lieu of formal legal process. Both parties mutually agree that the sole legal venue for all disputes shall be in the Placer County General District Court, CA.</span></p>
		<p style=\"font-family: Verdana, Arial, sans-serif; font-size: 11px; line-height: 1.5; \">
			<span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(0, 0, 0); \"><span style=\"font-family: verdana, tahoma, arial; font-size: 10pt; color: rgb(255, 0, 0); font-weight: bold; \">By filling out the signup form you acknowledge that you have read the terms and conditions above for the YOURCOMPANYNAMEorWEBSITE AFFILIATE Program, understand, and agree with them.</span></span></p>
	</li>
</p>', '', '_top', '0', '7', '0', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('14', '1', 'Affiliate AGB', 'Legen Sie Ihre Affiliate-Bedingungen hier.', '', '_top', '0', '7', '0', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('14', '1', 'Términos y condiciones afiliados ', 'Introduzca aquí los términos y condiciones de afiliados.', '', '_top', '0', '7', '0', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('15', '1', 'Affiliate Information', '<p>
	Your Affiliate Information goes in here</p>', '', '_top', '0', '8', '1', '1', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('15', '1', 'Affiliate-Information', '<p>F&uuml;gen Sie hier Ihre Informationen zum Affiliateprogramm ein.</p>', '', '_top', '0', '8', '1', '1', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('15', '1', 'Información afiliado', '<p>
	Su información de afiliado va aquí</p>', '', '_top', '0', '8', '1', '1', '3', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('16', '1', 'Affiliate Program FAQ', '<p>
	Your Affiliate FAQ goes in here</p>', '', '_top', '0', '8', '1', '0', '1', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('16', '1', 'Affiliateprogramm FAQ', '<p>F&uuml;gen Sie hier Ihre FAQ Informationen zum Affiliateprogramm ein.</p>', '', '_top', '0', '8', '1', '0', '2', NULL);
insert into information (information_id, information_group_id, information_title, information_description, information_url, information_target, parent_id, sort_order, visible, show_in_infobox, language_id, info_cg_hide) values ('16', '1', 'FAQ del Programa de afiliados', '<p>
	Su información FAQ de afiliado va aquí</p>', '', '_top', '0', '8', '1', '0', '3', NULL);
drop table if exists information_group;
create table information_group (
  information_group_id int(11) not null auto_increment,
  information_group_title varchar(64) not null ,
  information_group_description varchar(255) not null ,
  sort_order int(5) ,
  visible int(1) default '1' ,
  locked varchar(255) not null ,
  PRIMARY KEY (information_group_id)
);

insert into information_group (information_group_id, information_group_title, information_group_description, sort_order, visible, locked) values ('1', 'Information pages', 'Information pages', '1', '1', '');
insert into information_group (information_group_id, information_group_title, information_group_description, sort_order, visible, locked) values ('2', 'Welcome message', 'Welcome message', '2', '1', 'information_title, sort_order, parent_id, visible, info_cg_hide, show_in_infobox, information_url, information_target');
drop table if exists languages;
create table languages (
  languages_id int(11) not null auto_increment,
  name varchar(32) not null ,
  code char(2) not null ,
  image varchar(64) ,
  directory varchar(32) ,
  sort_order int(3) ,
  meta_keywords varchar(255) ,
  PRIMARY KEY (languages_id),
  KEY IDX_LANGUAGES_NAME (name)
);

insert into languages (languages_id, name, code, image, directory, sort_order, meta_keywords) values ('1', 'English', 'en', 'icon.gif', 'english', '1', '');
insert into languages (languages_id, name, code, image, directory, sort_order, meta_keywords) values ('2', 'Deutsch', 'de', 'icon.gif', 'german', '2', '');
insert into languages (languages_id, name, code, image, directory, sort_order, meta_keywords) values ('3', 'Español', 'es', 'icon.gif', 'espanol', '3', '');
drop table if exists manufacturers;
create table manufacturers (
  manufacturers_id int(11) not null auto_increment,
  manufacturers_name varchar(32) not null ,
  manufacturers_image varchar(64) ,
  manufacturers_featured_until date ,
  manufacturers_featured tinyint(1) default '0' ,
  manufacturer_featured_until date ,
  manufacturer_featured tinyint(1) default '0' ,
  date_added datetime ,
  last_modified datetime ,
  PRIMARY KEY (manufacturers_id),
  KEY IDX_MANUFACTURERS_NAME (manufacturers_name)
);

drop table if exists manufacturers_info;
create table manufacturers_info (
  manufacturers_id int(11) not null ,
  languages_id int(11) not null ,
  manufacturers_url varchar(255) not null ,
  manufacturers_description text ,
  url_clicked int(5) default '0' not null ,
  date_last_click datetime ,
  PRIMARY KEY (manufacturers_id, languages_id)
);

drop table if exists newsletters;
create table newsletters (
  newsletters_id int(11) not null auto_increment,
  title varchar(255) not null ,
  content text not null ,
  module varchar(255) not null ,
  date_added datetime not null ,
  date_sent datetime ,
  status int(1) ,
  locked int(1) default '0' ,
  PRIMARY KEY (newsletters_id)
);

drop table if exists orders;
create table orders (
  orders_id int(11) not null auto_increment,
  customers_id int(11) not null ,
  customers_name varchar(64) not null ,
  customers_company varchar(32) ,
  customers_street_address varchar(64) not null ,
  customers_suburb varchar(32) ,
  customers_city varchar(32) not null ,
  customers_postcode varchar(10) not null ,
  customers_state varchar(32) ,
  customers_country varchar(32) not null ,
  customers_telephone varchar(32) not null ,
  customers_email_address varchar(96) not null ,
  customers_address_format_id int(5) not null ,
  customers_dummy_account tinyint(3) unsigned not null ,
  delivery_name varchar(64) not null ,
  delivery_company varchar(32) ,
  delivery_street_address varchar(64) not null ,
  delivery_suburb varchar(32) ,
  delivery_city varchar(32) not null ,
  delivery_postcode varchar(10) not null ,
  delivery_state varchar(32) ,
  delivery_country varchar(32) not null ,
  delivery_address_format_id int(5) not null ,
  delivery_date datetime not null ,
  billing_name varchar(64) not null ,
  billing_company varchar(32) ,
  billing_street_address varchar(64) not null ,
  billing_suburb varchar(32) ,
  billing_city varchar(32) not null ,
  billing_postcode varchar(10) not null ,
  billing_state varchar(32) ,
  billing_country varchar(32) not null ,
  billing_address_format_id int(5) not null ,
  payment_method varchar(255) not null ,
  cc_type varchar(20) ,
  cc_owner varchar(64) ,
  cc_number varchar(32) ,
  cc_expires varchar(4) ,
  last_modified datetime ,
  date_purchased datetime ,
  orders_status int(5) not null ,
  orders_date_finished datetime ,
  currency char(3) ,
  currency_value decimal(14,6) ,
  paypal_ipn_id int(11) default '0' not null ,
  fedex_tracking varchar(20) not null ,
  purchased_without_account tinyint(1) unsigned default '0' not null ,
  shipping_tax decimal(7,4) default '0.0000' not null ,
  shipping_module varchar(255) ,
  PRIMARY KEY (orders_id),
  KEY idx_orders_customers_id (customers_id)
);

drop table if exists orders_premade_comments;
create table orders_premade_comments (
  id int(11) not null auto_increment,
  title varchar(100) not null ,
  text text not null ,
  PRIMARY KEY (id)
);

insert into orders_premade_comments (id, title, text) values ('1', 'Thank you for your custom', 'Thank you for your custom.');
insert into orders_premade_comments (id, title, text) values ('2', 'Out of stock when ordered', 'Unfortunately, your item was out of stock when the order was placed. It will despatch as soon as we receive it.');
drop table if exists orders_products;
create table orders_products (
  orders_products_id int(11) not null auto_increment,
  orders_id int(11) not null ,
  products_id int(11) not null ,
  products_model varchar(24) ,
  products_code varchar(40) not null ,
  products_name varchar(64) not null ,
  products_price decimal(15,4) not null ,
  final_price decimal(15,4) not null ,
  products_tax decimal(7,4) not null ,
  products_quantity int(2) not null ,
  products_stock_attributes varchar(255) ,
  PRIMARY KEY (orders_products_id),
  KEY idx_orders_products_orders_id (orders_id),
  KEY idx_orders_products_products_id (products_id)
);

drop table if exists orders_products_attributes;
create table orders_products_attributes (
  orders_products_attributes_id int(11) not null auto_increment,
  orders_id int(11) not null ,
  orders_products_id int(11) not null ,
  products_options varchar(32) not null ,
  products_options_values varchar(32) not null ,
  code_suffix varchar(16) not null ,
  options_values_price decimal(15,4) not null ,
  price_prefix char(1) not null ,
  weight_prefix char(1) not null ,
  options_values_weight decimal(6,3) default '0.000' not null ,
  PRIMARY KEY (orders_products_attributes_id),
  KEY idx_orders_products_att_orders_id (orders_id)
);

drop table if exists orders_products_download;
create table orders_products_download (
  orders_products_download_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  orders_products_id int(11) default '0' not null ,
  orders_products_filename varchar(255) not null ,
  download_maxdays int(2) default '0' not null ,
  download_count int(2) default '0' not null ,
  PRIMARY KEY (orders_products_download_id),
  KEY idx_orders_products_download_orders_id (orders_id)
);

drop table if exists orders_status;
create table orders_status (
  orders_status_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  orders_status_name varchar(32) not null ,
  public_flag int(11) default '1' ,
  downloads_flag int(11) default '0' ,
  PRIMARY KEY (orders_status_id, language_id),
  KEY idx_orders_status_name (orders_status_name)
);

insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('1', '1', 'Pending', '1', '0');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('1', '2', 'Offen', '1', '0');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('1', '3', 'Pendiente', '1', '0');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('2', '1', 'Processing', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('2', '2', 'In Bearbeitung', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('2', '3', 'Proceso', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('3', '1', 'Delivered', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('3', '2', 'Versendet', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('3', '3', 'Entregado', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('4', '1', 'Customer Comment', '1', '0');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('4', '2', 'Kunden Kommentar', '1', '0');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('4', '3', 'Comentario del cliente', '1', '0');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('5', '1', 'Customer Comment (DL)', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('5', '2', 'Kunden Kommentar (DL)', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('5', '3', 'Comentario del cliente (DL)', '1', '1');
drop table if exists orders_status_history;
create table orders_status_history (
  orders_status_history_id int(11) not null auto_increment,
  orders_id int(11) not null ,
  orders_status_id int(5) not null ,
  date_added datetime not null ,
  customer_notified int(1) default '0' ,
  comments text ,
  PRIMARY KEY (orders_status_history_id),
  KEY idx_orders_status_history_orders_id (orders_id)
);

drop table if exists orders_status_history_transactions;
create table orders_status_history_transactions (
  orders_status_history_id int(11) not null ,
  transaction_id varchar(64) not null ,
  transaction_type varchar(32) not null ,
  payment_type varchar(32) not null ,
  payment_status varchar(32) not null ,
  transaction_amount decimal(7,2) not null ,
  module_code varchar(32) not null ,
  transaction_avs varchar(64) not null ,
  transaction_cvv2 varchar(64) not null ,
  transaction_msgs varchar(255) not null ,
  PRIMARY KEY (orders_status_history_id),
  KEY transaction_id (transaction_id)
);

drop table if exists orders_total;
create table orders_total (
  orders_total_id int(10) unsigned not null auto_increment,
  orders_id int(11) not null ,
  title varchar(255) not null ,
  text varchar(255) not null ,
  value decimal(15,4) not null ,
  class varchar(32) not null ,
  sort_order int(11) not null ,
  PRIMARY KEY (orders_total_id),
  KEY idx_orders_total_orders_id (orders_id)
);

drop table if exists packaging;
create table packaging (
  package_id int(11) not null auto_increment,
  package_name varchar(64) not null ,
  package_description varchar(255) not null ,
  package_length decimal(6,2) default '5.00' not null ,
  package_width decimal(6,2) default '5.00' not null ,
  package_height decimal(6,2) default '5.00' not null ,
  package_empty_weight decimal(6,2) default '0.00' not null ,
  package_max_weight decimal(6,2) default '50.00' not null ,
  package_cost int(5) default '0' not null ,
  PRIMARY KEY (package_id)
);

drop table if exists paypal_ipn;
create table paypal_ipn (
  paypal_ipn_id int(10) unsigned not null auto_increment,
  txn_type int(10) unsigned default '0' not null ,
  reason_code int(11) ,
  payment_type int(11) default '0' not null ,
  payment_status int(11) default '0' not null ,
  pending_reason int(11) ,
  invoice varchar(64) ,
  mc_currency int(11) default '1' not null ,
  first_name varchar(32) not null ,
  last_name varchar(32) not null ,
  payer_business_name varchar(32) ,
  address_name varchar(32) not null ,
  address_street varchar(64) not null ,
  address_city varchar(32) not null ,
  address_state varchar(32) not null ,
  address_zip varchar(64) not null ,
  address_country varchar(32) not null ,
  address_status varchar(64) not null ,
  address_owner varchar(64) default '0' not null ,
  payer_email varchar(96) not null ,
  ebay_address_id varchar(96) ,
  payer_id varchar(32) not null ,
  payer_status varchar(32) not null ,
  payment_date varchar(32) not null ,
  business varchar(32) not null ,
  receiver_email varchar(96) not null ,
  receiver_id varchar(32) not null ,
  paypal_address_id varchar(64) not null ,
  txn_id varchar(17) not null ,
  notify_version varchar(17) not null ,
  verify_sign varchar(64) not null ,
  date_added datetime not null ,
  PRIMARY KEY (paypal_ipn_id, txn_id),
  KEY idx_paypal_ipn_paypal_ipn_id (paypal_ipn_id)
);

drop table if exists pm_configuration;
create table pm_configuration (
  pm_id int(11) not null auto_increment,
  pm_title varchar(255) not null ,
  pm_description varchar(255) not null ,
  pm_filename varchar(255) not null ,
  pm_active tinyint(1) default '1' not null ,
  pm_page varchar(255) not null ,
  pm_cg_hide varchar(255) not null ,
  pm_sort_order int(11) not null ,
  last_modified datetime not null ,
  date_added datetime not null ,
  PRIMARY KEY (pm_id)
);

insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('1', 'Specials', 'Special Products Module', 'default_specials.php', '1', 'index', '', '4', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('2', 'New Products', 'New Products Module', 'new_products.php', '1', 'index', '', '5', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('3', 'Upcoming Products', 'Upcoming products module', 'upcoming_products.php', '1', 'index', '', '7', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('4', 'Cross Sell Module', 'Cross Sell Module', 'xsell_products.php', '1', 'product_info', '', '1', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('5', 'Also Purchased Module', 'Also Purchased Module', 'also_purchased_products.php', '1', 'product_info', '', '2', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('6', 'Previous Next Module', 'Previous Next Module', 'products_next_previous.php', '1', 'product_info', '', '4', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('7', 'Counter', '', 'counter.php', '1', 'all', '', '2', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('8', 'Copyright', '', 'copyright.php', '1', 'all', '', '4', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('9', 'Articles', '', 'index_articles.php', '1', 'index', '', '8', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('10', 'Greeting', '', 'index_greeting.php', '1', 'index', '', '2', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('11', 'Define Mainpage', '', 'index_define_mainpage.php', '1', 'index', '', '3', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('12', 'Open Feature Sets', '', 'featured_sets.php', '1', 'index', '', '6', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('13', 'Open Feature Sets', '', 'featured_sets.php', '1', 'product_info', '', '3', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('14', 'Slideshow', '', 'slideshow.php', '1', 'index', '', '1', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('15', 'New Products', '', 'new_products.php', '1', 'nested', '', '1', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('16', 'Banner', '', 'banner_index.php', '1', 'index', '', '9', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('17', 'Banner', '', 'banner_all.php', '1', 'all', '', '3', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('18', 'Banner', '', 'banner_product.php', '1', 'product_info', '', '5', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
insert into pm_configuration (pm_id, pm_title, pm_description, pm_filename, pm_active, pm_page, pm_cg_hide, pm_sort_order, last_modified, date_added) values ('19', 'Recently Viewed', '', 'recently_viewed_products.php', '1', 'all', '', '1', '2015-04-04 21:03:05', '2015-04-04 21:03:05');
drop table if exists products;
create table products (
  products_id int(11) not null auto_increment,
  products_quantity int(4) not null ,
  products_model varchar(24) ,
  products_image varchar(80) ,
  products_msrp decimal(15,4) not null ,
  products_price decimal(15,4) not null ,
  products_date_added datetime not null ,
  products_last_modified datetime ,
  products_date_available datetime ,
  products_featured_until date ,
  products_weight decimal(10,4) not null ,
  products_status tinyint(1) not null ,
  products_featured tinyint(1) default '0' ,
  products_tax_class_id int(11) not null ,
  manufacturers_id int(11) ,
  products_ordered int(11) default '0' not null ,
  products_length decimal(6,2) default '12.00' not null ,
  products_width decimal(6,2) default '12.00' not null ,
  products_height decimal(6,2) default '12.00' not null ,
  products_ready_to_ship int(1) default '0' not null ,
  products_hide_from_groups varchar(255) default '@' not null ,
  products_qty_blocks int(4) default '1' not null ,
  products_min_order_qty int(4) default '1' not null ,
  products_ship_sep tinyint(1) default '0' not null ,
  PRIMARY KEY (products_id),
  KEY idx_products_model (products_model),
  KEY idx_products_date_added (products_date_added)
);

drop table if exists products_attributes;
create table products_attributes (
  products_attributes_id int(11) not null auto_increment,
  products_id int(11) not null ,
  options_id int(11) not null ,
  options_values_id int(11) not null ,
  code_suffix varchar(16) not null ,
  suffix_sort_order int(4) default '0' not null ,
  options_values_price decimal(15,4) not null ,
  price_prefix char(1) not null ,
  weight_prefix char(1) not null ,
  options_values_weight decimal(6,3) default '0.000' not null ,
  products_options_sort_order int(10) unsigned default '0' not null ,
  PRIMARY KEY (products_attributes_id),
  KEY idx_products_attributes_products_id (products_id)
);

drop table if exists products_attributes_download;
create table products_attributes_download (
  products_attributes_id int(11) not null ,
  products_attributes_filename varchar(255) not null ,
  products_attributes_maxdays int(2) default '0' ,
  products_attributes_maxcount int(2) default '0' ,
  PRIMARY KEY (products_attributes_id)
);

insert into products_attributes_download (products_attributes_id, products_attributes_filename, products_attributes_maxdays, products_attributes_maxcount) values ('11', 'Dhtml-coolmenu.zip', '7', '10');
drop table if exists products_description;
create table products_description (
  products_id int(11) not null auto_increment,
  language_id int(11) default '1' not null ,
  products_name varchar(64) not null ,
  products_short text ,
  products_description text ,
  tab1 text ,
  tab2 text ,
  tab3 text ,
  tab4 text ,
  tab5 text ,
  tab6 text ,
  products_url varchar(255) ,
  products_viewed int(5) default '0' ,
  PRIMARY KEY (products_id, language_id),
  KEY products_name (products_name)
);

drop table if exists products_groups;
create table products_groups (
  customers_group_id int(11) default '0' not null ,
  customers_group_price decimal(15,4) default '0.0000' not null ,
  products_id int(11) default '0' not null ,
  products_price decimal(15,4) default '0.0000' not null ,
  products_qty_blocks int(4) default '1' not null ,
  products_min_order_qty int(4) default '1' not null 
);

drop table if exists products_notifications;
create table products_notifications (
  products_id int(11) not null ,
  customers_id int(11) not null ,
  date_added datetime not null ,
  PRIMARY KEY (products_id, customers_id)
);

drop table if exists products_options;
create table products_options (
  products_options_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  products_options_name varchar(32) not null ,
  products_options_track_stock tinyint(4) default '0' not null ,
  products_options_type int(5) default '0' not null ,
  products_options_length smallint(2) default '32' not null ,
  products_options_comment varchar(32) ,
  products_options_sort_order int(10) unsigned default '0' not null ,
  PRIMARY KEY (products_options_id, language_id)
);

insert into products_options (products_options_id, language_id, products_options_name, products_options_track_stock, products_options_type, products_options_length, products_options_comment, products_options_sort_order) values ('1', '1', 'Version', '0', '0', '32', NULL, '1');
insert into products_options (products_options_id, language_id, products_options_name, products_options_track_stock, products_options_type, products_options_length, products_options_comment, products_options_sort_order) values ('1', '2', 'Version', '0', '0', '32', NULL, '1');
insert into products_options (products_options_id, language_id, products_options_name, products_options_track_stock, products_options_type, products_options_length, products_options_comment, products_options_sort_order) values ('1', '3', 'Version', '0', '0', '32', NULL, '1');
drop table if exists products_options_description;
create table products_options_description (
  products_options_id int(11) not null auto_increment,
  language_id int(11) default '1' not null ,
  products_options_name varchar(32) not null ,
  products_options_description text not null ,
  PRIMARY KEY (products_options_id, language_id)
);

drop table if exists products_options_types;
create table products_options_types (
  products_options_types_id int(11) default '0' not null ,
  products_options_types_name varchar(32) ,
  language_id int(11) default '0' not null ,
  PRIMARY KEY (products_options_types_id, language_id)
);

insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('0', 'Select', '1');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('0', 'Select', '2');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('0', 'Select', '3');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('0', 'Select', '4');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('3', 'Radio', '1');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('3', 'Radio', '2');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('3', 'Radio', '3');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('3', 'Radio', '4');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('4', 'Checkbox', '1');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('4', 'Checkbox', '2');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('4', 'Checkbox', '3');
insert into products_options_types (products_options_types_id, products_options_types_name, language_id) values ('4', 'Checkbox', '4');
drop table if exists products_options_values;
create table products_options_values (
  products_options_values_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  products_options_values_name varchar(64) not null ,
  PRIMARY KEY (products_options_values_id, language_id)
);

insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('1', '1', 'Download: Windows - English');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('1', '2', 'Download: Windows - Englisch');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('1', '3', 'Download: Windows - Inglese');
drop table if exists products_options_values_to_products_options;
create table products_options_values_to_products_options (
  products_options_values_to_products_options_id int(11) not null auto_increment,
  products_options_id int(11) not null ,
  products_options_values_id int(11) not null ,
  PRIMARY KEY (products_options_values_to_products_options_id)
);

insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('14', '1', '1');
drop table if exists products_price_break;
create table products_price_break (
  products_price_break_id int(11) not null auto_increment,
  products_id int(11) not null ,
  products_price decimal(15,4) default '0.0000' not null ,
  products_qty int(11) default '0' not null ,
  customers_group_id smallint(5) unsigned default '0' not null ,
  PRIMARY KEY (products_price_break_id)
);

drop table if exists products_shipping;
create table products_shipping (
  products_id int(11) default '0' not null ,
  products_ship_methods_id int(11) ,
  products_ship_zip varchar(32) ,
  products_ship_price varchar(10) ,
  products_ship_price_two varchar(10) 
);

drop table if exists products_stock;
create table products_stock (
  products_stock_id int(11) not null auto_increment,
  products_id int(11) default '0' not null ,
  products_stock_attributes varchar(255) not null ,
  products_stock_quantity int(11) default '0' not null ,
  PRIMARY KEY (products_stock_id),
  UNIQUE idx_products_stock_attributes (products_id, products_stock_attributes)
);

drop table if exists products_to_categories;
create table products_to_categories (
  products_id int(11) not null ,
  categories_id int(11) not null ,
  PRIMARY KEY (products_id, categories_id)
);

drop table if exists products_to_discount_categories;
create table products_to_discount_categories (
  products_id int(11) not null ,
  discount_categories_id int(11) not null ,
  customers_group_id smallint(5) unsigned default '0' not null ,
  PRIMARY KEY (products_id, customers_group_id)
);

drop table if exists products_xsell;
create table products_xsell (
  ID int(10) not null auto_increment,
  products_id int(10) unsigned default '1' not null ,
  xsell_id int(10) unsigned default '1' not null ,
  sort_order int(10) unsigned default '1' not null ,
  PRIMARY KEY (ID)
);

drop table if exists quick_links;
create table quick_links (
  quick_links_id int(11) not null auto_increment,
  quick_links_name varchar(255) not null ,
  quick_links_link varchar(255) not null ,
  quick_links_target varchar(255) not null ,
  quick_links_sort_order int(11) not null ,
  quick_links_cg varchar(64) not null ,
  date_added datetime not null ,
  last_modified datetime ,
  quick_links_image varchar(255) not null ,
  PRIMARY KEY (quick_links_id)
);

insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('1', 'Home', 'index.php', '_top', '1', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'dashboard.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('2', 'Google Analytics', 'https://www.google.com/analytics/reporting/', '_blank', '2', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'analytics.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('3', 'Google Web Tools', 'https://www.google.com/webmasters/tools/dashboard', '_blank', '3', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'webtools.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('4', 'Pingdom', 'https://pp.pingdom.com/index.php/member/default', '_blank', '4', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'pingdom.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('5', 'Categories', 'categories.php', '_top', '5', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'categories.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('6', 'Cross Sell', 'xsell.php', '_top', '6', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'xsell.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('7', 'Backup', 'backup.php', '_top', '7', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'backup.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('8', 'Orders', 'orders.php', '_top', '8', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'orders.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('9', 'Customers', 'customers.php', '_top', '9', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'customers.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('10', 'Newsletters', 'newsletters.php', '_top', '10', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'newsletters.png');
insert into quick_links (quick_links_id, quick_links_name, quick_links_link, quick_links_target, quick_links_sort_order, quick_links_cg, date_added, last_modified, quick_links_image) values ('11', 'Goto Catalog', '../index.php', '_blank', '11', '1,2', '2015-04-04 21:03:04', '2015-04-04 21:03:04', 'catalog.png');
drop table if exists reviews;
create table reviews (
  reviews_id int(11) not null auto_increment,
  products_id int(11) not null ,
  customers_id int(11) ,
  customers_name varchar(64) not null ,
  reviews_rating int(1) ,
  approved tinyint(3) unsigned default '0' ,
  date_added datetime ,
  last_modified datetime ,
  reviews_read int(5) default '0' not null ,
  PRIMARY KEY (reviews_id),
  KEY idx_reviews_products_id (products_id),
  KEY idx_reviews_customers_id (customers_id)
);

drop table if exists reviews_description;
create table reviews_description (
  reviews_id int(11) not null ,
  languages_id int(11) not null ,
  reviews_text text not null ,
  PRIMARY KEY (reviews_id, languages_id)
);

drop table if exists scart;
create table scart (
  scartid int(11) not null auto_increment,
  customers_id int(11) not null ,
  dateadded varchar(8) not null ,
  datemodified varchar(8) not null ,
  PRIMARY KEY (scartid),
  UNIQUE scartid (scartid),
  UNIQUE customers_id (customers_id)
);

drop table if exists search_queries;
create table search_queries (
  search_id int(11) not null auto_increment,
  search_text tinytext ,
  PRIMARY KEY (search_id)
);

drop table if exists search_queries_sorted;
create table search_queries_sorted (
  search_id smallint(6) not null auto_increment,
  search_text tinytext not null ,
  search_count int(11) default '0' not null ,
  PRIMARY KEY (search_id)
);

drop table if exists searchword_swap;
create table searchword_swap (
  sws_id mediumint(11) not null auto_increment,
  sws_word varchar(100) not null ,
  sws_replacement varchar(100) not null ,
  PRIMARY KEY (sws_id)
);

drop table if exists sessions;
create table sessions (
  sesskey varchar(32) not null ,
  expiry int(10) unsigned not null ,
  value text not null ,
  PRIMARY KEY (sesskey)
);

drop table if exists shipping_manifest;
create table shipping_manifest (
  delivery_id int(5) not null auto_increment,
  orders_id int(6) default '0' not null ,
  delivery_name varchar(128) not null ,
  delivery_company varchar(128) not null ,
  delivery_address_1 varchar(128) not null ,
  delivery_address_2 varchar(128) not null ,
  delivery_city varchar(64) not null ,
  delivery_state char(2) not null ,
  delivery_postcode varchar(10) not null ,
  delivery_phone varchar(10) not null ,
  package_weight char(3) not null ,
  package_value varchar(4) not null ,
  oversized int(1) default '0' not null ,
  pickup_date date default '0001-01-01' not null ,
  shipping_type varchar(64) not null ,
  residential char(1) not null ,
  cod int(1) default '0' not null ,
  tracking_num varchar(20) not null ,
  multiple int(3) default '0' not null ,
  PRIMARY KEY (delivery_id),
  UNIQUE tracking_num (tracking_num)
);

drop table if exists slideshow;
create table slideshow (
  slideshow_id int(11) not null auto_increment,
  slideshow_title varchar(255) not null ,
  slideshow_link varchar(255) not null ,
  slideshow_target varchar(255) not null ,
  slideshow_active varchar(3) not null ,
  slideshow_cg_hide varchar(255) not null ,
  slideshow_sort_order int(11) not null ,
  date_added datetime not null ,
  last_modified datetime ,
  slideshow_image varchar(255) not null ,
  PRIMARY KEY (slideshow_id)
);

insert into slideshow (slideshow_id, slideshow_title, slideshow_link, slideshow_target, slideshow_active, slideshow_cg_hide, slideshow_sort_order, date_added, last_modified, slideshow_image) values ('1', 'osCmax - eCommerce to the max', 'http://www.oscmax.com/', '_top', 'yes', '', '1', '2015-04-04 21:03:06', '2015-04-04 21:03:06', 'example_oscmax1.jpg');
insert into slideshow (slideshow_id, slideshow_title, slideshow_link, slideshow_target, slideshow_active, slideshow_cg_hide, slideshow_sort_order, date_added, last_modified, slideshow_image) values ('2', 'osCmax v2.5 User Manual', 'http://shop.oscmax.com/oscmax-v250-user-manual-p-3.html', '_top', 'yes', '', '2', '2015-04-04 21:03:06', '2015-04-04 21:03:06', 'oscmax_2.5_manual.jpg');
insert into slideshow (slideshow_id, slideshow_title, slideshow_link, slideshow_target, slideshow_active, slideshow_cg_hide, slideshow_sort_order, date_added, last_modified, slideshow_image) values ('3', 'AABox - Pro web hosting', 'http://www.aabox.com/', '_top', 'yes', '', '2', '2015-04-04 21:03:06', '2015-04-04 21:03:06', 'example_oscmax2.jpg');
insert into slideshow (slideshow_id, slideshow_title, slideshow_link, slideshow_target, slideshow_active, slideshow_cg_hide, slideshow_sort_order, date_added, last_modified, slideshow_image) values ('4', 'ejSolutions', 'http://www.ejsolutions.co.uk/', '_top', 'yes', '', '3', '2015-04-04 21:03:06', '2015-04-04 21:03:06', 'example_oscmax3.jpg');
drop table if exists specials;
create table specials (
  specials_id int(11) not null auto_increment,
  products_id int(11) not null ,
  specials_new_products_price decimal(15,5) not null ,
  specials_date_added datetime ,
  specials_last_modified datetime ,
  expires_date datetime ,
  date_status_change datetime ,
  status int(1) default '1' not null ,
  customers_group_id int(11) default '0' not null ,
  PRIMARY KEY (specials_id),
  KEY idx_specials_products_id (products_id)
);

drop table if exists specials_retail_prices;
create table specials_retail_prices (
  products_id int(11) default '0' not null ,
  specials_new_products_price decimal(15,4) default '0.0000' not null ,
  status tinyint(4) ,
  customers_group_id smallint(6) ,
  PRIMARY KEY (products_id)
);

drop table if exists tax_class;
create table tax_class (
  tax_class_id int(11) not null auto_increment,
  tax_class_title varchar(32) not null ,
  tax_class_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime not null ,
  PRIMARY KEY (tax_class_id)
);

insert into tax_class (tax_class_id, tax_class_title, tax_class_description, last_modified, date_added) values ('1', 'Taxable Goods', 'The following types of products are included non-food,services,etc', '2015-04-04 21:03:02', '2015-04-04 21:03:02');
insert into tax_class (tax_class_id, tax_class_title, tax_class_description, last_modified, date_added) values ('2', 'Taxable Item', 'Any taxable item', '2015-04-04 21:03:02', '2015-04-04 21:03:02');
insert into tax_class (tax_class_id, tax_class_title, tax_class_description, last_modified, date_added) values ('3', 'Non Taxable', 'Non Taxable Goods', '2015-04-04 21:03:02', '2015-04-04 21:03:02');
drop table if exists tax_rates;
create table tax_rates (
  tax_rates_id int(11) not null auto_increment,
  tax_zone_id int(11) not null ,
  tax_class_id int(11) not null ,
  tax_priority int(5) default '1' ,
  tax_rate decimal(7,4) not null ,
  tax_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime not null ,
  PRIMARY KEY (tax_rates_id)
);

insert into tax_rates (tax_rates_id, tax_zone_id, tax_class_id, tax_priority, tax_rate, tax_description, last_modified, date_added) values ('1', '1', '1', '1', '7.0000', 'FL TAX 7.0%', '2015-04-04 21:03:02', '2015-04-04 21:03:02');
drop table if exists theme_configuration;
create table theme_configuration (
  configuration_id int(11) not null auto_increment,
  configuration_title varchar(64) not null ,
  configuration_key varchar(64) default 'BOX_HEADING_' not null ,
  configuration_value varchar(255) not null ,
  configuration_description varchar(255) not null ,
  configuration_group_id int(11) default '1' not null ,
  configuration_column varchar(64) default 'left' not null ,
  location int(5) default '0' not null ,
  sort_order int(5) ,
  last_modified datetime ,
  date_added datetime default '0001-01-01 01:01:01' not null ,
  box_heading varchar(64) not null ,
  PRIMARY KEY (configuration_id)
);

insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('1', 'best sellers', 'BOX_HEADING_BEST_SELLERS', 'yes', 'Display Best Sellers box?', '1', 'left', '12', '1', NULL, '2015-04-04 21:03:03', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('2', 'categories', 'BOX_HEADING_CATEGORIES', 'yes', '', '1', 'left', '1', NULL, NULL, '2015-04-04 21:03:04', 'Categories');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('3', 'currencies', 'BOX_HEADING_CATEGORIES_CURRENCIES', 'yes', 'Display Currencies box?', '1', 'right', '8', '3', NULL, '2015-04-04 21:03:03', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('5', 'information', 'BOX_HEADING_INFORMATION', 'yes', 'Display Information box?', '1', 'left', '7', '5', NULL, '2015-04-04 21:03:03', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('6', 'languages', 'BOX_HEADING_LANGUAGES', 'yes', 'Display Languages box?', '1', 'right', '7', '6', NULL, '2015-04-04 21:03:03', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('7', 'manufacturer info', 'BOX_HEADING_MANUFACTURER_INFO', 'yes', 'Display Manufacturer Info box?', '1', 'right', '9', '7', NULL, '2015-04-04 21:03:03', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('8', 'manufacturers', 'BOX_HEADING_MANUFACTURERS', 'yes', 'Display Manufacturers box?', '1', 'left', '6', '8', NULL, '2015-04-04 21:03:03', 'Manufactures');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('9', 'order history', 'BOX_HEADING_ORDER_HISTORY', 'yes', 'Display Order History box?', '1', 'right', '4', '9', NULL, '2015-04-04 21:03:03', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('10', 'product notifications', 'BOX_HEADING_PRODUCT_NOTIFICATIONS', 'yes', 'Display Product Notifications box?', '1', 'right', '9', '10', NULL, '2015-04-04 21:03:03', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('11', 'reviews', 'BOX_HEADING_REVIEWS', 'yes', 'Display Reviews box?', '1', 'right', '6', '11', NULL, '2015-04-04 21:03:03', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('12', 'search', 'BOX_HEADING_SEARCH', 'yes', 'Display Search box?', '1', 'left', '5', '12', NULL, '2015-04-04 21:03:03', 'Quick Find');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('13', 'shopping cart', 'BOX_HEADING_SHOPPING_CART', 'yes', 'Display Shopping Cart box?', '1', 'right', '1', '13', NULL, '2015-04-04 21:03:03', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('14', 'specials', 'BOX_HEADING_SPECIALS', 'yes', 'Display Specials box?', '1', 'right', '5', '14', NULL, '2015-04-04 21:03:04', 'Specials');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('15', 'tell a friend', 'BOX_HEADING_TELL_A_FRIEND', 'yes', 'Display Tell a Friend box?', '1', 'right', '4', '15', NULL, '2015-04-04 21:03:04', '');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('16', 'what\'s new', 'BOX_HEADING_WHATS_NEW', 'yes', 'Display What\'s New? box?', '1', 'left', '4', '16', NULL, '2015-04-04 21:03:04', 'What\'s New');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('22', 'wishlist', 'BOX_HEADING_CUSTOMER_WISHLIST', 'yes', '', '1', 'right', '3', NULL, NULL, '2015-04-04 21:03:04', 'My Wish List');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('25', 'loginbox', 'BOX_HEADING_LOGIN_BOX', 'yes', '', '1', 'right', '2', NULL, NULL, '2015-04-04 21:03:04', 'Sign In');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('26', 'articles', 'BOX_HEADING_ARTICLES', 'yes', '', '1', 'right', '10', NULL, NULL, '2015-04-04 21:03:04', 'Articles');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('28', 'affiliate', 'BOX_HEADING_AFFILIATE', 'no', '', '1', 'left', '3', NULL, NULL, '2015-04-04 21:03:04', 'Affiliates');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('29', 'Authors', 'BOX_HEADING_AUTHORS', 'yes', '', '1', 'right', '11', NULL, NULL, '2015-04-04 21:03:04', 'Authors');
insert into theme_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, configuration_column, location, sort_order, last_modified, date_added, box_heading) values ('30', 'mailchimp_newsletters', 'BOX_HEADING_MAILCHIMP', 'no', 'Do you want to use MailChimp to collect and manage your newsletters?', '1', 'right', '15', NULL, NULL, '2015-04-04 21:03:04', 'MailChimp Newsletters');
drop table if exists topics;
create table topics (
  topics_id int(11) not null auto_increment,
  topics_image varchar(64) ,
  parent_id int(11) default '0' not null ,
  sort_order int(3) ,
  date_added datetime ,
  last_modified datetime ,
  PRIMARY KEY (topics_id),
  KEY idx_topics_parent_id (parent_id)
);

insert into topics (topics_id, topics_image, parent_id, sort_order, date_added, last_modified) values ('1', NULL, '0', '0', '2015-04-04 21:03:06', NULL);
drop table if exists topics_description;
create table topics_description (
  topics_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  topics_name varchar(32) not null ,
  topics_heading_title varchar(64) ,
  topics_description text ,
  PRIMARY KEY (topics_id, language_id),
  KEY idx_topics_name (topics_name)
);

insert into topics_description (topics_id, language_id, topics_name, topics_heading_title, topics_description) values ('0', '1', 'Miscellaneous Articles', 'Miscellaneous', 'Articles that do not fall into a specific category.');
drop table if exists ups_boxes_used;
create table ups_boxes_used (
  id int(11) not null auto_increment,
  date datetime ,
  customers_id int(11) not null ,
  boxes text ,
  PRIMARY KEY (id)
);

drop table if exists usu_cache;
create table usu_cache (
  cache_name varchar(32) not null ,
  cache_data mediumtext not null ,
  cache_date datetime not null ,
  PRIMARY KEY (cache_name)
);

drop table if exists whos_online;
create table whos_online (
  customer_id int(11) ,
  full_name varchar(64) not null ,
  session_id varchar(128) not null ,
  ip_address varchar(15) not null ,
  hostname varchar(255) not null ,
  country_code varchar(2) not null ,
  country_name varchar(64) not null ,
  region_name varchar(64) not null ,
  city varchar(64) not null ,
  latitude float not null ,
  longitude float not null ,
  time_entry varchar(14) not null ,
  time_last_click varchar(14) not null ,
  last_page_url text not null ,
  http_referer varchar(255) not null ,
  user_agent varchar(255) not null ,
  KEY idx_ip_address (ip_address),
  KEY idx_country_code (country_code)
);

drop table if exists zones;
create table zones (
  zone_id int(11) not null auto_increment,
  zone_country_id int(11) not null ,
  zone_code varchar(32) not null ,
  zone_name varchar(32) not null ,
  PRIMARY KEY (zone_id),
  KEY idx_zones_country_id (zone_country_id),
  KEY idx_zones_to_geo_zones_country_id (zone_country_id)
);

insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1', '1', 'BDS', 'Badakhshan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2', '1', 'BDG', 'Badghis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3', '1', 'BGL', 'Baghlan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4', '1', 'BAL', 'Balkh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('5', '1', 'BAM', 'Bamian');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('6', '1', 'FRA', 'Farah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('7', '1', 'FYB', 'Faryab');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('8', '1', 'GHA', 'Ghazni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('9', '1', 'GHO', 'Ghowr');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('10', '1', 'HEL', 'Helmand');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('11', '1', 'HER', 'Herat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('12', '1', 'JOW', 'Jowzjan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('13', '1', 'KAB', 'Kabul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('14', '1', 'KAN', 'Kandahar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('15', '1', 'KAP', 'Kapisa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('16', '1', 'KHO', 'Khost');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('17', '1', 'KNR', 'Konar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('18', '1', 'KDZ', 'Kondoz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('19', '1', 'LAG', 'Laghman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('20', '1', 'LOW', 'Lowgar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('21', '1', 'NAN', 'Nangrahar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('22', '1', 'NIM', 'Nimruz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('23', '1', 'NUR', 'Nurestan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('24', '1', 'ORU', 'Oruzgan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('25', '1', 'PIA', 'Paktia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('26', '1', 'PKA', 'Paktika');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('27', '1', 'PAR', 'Parwan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('28', '1', 'SAM', 'Samangan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('29', '1', 'SAR', 'Sar-e Pol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('30', '1', 'TAK', 'Takhar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('31', '1', 'WAR', 'Wardak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('32', '1', 'ZAB', 'Zabol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('33', '2', 'BR', 'Berat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('34', '2', 'BU', 'Bulqize');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('35', '2', 'DL', 'Delvine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('36', '2', 'DV', 'Devoll');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('37', '2', 'DI', 'Diber');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('38', '2', 'DR', 'Durres');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('39', '2', 'EL', 'Elbasan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('40', '2', 'ER', 'Kolonje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('41', '2', 'FR', 'Fier');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('42', '2', 'GJ', 'Gjirokaster');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('43', '2', 'GR', 'Gramsh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('44', '2', 'HA', 'Has');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('45', '2', 'KA', 'Kavaje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('46', '2', 'KB', 'Kurbin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('47', '2', 'KC', 'Kucove');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('48', '2', 'KO', 'Korce');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('49', '2', 'KR', 'Kruje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('50', '2', 'KU', 'Kukes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('51', '2', 'LB', 'Librazhd');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('52', '2', 'LE', 'Lezhe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('53', '2', 'LU', 'Lushnje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('54', '2', 'MM', 'Malesi e Madhe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('55', '2', 'MK', 'Mallakaster');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('56', '2', 'MT', 'Mat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('57', '2', 'MR', 'Mirdite');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('58', '2', 'PQ', 'Peqin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('59', '2', 'PR', 'Permet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('60', '2', 'PG', 'Pogradec');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('61', '2', 'PU', 'Puke');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('62', '2', 'SH', 'Shkoder');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('63', '2', 'SK', 'Skrapar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('64', '2', 'SR', 'Sarande');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('65', '2', 'TE', 'Tepelene');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('66', '2', 'TP', 'Tropoje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('67', '2', 'TR', 'Tirane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('68', '2', 'VL', 'Vlore');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('69', '3', 'ADR', 'Adrar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('70', '3', 'ADE', 'Ain Defla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('71', '3', 'ATE', 'Ain Temouchent');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('72', '3', 'ALG', 'Alger');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('73', '3', 'ANN', 'Annaba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('74', '3', 'BAT', 'Batna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('75', '3', 'BEC', 'Bechar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('76', '3', 'BEJ', 'Bejaia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('77', '3', 'BIS', 'Biskra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('78', '3', 'BLI', 'Blida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('79', '3', 'BBA', 'Bordj Bou Arreridj');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('80', '3', 'BOA', 'Bouira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('81', '3', 'BMD', 'Boumerdes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('82', '3', 'CHL', 'Chlef');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('83', '3', 'CON', 'Constantine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('84', '3', 'DJE', 'Djelfa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('85', '3', 'EBA', 'El Bayadh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('86', '3', 'EOU', 'El Oued');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('87', '3', 'ETA', 'El Tarf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('88', '3', 'GHA', 'Ghardaia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('89', '3', 'GUE', 'Guelma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('90', '3', 'ILL', 'Illizi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('91', '3', 'JIJ', 'Jijel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('92', '3', 'KHE', 'Khenchela');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('93', '3', 'LAG', 'Laghouat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('94', '3', 'MUA', 'Muaskar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('95', '3', 'MED', 'Medea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('96', '3', 'MIL', 'Mila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('97', '3', 'MOS', 'Mostaganem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('98', '3', 'MSI', 'M\'Sila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('99', '3', 'NAA', 'Naama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('100', '3', 'ORA', 'Oran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('101', '3', 'OUA', 'Ouargla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('102', '3', 'OEB', 'Oum el-Bouaghi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('103', '3', 'REL', 'Relizane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('104', '3', 'SAI', 'Saida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('105', '3', 'SET', 'Setif');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('106', '3', 'SBA', 'Sidi Bel Abbes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('107', '3', 'SKI', 'Skikda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('108', '3', 'SAH', 'Souk Ahras');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('109', '3', 'TAM', 'Tamanghasset');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('110', '3', 'TEB', 'Tebessa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('111', '3', 'TIA', 'Tiaret');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('112', '3', 'TIN', 'Tindouf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('113', '3', 'TIP', 'Tipaza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('114', '3', 'TIS', 'Tissemsilt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('115', '3', 'TOU', 'Tizi Ouzou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('116', '3', 'TLE', 'Tlemcen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('117', '4', 'E', 'Eastern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('118', '4', 'M', 'Manu\'a');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('119', '4', 'R', 'Rose Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('120', '4', 'S', 'Swains Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('121', '4', 'W', 'Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('122', '5', 'ALV', 'Andorra la Vella');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('123', '5', 'CAN', 'Canillo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('124', '5', 'ENC', 'Encamp');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('125', '5', 'ESE', 'Escaldes-Engordany');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('126', '5', 'LMA', 'La Massana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('127', '5', 'ORD', 'Ordino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('128', '5', 'SJL', 'Sant Julià de Lòria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('129', '6', 'BGO', 'Bengo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('130', '6', 'BGU', 'Benguela');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('131', '6', 'BIE', 'Bie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('132', '6', 'CAB', 'Cabinda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('133', '6', 'CCU', 'Cuando-Cubango');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('134', '6', 'CNO', 'Cuanza Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('135', '6', 'CUS', 'Cuanza Sul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('136', '6', 'CNN', 'Cunene');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('137', '6', 'HUA', 'Huambo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('138', '6', 'HUI', 'Huila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('139', '6', 'LUA', 'Luanda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('140', '6', 'LNO', 'Lunda Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('141', '6', 'LSU', 'Lunda Sul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('142', '6', 'MAL', 'Malange');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('143', '6', 'MOX', 'Moxico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('144', '6', 'NAM', 'Namibe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('145', '6', 'UIG', 'Uige');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('146', '6', 'ZAI', 'Zaire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('147', '7', 'SCR', 'Scrub');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('148', '7', 'SAN', 'Sandy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('149', '7', 'PRI', 'Prickly Pear');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('150', '7', 'LIT', 'Little Scrub');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('151', '7', 'DOG', 'Dog');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('152', '7', 'ANG', 'Anguillita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('153', '7', 'ANG', 'Anguila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('154', '7', 'SEA', 'Seal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('155', '7', 'SOM', 'Sombrero');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('156', '9', 'ASG', 'Saint George');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('157', '9', 'ASJ', 'Saint John');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('158', '9', 'ASM', 'Saint Mary');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('159', '9', 'ASL', 'Saint Paul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('160', '9', 'ASR', 'Saint Peter');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('161', '9', 'ASH', 'Saint Philip');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('162', '9', 'BAR', 'Barbuda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('163', '9', 'RED', 'Redonda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('164', '10', 'AN', 'Antartida e Islas del Atlantico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('165', '10', 'BA', 'Buenos Aires');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('166', '10', 'CA', 'Catamarca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('167', '10', 'CH', 'Chaco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('168', '10', 'CU', 'Chubut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('169', '10', 'CO', 'Cordoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('170', '10', 'CR', 'Corrientes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('171', '10', 'CF', 'Capital Federal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('172', '10', 'ER', 'Entre Rios');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('173', '10', 'FO', 'Formosa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('174', '10', 'JU', 'Jujuy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('175', '10', 'LP', 'La Pampa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('176', '10', 'LR', 'La Rioja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('177', '10', 'ME', 'Mendoza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('178', '10', 'MI', 'Misiones');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('179', '10', 'NE', 'Neuquen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('180', '10', 'RN', 'Rio Negro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('181', '10', 'SA', 'Salta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('182', '10', 'SJ', 'San Juan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('183', '10', 'SL', 'San Luis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('184', '10', 'SC', 'Santa Cruz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('185', '10', 'SF', 'Santa Fe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('186', '10', 'SD', 'Santiago del Estero');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('187', '10', 'TF', 'Tierra del Fuego');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('188', '10', 'TU', 'Tucuman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('189', '11', 'AGT', 'Aragatsotn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('190', '11', 'ARR', 'Ararat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('191', '11', 'ARM', 'Armavir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('192', '11', 'GEG', 'Geghark\'unik\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('193', '11', 'KOT', 'Kotayk\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('194', '11', 'LOR', 'Lorri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('195', '11', 'SHI', 'Shirak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('196', '11', 'SYU', 'Syunik\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('197', '11', 'TAV', 'Tavush');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('198', '11', 'VAY', 'Vayots\' Dzor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('199', '11', 'YER', 'Yerevan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('200', '12', 'ARU', 'Aruba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('201', '12', 'ORA', 'Oranjestad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('202', '12', 'DRU', 'Druif Beach');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('203', '12', 'MAN', 'Manchebo Beach');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('204', '12', 'NOO', 'Noord');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('205', '12', 'PAL', 'Palm Beach');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('206', '12', 'ROO', 'Rooi Thomas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('207', '12', 'SIN', 'Sint Nicolaas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('208', '12', 'SIN', 'Sint Nicolas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('209', '12', 'WAY', 'Wayaca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('210', '13', 'ACT', 'Australian Capital Territory');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('211', '13', 'NSW', 'New South Wales');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('212', '13', 'NT', 'Northern Territory');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('213', '13', 'QLD', 'Queensland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('214', '13', 'SA', 'South Australia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('215', '13', 'TAS', 'Tasmania');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('216', '13', 'VIC', 'Victoria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('217', '13', 'WA', 'Western Australia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('218', '14', 'BUR', 'Burgenland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('219', '14', 'KAR', 'Kärnten');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('220', '14', 'NOS', 'Niederösterreich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('221', '14', 'OOS', 'Oberösterreich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('222', '14', 'SAL', 'Salzburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('223', '14', 'STE', 'Steiermark');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('224', '14', 'TIR', 'Tirol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('225', '14', 'VOR', 'Vorarlberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('226', '14', 'WIE', 'Wien');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('227', '15', 'AB', 'Ali Bayramli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('228', '15', 'ABS', 'Abseron');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('229', '15', 'AGC', 'AgcabAdi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('230', '15', 'AGM', 'Agdam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('231', '15', 'AGS', 'Agdas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('232', '15', 'AGA', 'Agstafa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('233', '15', 'AGU', 'Agsu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('234', '15', 'AST', 'Astara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('235', '15', 'BA', 'Baki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('236', '15', 'BAB', 'BabAk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('237', '15', 'BAL', 'BalakAn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('238', '15', 'BAR', 'BArdA');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('239', '15', 'BEY', 'Beylaqan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('240', '15', 'BIL', 'Bilasuvar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('241', '15', 'CAB', 'Cabrayil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('242', '15', 'CAL', 'Calilabab');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('243', '15', 'CUL', 'Culfa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('244', '15', 'DAS', 'Daskasan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('245', '15', 'DAV', 'Davaci');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('246', '15', 'FUZ', 'Fuzuli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('247', '15', 'GA', 'Ganca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('248', '15', 'GAD', 'Gadabay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('249', '15', 'GOR', 'Goranboy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('250', '15', 'GOY', 'Goycay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('251', '15', 'HAC', 'Haciqabul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('252', '15', 'IMI', 'Imisli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('253', '15', 'ISM', 'Ismayilli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('254', '15', 'KAL', 'Kalbacar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('255', '15', 'KUR', 'Kurdamir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('256', '15', 'LA', 'Lankaran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('257', '15', 'LAC', 'Lacin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('258', '15', 'LAN', 'Lankaran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('259', '15', 'LER', 'Lerik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('260', '15', 'MAS', 'Masalli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('261', '15', 'MI', 'Mingacevir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('262', '15', 'NA', 'Naftalan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('263', '15', 'NEF', 'Neftcala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('264', '15', 'OGU', 'Oguz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('265', '15', 'ORD', 'Ordubad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('266', '15', 'QAB', 'Qabala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('267', '15', 'QAX', 'Qax');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('268', '15', 'QAZ', 'Qazax');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('269', '15', 'QOB', 'Qobustan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('270', '15', 'QBA', 'Quba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('271', '15', 'QBI', 'Qubadli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('272', '15', 'QUS', 'Qusar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('273', '15', 'SA', 'Saki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('274', '15', 'SAT', 'Saatli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('275', '15', 'SAB', 'Sabirabad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('276', '15', 'SAD', 'Sadarak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('277', '15', 'SAH', 'Sahbuz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('278', '15', 'SAK', 'Saki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('279', '15', 'SAL', 'Salyan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('280', '15', 'SM', 'Sumqayit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('281', '15', 'SMI', 'Samaxi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('282', '15', 'SKR', 'Samkir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('283', '15', 'SMX', 'Samux');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('284', '15', 'SAR', 'Sarur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('285', '15', 'SIY', 'Siyazan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('286', '15', 'SS', 'Susa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('287', '15', 'SUS', 'Susa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('288', '15', 'TAR', 'Tartar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('289', '15', 'TOV', 'Tovuz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('290', '15', 'UCA', 'Ucar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('291', '15', 'XA', 'Xankandi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('292', '15', 'XAC', 'Xacmaz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('293', '15', 'XAN', 'Xanlar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('294', '15', 'XIZ', 'Xizi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('295', '15', 'XCI', 'Xocali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('296', '15', 'XVD', 'Xocavand');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('297', '15', 'YAR', 'Yardimli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('298', '15', 'YEV', 'Yevlax');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('299', '15', 'ZAN', 'Zangilan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('300', '15', 'ZAQ', 'Zaqatala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('301', '15', 'ZAR', 'Zardab');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('302', '15', 'NX', 'Naxcivan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('303', '16', 'ACK', 'Acklins');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('304', '16', 'BER', 'Berry Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('305', '16', 'BIM', 'Bimini');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('306', '16', 'BLK', 'Black Point');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('307', '16', 'CAT', 'Cat Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('308', '16', 'CAB', 'Central Abaco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('309', '16', 'CAN', 'Central Andros');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('310', '16', 'CEL', 'Central Eleuthera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('311', '16', 'FRE', 'City of Freeport');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('312', '16', 'CRO', 'Crooked Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('313', '16', 'EGB', 'East Grand Bahama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('314', '16', 'EXU', 'Exuma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('315', '16', 'GRD', 'Grand Cay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('316', '16', 'HAR', 'Harbour Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('317', '16', 'HOP', 'Hope Town');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('318', '16', 'INA', 'Inagua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('319', '16', 'LNG', 'Long Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('320', '16', 'MAN', 'Mangrove Cay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('321', '16', 'MAY', 'Mayaguana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('322', '16', 'MOO', 'Moore\'s Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('323', '16', 'NAB', 'North Abaco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('324', '16', 'NAN', 'North Andros');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('325', '16', 'NEL', 'North Eleuthera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('326', '16', 'RAG', 'Ragged Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('327', '16', 'RUM', 'Rum Cay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('328', '16', 'SAL', 'San Salvador');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('329', '16', 'SAB', 'South Abaco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('330', '16', 'SAN', 'South Andros');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('331', '16', 'SEL', 'South Eleuthera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('332', '16', 'SWE', 'Spanish Wells');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('333', '16', 'WGB', 'West Grand Bahama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('334', '17', 'CAP', 'Capital');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('335', '17', 'CEN', 'Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('336', '17', 'MUH', 'Muharraq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('337', '17', 'NOR', 'Northern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('338', '17', 'SOU', 'Southern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('339', '18', 'BAR', 'Barisal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('340', '18', 'CHI', 'Chittagong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('341', '18', 'DHA', 'Dhaka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('342', '18', 'KHU', 'Khulna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('343', '18', 'RAJ', 'Rajshahi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('344', '18', 'SYL', 'Sylhet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('345', '19', 'CC', 'Christ Church');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('346', '19', 'AND', 'Saint Andrew');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('347', '19', 'GEO', 'Saint George');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('348', '19', 'JAM', 'Saint James');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('349', '19', 'JOH', 'Saint John');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('350', '19', 'JOS', 'Saint Joseph');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('351', '19', 'LUC', 'Saint Lucy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('352', '19', 'MIC', 'Saint Michael');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('353', '19', 'PET', 'Saint Peter');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('354', '19', 'PHI', 'Saint Philip');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('355', '19', 'THO', 'Saint Thomas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('356', '20', 'BR', 'Brestskaya (Brest)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('357', '20', 'HO', 'Homyel\'skaya (Homyel\')');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('358', '20', 'HM', 'Horad Minsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('359', '20', 'HR', 'Hrodzyenskaya (Hrodna)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('360', '20', 'MA', 'Mahilyowskaya (Mahilyow)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('361', '20', 'MI', 'Minskaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('362', '20', 'VI', 'Vitsyebskaya (Vitsyebsk)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('363', '21', 'VAN', 'Antwerpen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('364', '21', 'WBR', 'Brabant Wallon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('365', '21', 'WHT', 'Hainaut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('366', '21', 'WLG', 'Liege');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('367', '21', 'VLI', 'Limburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('368', '21', 'WLX', 'Luxembourg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('369', '21', 'WNA', 'Namur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('370', '21', 'VOV', 'Oost-Vlaanderen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('371', '21', 'VBR', 'Vlaams Brabant');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('372', '21', 'VWV', 'West-Vlaanderen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('373', '22', 'BZ', 'Belize');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('374', '22', 'CY', 'Cayo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('375', '22', 'CR', 'Corozal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('376', '22', 'OW', 'Orange Walk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('377', '22', 'SC', 'Stann Creek');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('378', '22', 'TO', 'Toledo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('379', '23', 'AL', 'Alibori');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('380', '23', 'AK', 'Atakora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('381', '23', 'AQ', 'Atlantique');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('382', '23', 'BO', 'Borgou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('383', '23', 'CO', 'Collines');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('384', '23', 'DO', 'Donga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('385', '23', 'KO', 'Kouffo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('386', '23', 'LI', 'Littoral');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('387', '23', 'MO', 'Mono');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('388', '23', 'OU', 'Oueme');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('389', '23', 'PL', 'Plateau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('390', '23', 'ZO', 'Zou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('391', '24', 'DS', 'Devonshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('392', '24', 'HC', 'Hamilton City');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('393', '24', 'HA', 'Hamilton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('394', '24', 'PG', 'Paget');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('395', '24', 'PB', 'Pembroke');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('396', '24', 'GC', 'Saint George City');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('397', '24', 'SG', 'Saint George\'s');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('398', '24', 'SA', 'Sandys');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('399', '24', 'SM', 'Smith\'s');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('400', '24', 'SH', 'Southampton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('401', '24', 'WA', 'Warwick');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('402', '25', 'BUM', 'Bumthang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('403', '25', 'CHU', 'Chukha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('404', '25', 'DAG', 'Dagana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('405', '25', 'GAS', 'Gasa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('406', '25', 'HAA', 'Haa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('407', '25', 'LHU', 'Lhuntse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('408', '25', 'MON', 'Mongar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('409', '25', 'PAR', 'Paro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('410', '25', 'PEM', 'Pemagatshel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('411', '25', 'PUN', 'Punakha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('412', '25', 'SJO', 'Samdrup Jongkhar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('413', '25', 'SAT', 'Samtse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('414', '25', 'SAR', 'Sarpang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('415', '25', 'THI', 'Thimphu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('416', '25', 'TRG', 'Trashigang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('417', '25', 'TRY', 'Trashiyangste');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('418', '25', 'TRO', 'Trongsa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('419', '25', 'TSI', 'Tsirang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('420', '25', 'WPH', 'Wangdue Phodrang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('421', '25', 'ZHE', 'Zhemgang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('422', '26', 'BEN', 'Beni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('423', '26', 'CHU', 'Chuquisaca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('424', '26', 'COC', 'Cochabamba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('425', '26', 'LPZ', 'La Paz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('426', '26', 'ORU', 'Oruro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('427', '26', 'PAN', 'Pando');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('428', '26', 'POT', 'Potosi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('429', '26', 'SCZ', 'Santa Cruz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('430', '26', 'TAR', 'Tarija');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('431', '27', 'BRO', 'Brcko district');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('432', '27', 'FUS', 'Unsko-Sanski Kanton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('433', '27', 'FPO', 'Posavski Kanton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('434', '27', 'FTU', 'Tuzlanski Kanton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('435', '27', 'FZE', 'Zenicko-Dobojski Kanton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('436', '27', 'FBP', 'Bosanskopodrinjski Kanton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('437', '27', 'FSB', 'Srednjebosanski Kanton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('438', '27', 'FHN', 'Hercegovacko-neretvanski Kanton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('439', '27', 'FZH', 'Zapadnohercegovacka Zupanija');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('440', '27', 'FSA', 'Kanton Sarajevo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('441', '27', 'FZA', 'Zapadnobosanska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('442', '27', 'SBL', 'Banja Luka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('443', '27', 'SDO', 'Doboj');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('444', '27', 'SBI', 'Bijeljina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('445', '27', 'SVL', 'Vlasenica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('446', '27', 'SSR', 'Sarajevo-Romanija or Sokolac');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('447', '27', 'SFO', 'Foca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('448', '27', 'STR', 'Trebinje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('449', '28', 'CE', 'Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('450', '28', 'GH', 'Ghanzi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('451', '28', 'KD', 'Kgalagadi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('452', '28', 'KT', 'Kgatleng');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('453', '28', 'KW', 'Kweneng');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('454', '28', 'NG', 'Ngamiland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('455', '28', 'NE', 'North East');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('456', '28', 'NW', 'North West');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('457', '28', 'SE', 'South East');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('458', '28', 'SO', 'Southern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('459', '30', 'AC', 'Acre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('460', '30', 'AL', 'Alagoas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('461', '30', 'AP', 'Amapa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('462', '30', 'AM', 'Amazonas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('463', '30', 'BA', 'Bahia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('464', '30', 'CE', 'Ceara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('465', '30', 'DF', 'Distrito Federal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('466', '30', 'ES', 'Espirito Santo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('467', '30', 'GO', 'Goias');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('468', '30', 'MA', 'Maranhao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('469', '30', 'MT', 'Mato Grosso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('470', '30', 'MS', 'Mato Grosso do Sul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('471', '30', 'MG', 'Minas Gerais');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('472', '30', 'PA', 'Para');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('473', '30', 'PB', 'Paraiba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('474', '30', 'PR', 'Parana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('475', '30', 'PE', 'Pernambuco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('476', '30', 'PI', 'Piaui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('477', '30', 'RJ', 'Rio de Janeiro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('478', '30', 'RN', 'Rio Grande do Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('479', '30', 'RS', 'Rio Grande do Sul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('480', '30', 'RO', 'Rondonia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('481', '30', 'RR', 'Roraima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('482', '30', 'SC', 'Santa Catarina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('483', '30', 'SP', 'Sao Paulo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('484', '30', 'SE', 'Sergipe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('485', '30', 'TO', 'Tocantins');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('486', '31', 'PB', 'Peros Banhos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('487', '31', 'SI', 'Salomon Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('488', '31', 'NI', 'Nelsons Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('489', '31', 'TB', 'Three Brothers');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('490', '31', 'EA', 'Eagle Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('491', '31', 'DI', 'Danger Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('492', '31', 'EG', 'Egmont Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('493', '31', 'DG', 'Diego Garcia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('494', '32', 'BEL', 'Belait');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('495', '32', 'BRM', 'Brunei and Muara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('496', '32', 'TEM', 'Temburong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('497', '32', 'TUT', 'Tutong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('498', '33', '', 'Blagoevgrad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('499', '33', '', 'Burgas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('500', '33', '', 'Dobrich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('501', '33', '', 'Gabrovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('502', '33', '', 'Haskovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('503', '33', '', 'Kardjali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('504', '33', '', 'Kyustendil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('505', '33', '', 'Lovech');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('506', '33', '', 'Montana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('507', '33', '', 'Pazardjik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('508', '33', '', 'Pernik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('509', '33', '', 'Pleven');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('510', '33', '', 'Plovdiv');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('511', '33', '', 'Razgrad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('512', '33', '', 'Shumen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('513', '33', '', 'Silistra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('514', '33', '', 'Sliven');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('515', '33', '', 'Smolyan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('516', '33', '', 'Sofia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('517', '33', '', 'Sofia - town');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('518', '33', '', 'Stara Zagora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('519', '33', '', 'Targovishte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('520', '33', '', 'Varna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('521', '33', '', 'Veliko Tarnovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('522', '33', '', 'Vidin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('523', '33', '', 'Vratza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('524', '33', '', 'Yambol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('525', '34', 'BAL', 'Bale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('526', '34', 'BAM', 'Bam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('527', '34', 'BAN', 'Banwa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('528', '34', 'BAZ', 'Bazega');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('529', '34', 'BOR', 'Bougouriba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('530', '34', 'BLG', 'Boulgou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('531', '34', 'BOK', 'Boulkiemde');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('532', '34', 'COM', 'Comoe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('533', '34', 'GAN', 'Ganzourgou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('534', '34', 'GNA', 'Gnagna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('535', '34', 'GOU', 'Gourma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('536', '34', 'HOU', 'Houet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('537', '34', 'IOA', 'Ioba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('538', '34', 'KAD', 'Kadiogo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('539', '34', 'KEN', 'Kenedougou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('540', '34', 'KOD', 'Komondjari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('541', '34', 'KOP', 'Kompienga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('542', '34', 'KOS', 'Kossi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('543', '34', 'KOL', 'Koulpelogo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('544', '34', 'KOT', 'Kouritenga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('545', '34', 'KOW', 'Kourweogo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('546', '34', 'LER', 'Leraba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('547', '34', 'LOR', 'Loroum');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('548', '34', 'MOU', 'Mouhoun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('549', '34', 'NAH', 'Nahouri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('550', '34', 'NAM', 'Namentenga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('551', '34', 'NAY', 'Nayala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('552', '34', 'NOU', 'Noumbiel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('553', '34', 'OUB', 'Oubritenga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('554', '34', 'OUD', 'Oudalan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('555', '34', 'PAS', 'Passore');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('556', '34', 'PON', 'Poni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('557', '34', 'SAG', 'Sanguie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('558', '34', 'SAM', 'Sanmatenga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('559', '34', 'SEN', 'Seno');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('560', '34', 'SIS', 'Sissili');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('561', '34', 'SOM', 'Soum');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('562', '34', 'SOR', 'Sourou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('563', '34', 'TAP', 'Tapoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('564', '34', 'TUY', 'Tuy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('565', '34', 'YAG', 'Yagha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('566', '34', 'YAT', 'Yatenga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('567', '34', 'ZIR', 'Ziro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('568', '34', 'ZOD', 'Zondoma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('569', '34', 'ZOW', 'Zoundweogo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('570', '35', 'BB', 'Bubanza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('571', '35', 'BJ', 'Bujumbura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('572', '35', 'BR', 'Bururi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('573', '35', 'CA', 'Cankuzo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('574', '35', 'CI', 'Cibitoke');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('575', '35', 'GI', 'Gitega');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('576', '35', 'KR', 'Karuzi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('577', '35', 'KY', 'Kayanza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('578', '35', 'KI', 'Kirundo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('579', '35', 'MA', 'Makamba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('580', '35', 'MU', 'Muramvya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('581', '35', 'MY', 'Muyinga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('582', '35', 'MW', 'Mwaro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('583', '35', 'NG', 'Ngozi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('584', '35', 'RT', 'Rutana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('585', '35', 'RY', 'Ruyigi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('586', '36', 'PP', 'Phnom Penh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('587', '36', 'PS', 'Preah Seihanu (Kompong Som or Si');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('588', '36', 'PA', 'Pailin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('589', '36', 'KB', 'Keb');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('590', '36', 'BM', 'Banteay Meanchey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('591', '36', 'BA', 'Battambang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('592', '36', 'KM', 'Kampong Cham');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('593', '36', 'KN', 'Kampong Chhnang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('594', '36', 'KU', 'Kampong Speu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('595', '36', 'KO', 'Kampong Som');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('596', '36', 'KT', 'Kampong Thom');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('597', '36', 'KP', 'Kampot');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('598', '36', 'KL', 'Kandal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('599', '36', 'KK', 'Kaoh Kong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('600', '36', 'KR', 'Kratie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('601', '36', 'MK', 'Mondul Kiri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('602', '36', 'OM', 'Oddar Meancheay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('603', '36', 'PU', 'Pursat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('604', '36', 'PR', 'Preah Vihear');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('605', '36', 'PG', 'Prey Veng');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('606', '36', 'RK', 'Ratanak Kiri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('607', '36', 'SI', 'Siemreap');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('608', '36', 'ST', 'Stung Treng');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('609', '36', 'SR', 'Svay Rieng');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('610', '36', 'TK', 'Takeo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('611', '37', 'ADA', 'Adamawa (Adamaoua)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('612', '37', 'CEN', 'Centre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('613', '37', 'EST', 'East (Est)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('614', '37', 'EXN', 'Extrême-Nord');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('615', '37', 'LIT', 'Littoral');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('616', '37', 'NOR', 'North (Nord)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('617', '37', 'NOT', 'Northwest (Nord-Ouest)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('618', '37', 'OUE', 'West (Ouest)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('619', '37', 'SUD', 'South (Sud)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('620', '37', 'SOU', 'Southwest (Sud-Ouest).');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('621', '38', 'AB', 'Alberta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('622', '38', 'BC', 'British Columbia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('623', '38', 'MB', 'Manitoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('624', '38', 'NB', 'New Brunswick');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('625', '38', 'NL', 'Newfoundland and Labrador');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('626', '38', 'NT', 'Northwest Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('627', '38', 'NS', 'Nova Scotia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('628', '38', 'NU', 'Nunavut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('629', '38', 'ON', 'Ontario');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('630', '38', 'PE', 'Prince Edward Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('631', '38', 'QC', 'Qu&eacute;bec');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('632', '38', 'SK', 'Saskatchewan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('633', '38', 'YT', 'Yukon Territory');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('634', '39', 'BV', 'Boa Vista');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('635', '39', 'BR', 'Brava');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('636', '39', 'CS', 'Calheta de Sao Miguel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('637', '39', 'MA', 'Maio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('638', '39', 'MO', 'Mosteiros');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('639', '39', 'PA', 'Paul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('640', '39', 'PN', 'Porto Novo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('641', '39', 'PR', 'Praia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('642', '39', 'RG', 'Ribeira Grande');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('643', '39', 'SL', 'Sal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('644', '39', 'CA', 'Santa Catarina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('645', '39', 'CR', 'Santa Cruz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('646', '39', 'SD', 'Sao Domingos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('647', '39', 'SF', 'Sao Filipe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('648', '39', 'SN', 'Sao Nicolau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('649', '39', 'SV', 'Sao Vicente');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('650', '39', 'TA', 'Tarrafal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('651', '40', 'CR', 'Creek');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('652', '40', 'EA', 'Eastern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('653', '40', 'ML', 'Midland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('654', '40', 'ST', 'South Town');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('655', '40', 'SP', 'Spot Bay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('656', '40', 'SK', 'Stake Bay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('657', '40', 'WD', 'West End');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('658', '40', 'WN', 'Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('659', '41', 'BBA', 'Bamingui-Bangoran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('660', '41', 'BKO', 'Basse-Kotto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('661', '41', 'HKO', 'Haute-Kotto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('662', '41', 'HMB', 'Haut-Mbomou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('663', '41', 'KEM', 'Kemo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('664', '41', 'LOB', 'Lobaye');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('665', '41', 'MKD', 'Mambéré-Kadéï');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('666', '41', 'MBO', 'Mbomou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('667', '41', 'NMM', 'Nana-Mambere');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('668', '41', 'OMP', 'Ombella-M\'Poko');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('669', '41', 'OUK', 'Ouaka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('670', '41', 'OUH', 'Ouham');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('671', '41', 'OPE', 'Ouham-Pende');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('672', '41', 'VAK', 'Vakaga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('673', '41', 'NGR', 'Nana-Grebizi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('674', '41', 'SMB', 'Sangha-Mbaere');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('675', '41', 'BAN', 'Bangui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('676', '42', 'BA', 'Batha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('677', '42', 'BI', 'Biltine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('678', '42', 'BE', 'Borkou-Ennedi-Tibesti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('679', '42', 'CB', 'Chari-Baguirmi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('680', '42', 'GU', 'Guera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('681', '42', 'KA', 'Kanem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('682', '42', 'LA', 'Lac');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('683', '42', 'LC', 'Logone Occidental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('684', '42', 'LR', 'Logone Oriental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('685', '42', 'MK', 'Mayo-Kebbi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('686', '42', 'MC', 'Moyen-Chari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('687', '42', 'OU', 'Ouaddai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('688', '42', 'SA', 'Salamat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('689', '42', 'TA', 'Tandjile');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('690', '43', 'AI', 'Aisen del General Carlos Ibanez');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('691', '43', 'AN', 'Antofagasta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('692', '43', 'AR', 'Araucania');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('693', '43', 'AT', 'Atacama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('694', '43', 'BI', 'Bio-Bio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('695', '43', 'CO', 'Coquimbo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('696', '43', 'LI', 'Libertador General Bernardo O\'Hi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('697', '43', 'LL', 'Los Lagos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('698', '43', 'MA', 'Magallanes y de la Antartica Chi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('699', '43', 'ML', 'Maule');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('700', '43', 'RM', 'Region Metropolitana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('701', '43', 'TA', 'Tarapaca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('702', '43', 'VS', 'Valparaiso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('703', '44', 'AN', 'Anhui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('704', '44', 'BE', 'Beijing');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('705', '44', 'CH', 'Chongqing');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('706', '44', 'FU', 'Fujian');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('707', '44', 'GA', 'Gansu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('708', '44', 'GU', 'Guangdong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('709', '44', 'GX', 'Guangxi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('710', '44', 'GZ', 'Guizhou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('711', '44', 'HA', 'Hainan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('712', '44', 'HB', 'Hebei');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('713', '44', 'HL', 'Heilongjiang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('714', '44', 'HE', 'Henan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('715', '44', 'HK', 'Hong Kong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('716', '44', 'HU', 'Hubei');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('717', '44', 'HN', 'Hunan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('718', '44', 'IM', 'Inner Mongolia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('719', '44', 'JI', 'Jiangsu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('720', '44', 'JX', 'Jiangxi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('721', '44', 'JL', 'Jilin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('722', '44', 'LI', 'Liaoning');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('723', '44', 'MA', 'Macau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('724', '44', 'NI', 'Ningxia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('725', '44', 'SH', 'Shaanxi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('726', '44', 'SA', 'Shandong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('727', '44', 'SG', 'Shanghai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('728', '44', 'SX', 'Shanxi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('729', '44', 'SI', 'Sichuan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('730', '44', 'TI', 'Tianjin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('731', '44', 'XI', 'Xinjiang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('732', '44', 'YU', 'Yunnan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('733', '44', 'ZH', 'Zhejiang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('734', '46', 'D', 'Direction Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('735', '46', 'H', 'Home Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('736', '46', 'O', 'Horsburgh Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('737', '46', 'S', 'South Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('738', '46', 'W', 'West Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('739', '47', 'AMZ', 'Amazonas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('740', '47', 'ANT', 'Antioquia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('741', '47', 'ARA', 'Arauca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('742', '47', 'ATL', 'Atlantico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('743', '47', 'BDC', 'Bogota D.C.');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('744', '47', 'BOL', 'Bolivar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('745', '47', 'BOY', 'Boyaca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('746', '47', 'CAL', 'Caldas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('747', '47', 'CAQ', 'Caqueta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('748', '47', 'CAS', 'Casanare');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('749', '47', 'CAU', 'Cauca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('750', '47', 'CES', 'Cesar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('751', '47', 'CHO', 'Choco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('752', '47', 'COR', 'Cordoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('753', '47', 'CAM', 'Cundinamarca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('754', '47', 'GNA', 'Guainia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('755', '47', 'GJR', 'Guajira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('756', '47', 'GVR', 'Guaviare');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('757', '47', 'HUI', 'Huila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('758', '47', 'MAG', 'Magdalena');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('759', '47', 'MET', 'Meta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('760', '47', 'NAR', 'Narino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('761', '47', 'NDS', 'Norte de Santander');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('762', '47', 'PUT', 'Putumayo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('763', '47', 'QUI', 'Quindio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('764', '47', 'RIS', 'Risaralda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('765', '47', 'SAP', 'San Andres y Providencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('766', '47', 'SAN', 'Santander');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('767', '47', 'SUC', 'Sucre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('768', '47', 'TOL', 'Tolima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('769', '47', 'VDC', 'Valle del Cauca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('770', '47', 'VAU', 'Vaupes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('771', '47', 'VIC', 'Vichada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('772', '48', 'G', 'Grande Comore');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('773', '48', 'A', 'Anjouan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('774', '48', 'M', 'Moheli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('775', '49', 'BO', 'Bouenza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('776', '49', 'BR', 'Brazzaville');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('777', '49', 'CU', 'Cuvette');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('778', '49', 'CO', 'Cuvette-Ouest');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('779', '49', 'KO', 'Kouilou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('780', '49', 'LE', 'Lekoumou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('781', '49', 'LI', 'Likouala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('782', '49', 'NI', 'Niari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('783', '49', 'PL', 'Plateaux');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('784', '49', 'PO', 'Pool');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('785', '49', 'SA', 'Sangha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('786', '50', 'PU', 'Pukapuka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('787', '50', 'RK', 'Rakahanga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('788', '50', 'MK', 'Manihiki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('789', '50', 'PE', 'Penrhyn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('790', '50', 'NI', 'Nassau Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('791', '50', 'SU', 'Surwarrow');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('792', '50', 'PA', 'Palmerston');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('793', '50', 'AI', 'Aitutaki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('794', '50', 'MA', 'Manuae');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('795', '50', 'TA', 'Takutea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('796', '50', 'MT', 'Mitiaro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('797', '50', 'AT', 'Atiu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('798', '50', 'MU', 'Mauke');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('799', '50', 'RR', 'Rarotonga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('800', '50', 'MG', 'Mangaia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('801', '51', 'AL', 'Alajuela');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('802', '51', 'CA', 'Cartago');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('803', '51', 'GU', 'Guanacaste');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('804', '51', 'HE', 'Heredia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('805', '51', 'LI', 'Limon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('806', '51', 'PU', 'Puntarenas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('807', '51', 'SJ', 'San Jose');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('808', '52', 'ABE', 'Abengourou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('809', '52', 'ABI', 'Abidjan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('810', '52', 'ABO', 'Aboisso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('811', '52', 'ADI', 'Adiake');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('812', '52', 'ADZ', 'Adzope');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('813', '52', 'AGB', 'Agboville');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('814', '52', 'AGN', 'Agnibilekrou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('815', '52', 'ALE', 'Alepe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('816', '52', 'BOC', 'Bocanda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('817', '52', 'BAN', 'Bangolo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('818', '52', 'BEO', 'Beoumi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('819', '52', 'BIA', 'Biankouma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('820', '52', 'BDK', 'Bondoukou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('821', '52', 'BGN', 'Bongouanou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('822', '52', 'BFL', 'Bouafle');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('823', '52', 'BKE', 'Bouake');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('824', '52', 'BNA', 'Bouna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('825', '52', 'BDL', 'Boundiali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('826', '52', 'DKL', 'Dabakala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('827', '52', 'DBU', 'Dabou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('828', '52', 'DAL', 'Daloa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('829', '52', 'DAN', 'Danane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('830', '52', 'DAO', 'Daoukro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('831', '52', 'DIM', 'Dimbokro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('832', '52', 'DIV', 'Divo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('833', '52', 'DUE', 'Duekoue');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('834', '52', 'FER', 'Ferkessedougou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('835', '52', 'GAG', 'Gagnoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('836', '52', 'GBA', 'Grand-Bassam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('837', '52', 'GLA', 'Grand-Lahou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('838', '52', 'GUI', 'Guiglo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('839', '52', 'ISS', 'Issia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('840', '52', 'JAC', 'Jacqueville');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('841', '52', 'KAT', 'Katiola');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('842', '52', 'KOR', 'Korhogo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('843', '52', 'LAK', 'Lakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('844', '52', 'MAN', 'Man');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('845', '52', 'MKN', 'Mankono');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('846', '52', 'MBA', 'Mbahiakro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('847', '52', 'ODI', 'Odienne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('848', '52', 'OUM', 'Oume');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('849', '52', 'SAK', 'Sakassou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('850', '52', 'SPE', 'San-Pedro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('851', '52', 'SAS', 'Sassandra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('852', '52', 'SEG', 'Seguela');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('853', '52', 'SIN', 'Sinfra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('854', '52', 'SOU', 'Soubre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('855', '52', 'TAB', 'Tabou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('856', '52', 'TAN', 'Tanda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('857', '52', 'TIE', 'Tiebissou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('858', '52', 'TIN', 'Tingrela');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('859', '52', 'TIA', 'Tiassale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('860', '52', 'TBA', 'Touba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('861', '52', 'TLP', 'Toulepleu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('862', '52', 'TMD', 'Toumodi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('863', '52', 'VAV', 'Vavoua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('864', '52', 'YAM', 'Yamoussoukro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('865', '52', 'ZUE', 'Zuenoula');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('866', '53', 'BB', 'Bjelovar-Bilogora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('867', '53', 'CZ', 'City of Zagreb');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('868', '53', 'DN', 'Dubrovnik-Neretva');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('869', '53', 'IS', 'Istra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('870', '53', 'KA', 'Karlovac');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('871', '53', 'KK', 'Koprivnica-Krizevci');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('872', '53', 'KZ', 'Krapina-Zagorje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('873', '53', 'LS', 'Lika-Senj');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('874', '53', 'ME', 'Medimurje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('875', '53', 'OB', 'Osijek-Baranja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('876', '53', 'PS', 'Pozega-Slavonia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('877', '53', 'PG', 'Primorje-Gorski Kotar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('878', '53', 'SI', 'Sibenik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('879', '53', 'SM', 'Sisak-Moslavina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('880', '53', 'SB', 'Slavonski Brod-Posavina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('881', '53', 'SD', 'Split-Dalmatia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('882', '53', 'VA', 'Varazdin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('883', '53', 'VP', 'Virovitica-Podravina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('884', '53', 'VS', 'Vukovar-Srijem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('885', '53', 'ZK', 'Zadar-Knin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('886', '53', 'ZA', 'Zagreb');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('887', '54', 'CA', 'Camaguey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('888', '54', 'CD', 'Ciego de Avila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('889', '54', 'CI', 'Cienfuegos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('890', '54', 'CH', 'Ciudad de La Habana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('891', '54', 'GR', 'Granma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('892', '54', 'GU', 'Guantanamo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('893', '54', 'HO', 'Holguin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('894', '54', 'IJ', 'Isla de la Juventud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('895', '54', 'LH', 'La Habana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('896', '54', 'LT', 'Las Tunas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('897', '54', 'MA', 'Matanzas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('898', '54', 'PR', 'Pinar del Rio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('899', '54', 'SS', 'Sancti Spiritus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('900', '54', 'SC', 'Santiago de Cuba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('901', '54', 'VC', 'Villa Clara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('902', '55', 'F', 'Famagusta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('903', '55', 'K', 'Kyrenia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('904', '55', 'A', 'Larnaca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('905', '55', 'I', 'Limassol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('906', '55', 'N', 'Nicosia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('907', '55', 'P', 'Paphos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('908', '56', 'U', '&Uacute;steck&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('909', '56', 'C', 'Jiho&#269;esk&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('910', '56', 'B', 'Jihomoravsk&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('911', '56', 'K', 'Karlovarsk&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('912', '56', 'H', 'Kr&aacute;lov&eacute;hradeck&#25');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('913', '56', 'L', 'Libereck&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('914', '56', 'T', 'Moravskoslezsk&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('915', '56', 'M', 'Olomouck&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('916', '56', 'E', 'Pardubick&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('917', '56', 'P', 'Plze&#328;sk&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('918', '56', 'A', 'Hlavn&iacute; m&#283;sto Praha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('919', '56', 'S', 'St&#345;edo&#269;esk&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('920', '56', 'J', 'Vyso&#269;ina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('921', '56', 'Z', 'Zl&iacute;nsk&#253;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('922', '57', 'AR', 'Arhus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('923', '57', 'BH', 'Bornholm');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('924', '57', 'CO', 'Copenhagen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('925', '57', 'FO', 'Faroe Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('926', '57', 'FR', 'Frederiksborg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('927', '57', 'FY', 'Fyn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('928', '57', 'KO', 'Kobenhavn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('929', '57', 'NO', 'Nordjylland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('930', '57', 'RI', 'Ribe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('931', '57', 'RK', 'Ringkobing');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('932', '57', 'RO', 'Roskilde');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('933', '57', 'SO', 'Sonderjylland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('934', '57', 'ST', 'Storstrom');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('935', '57', 'VK', 'Vejle');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('936', '57', 'VJ', 'Vestj&aelig;lland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('937', '57', 'VB', 'Viborg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('938', '58', 'S', '\'Ali Sabih');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('939', '58', 'K', 'Dikhil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('940', '58', 'J', 'Djibouti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('941', '58', 'O', 'Obock');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('942', '58', 'T', 'Tadjoura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('943', '59', 'AND', 'Saint Andrew Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('944', '59', 'DAV', 'Saint David Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('945', '59', 'GEO', 'Saint George Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('946', '59', 'JOH', 'Saint John Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('947', '59', 'JOS', 'Saint Joseph Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('948', '59', 'LUK', 'Saint Luke Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('949', '59', 'MAR', 'Saint Mark Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('950', '59', 'PAT', 'Saint Patrick Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('951', '59', 'PAU', 'Saint Paul Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('952', '59', 'PET', 'Saint Peter Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('953', '60', 'DN', 'Distrito Nacional');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('954', '60', 'AZ', 'Azua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('955', '60', 'BC', 'Baoruco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('956', '60', 'BH', 'Barahona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('957', '60', 'DJ', 'Dajabon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('958', '60', 'DU', 'Duarte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('959', '60', 'EL', 'Elias Pina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('960', '60', 'SY', 'El Seybo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('961', '60', 'ET', 'Espaillat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('962', '60', 'HM', 'Hato Mayor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('963', '60', 'IN', 'Independencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('964', '60', 'AL', 'La Altagracia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('965', '60', 'RO', 'La Romana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('966', '60', 'VE', 'La Vega');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('967', '60', 'MT', 'Maria Trinidad Sanchez');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('968', '60', 'MN', 'Monsenor Nouel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('969', '60', 'MC', 'Monte Cristi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('970', '60', 'MP', 'Monte Plata');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('971', '60', 'PD', 'Pedernales');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('972', '60', 'PR', 'Peravia (Bani)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('973', '60', 'PP', 'Puerto Plata');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('974', '60', 'SL', 'Salcedo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('975', '60', 'SM', 'Samana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('976', '60', 'SH', 'Sanchez Ramirez');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('977', '60', 'SC', 'San Cristobal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('978', '60', 'JO', 'San Jose de Ocoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('979', '60', 'SJ', 'San Juan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('980', '60', 'PM', 'San Pedro de Macoris');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('981', '60', 'SA', 'Santiago');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('982', '60', 'ST', 'Santiago Rodriguez');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('983', '60', 'SD', 'Santo Domingo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('984', '60', 'VA', 'Valverde');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('985', '61', 'AL', 'Aileu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('986', '61', 'AN', 'Ainaro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('987', '61', 'BA', 'Baucau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('988', '61', 'BO', 'Bobonaro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('989', '61', 'CO', 'Cova Lima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('990', '61', 'DI', 'Dili');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('991', '61', 'ER', 'Ermera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('992', '61', 'LA', 'Lautem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('993', '61', 'LI', 'Liquica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('994', '61', 'MT', 'Manatuto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('995', '61', 'MF', 'Manufahi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('996', '61', 'OE', 'Oecussi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('997', '61', 'VI', 'Viqueque');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('998', '62', 'AZU', 'Azuay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('999', '62', 'BOL', 'Bolivar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1000', '62', 'CAN', 'Ca&ntilde;ar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1001', '62', 'CAR', 'Carchi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1002', '62', 'CHI', 'Chimborazo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1003', '62', 'COT', 'Cotopaxi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1004', '62', 'EOR', 'El Oro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1005', '62', 'ESM', 'Esmeraldas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1006', '62', 'GPS', 'Gal&aacute;pagos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1007', '62', 'GUA', 'Guayas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1008', '62', 'IMB', 'Imbabura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1009', '62', 'LOJ', 'Loja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1010', '62', 'LRO', 'Los Ríos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1011', '62', 'MAN', 'Manab&iacute;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1012', '62', 'MSA', 'Morona Santiago');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1013', '62', 'NAP', 'Napo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1014', '62', 'ORE', 'Orellana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1015', '62', 'PAS', 'Pastaza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1016', '62', 'PIC', 'Pichincha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1017', '62', 'SUC', 'Sucumb&iacute;os');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1018', '62', 'TUN', 'Tungurahua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1019', '62', 'ZCH', 'Zamora Chinchipe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1020', '63', 'DHY', 'Ad Daqahliyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1021', '63', 'BAM', 'Al Bahr al Ahmar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1022', '63', 'BHY', 'Al Buhayrah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1023', '63', 'FYM', 'Al Fayyum');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1024', '63', 'GBY', 'Al Gharbiyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1025', '63', 'IDR', 'Al Iskandariyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1026', '63', 'IML', 'Al Isma\'iliyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1027', '63', 'JZH', 'Al Jizah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1028', '63', 'MFY', 'Al Minufiyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1029', '63', 'MNY', 'Al Minya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1030', '63', 'QHR', 'Al Qahirah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1031', '63', 'QLY', 'Al Qalyubiyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1032', '63', 'WJD', 'Al Wadi al Jadid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1033', '63', 'SHQ', 'Ash Sharqiyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1034', '63', 'SWY', 'As Suways');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1035', '63', 'ASW', 'Aswan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1036', '63', 'ASY', 'Asyut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1037', '63', 'BSW', 'Bani Suwayf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1038', '63', 'BSD', 'Bur Sa\'id');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1039', '63', 'DMY', 'Dumyat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1040', '63', 'JNS', 'Janub Sina\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1041', '63', 'KSH', 'Kafr ash Shaykh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1042', '63', 'MAT', 'Matruh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1043', '63', 'QIN', 'Qina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1044', '63', 'SHS', 'Shamal Sina\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1045', '63', 'SUH', 'Suhaj');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1046', '64', 'AH', 'Ahuachapan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1047', '64', 'CA', 'Cabanas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1048', '64', 'CH', 'Chalatenango');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1049', '64', 'CU', 'Cuscatlan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1050', '64', 'LB', 'La Libertad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1051', '64', 'PZ', 'La Paz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1052', '64', 'UN', 'La Union');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1053', '64', 'MO', 'Morazan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1054', '64', 'SM', 'San Miguel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1055', '64', 'SS', 'San Salvador');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1056', '64', 'SV', 'San Vicente');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1057', '64', 'SA', 'Santa Ana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1058', '64', 'SO', 'Sonsonate');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1059', '64', 'US', 'Usulutan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1060', '65', 'AN', 'Provincia Annobon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1061', '65', 'BN', 'Provincia Bioko Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1062', '65', 'BS', 'Provincia Bioko Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1063', '65', 'CS', 'Provincia Centro Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1064', '65', 'KN', 'Provincia Kie-Ntem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1065', '65', 'LI', 'Provincia Litoral');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1066', '65', 'WN', 'Provincia Wele-Nzas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1067', '66', 'MA', 'Central (Maekel)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1068', '66', 'KE', 'Anseba (Keren)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1069', '66', 'DK', 'Southern Red Sea (Debub-Keih-Bah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1070', '66', 'SK', 'Northern Red Sea (Semien-Keih-Ba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1071', '66', 'DE', 'Southern (Debub)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1072', '66', 'BR', 'Gash-Barka (Barentu)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1073', '67', 'HA', 'Harjumaa (Tallinn)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1074', '67', 'HI', 'Hiiumaa (Kardla)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1075', '67', 'IV', 'Ida-Virumaa (Johvi)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1076', '67', 'JA', 'Jarvamaa (Paide)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1077', '67', 'JO', 'Jogevamaa (Jogeva)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1078', '67', 'LV', 'Laane-Virumaa (Rakvere)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1079', '67', 'LA', 'Laanemaa (Haapsalu)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1080', '67', 'PA', 'Parnumaa (Parnu)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1081', '67', 'PO', 'Polvamaa (Polva)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1082', '67', 'RA', 'Raplamaa (Rapla)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1083', '67', 'SA', 'Saaremaa (Kuessaare)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1084', '67', 'TA', 'Tartumaa (Tartu)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1085', '67', 'VA', 'Valgamaa (Valga)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1086', '67', 'VI', 'Viljandimaa (Viljandi)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1087', '67', 'VO', 'Vorumaa (Voru)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1088', '68', 'AF', 'Afar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1089', '68', 'AH', 'Amhara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1090', '68', 'BG', 'Benishangul-Gumaz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1091', '68', 'GB', 'Gambela');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1092', '68', 'HR', 'Hariai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1093', '68', 'OR', 'Oromia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1094', '68', 'SM', 'Somali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1095', '68', 'SN', 'Southern Nations - Nationalities');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1096', '68', 'TG', 'Tigray');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1097', '68', 'AA', 'Addis Ababa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1098', '68', 'DD', 'Dire Dawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1099', '70', 'T&Ucirc;R', 'T&ucirc;rshavnar Kommuna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1100', '70', 'KLA', 'Klaksv&iacute;k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1101', '70', 'RUN', 'Runav&iacute;k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1102', '70', 'TV&Oslash;', 'Tv&oslash;royri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1103', '70', 'FUG', 'Fuglafj&oslash;r&eth;ur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1104', '70', 'SUN', 'Sunda Kommuna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1105', '70', 'V&Aacute;G', 'V&aacute;gur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1106', '70', 'NES', 'Nes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1107', '70', 'VES', 'Vestmanna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1108', '70', 'MI&eth;', 'Mi&eth;v&aacute;gur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1109', '70', 'S&Oslash;R', 'S&oslash;rv&aacute;gur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1110', '70', 'G&Oslash;T', 'G&oslash;tu Kommuna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1111', '70', 'SJ&Ucirc;', 'Sj&ucirc;var Kommuna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1112', '70', 'LEI', 'Leirv&iacute;k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1113', '70', 'SAN', 'Sandav&aacute;gur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1114', '70', 'HVA', 'Hvalba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1115', '70', 'EI&eth;', 'Ei&eth;i');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1116', '70', 'KV&Iacute;', 'Kv&iacute;v&iacute;k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1117', '70', 'SAN', 'Sandur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1118', '70', 'SKO', 'Skopun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1119', '70', 'HVA', 'Hvannasund');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1120', '70', 'SUM', 'Sumba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1121', '70', 'VI&eth;', 'Vi&eth;arei&eth;i');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1122', '70', 'POR', 'Porkeri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1123', '70', 'SK&Aacute;', 'Sk&aacute;lav&iacute;k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1124', '70', 'KUN', 'Kunoy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1125', '70', 'H&Uacute;S', 'H&uacute;sav&iacute;k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1126', '70', 'HOV', 'Hov');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1127', '70', 'F&Aacute;M', 'F&aacute;mjin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1128', '70', 'FUN', 'Funningur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1129', '70', 'H&Uacute;S', 'H&uacute;sar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1130', '70', 'SK&Uacute;', 'Sk&uacute;voy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1131', '70', 'SV&Iacute;', 'Sv&iacute;noy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1132', '70', 'FUG', 'Fugloy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1133', '71', 'C', 'Central Division');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1134', '71', 'N', 'Northern Division');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1135', '71', 'E', 'Eastern Division');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1136', '71', 'W', 'Western Division');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1137', '71', 'R', 'Rotuma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1138', '72', 'AL', 'Ahvenanmaan Laani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1139', '72', 'ES', 'Etela-Suomen Laani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1140', '72', 'IS', 'Ita-Suomen Laani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1141', '72', 'LS', 'Lansi-Suomen Laani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1142', '72', 'LA', 'Lapin Lanani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1143', '72', 'OU', 'Oulun Laani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1144', '73', 'AL', 'Alsace');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1145', '73', 'AQ', 'Aquitaine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1146', '73', 'AU', 'Auvergne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1147', '73', 'BR', 'Brittany');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1148', '73', 'BU', 'Burgundy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1149', '73', 'CE', 'Center Loire Valley');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1150', '73', 'CH', 'Champagne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1151', '73', 'CO', 'Corse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1152', '73', 'FR', 'France Comte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1153', '73', 'LA', 'Languedoc Roussillon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1154', '73', 'LI', 'Limousin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1155', '73', 'LO', 'Lorraine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1156', '73', 'MI', 'Midi Pyrenees');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1157', '73', 'NO', 'Nord Pas de Calais');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1158', '73', 'NR', 'Normandy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1159', '73', 'PA', 'Paris / Ill de France');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1160', '73', 'PI', 'Picardie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1161', '73', 'PO', 'Poitou Charente');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1162', '73', 'PR', 'Provence');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1163', '73', 'RH', 'Rhone Alps');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1164', '73', 'RI', 'Riviera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1165', '73', 'WE', 'Western Loire Valley');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1166', '74', 'Et', 'Etranger');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1167', '74', '01', 'Ain');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1168', '74', '02', 'Aisne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1169', '74', '03', 'Allier');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1170', '74', '04', 'Alpes de Haute Provence');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1171', '74', '05', 'Hautes-Alpes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1172', '74', '06', 'Alpes Maritimes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1173', '74', '07', 'Ard&egrave;che');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1174', '74', '08', 'Ardennes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1175', '74', '09', 'Ari&egrave;ge');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1176', '74', '10', 'Aube');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1177', '74', '11', 'Aude');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1178', '74', '12', 'Aveyron');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1179', '74', '13', 'Bouches du Rh&ocirc;ne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1180', '74', '14', 'Calvados');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1181', '74', '15', 'Cantal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1182', '74', '16', 'Charente');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1183', '74', '17', 'Charente Maritime');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1184', '74', '18', 'Cher');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1185', '74', '19', 'Corr&egrave;ze');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1186', '74', '2A', 'Corse du Sud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1187', '74', '2B', 'Haute Corse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1188', '74', '21', 'C&ocirc;te d\'or');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1189', '74', '22', 'C&ocirc;tes d\'Armor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1190', '74', '23', 'Creuse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1191', '74', '24', 'Dordogne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1192', '74', '25', 'Doubs');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1193', '74', '26', 'Dr&ocirc;me');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1194', '74', '27', 'Eure');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1195', '74', '28', 'Eure et Loir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1196', '74', '29', 'Finist&egrave;re');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1197', '74', '30', 'Gard');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1198', '74', '31', 'Haute Garonne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1199', '74', '32', 'Gers');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1200', '74', '33', 'Gironde');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1201', '74', '34', 'H&eacute;rault');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1202', '74', '35', 'Ille et Vilaine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1203', '74', '36', 'Indre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1204', '74', '37', 'Indre et Loire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1205', '74', '38', 'Is&eacute;re');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1206', '74', '39', 'Jura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1207', '74', '40', 'Landes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1208', '74', '41', 'Loir et Cher');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1209', '74', '42', 'Loire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1210', '74', '43', 'Haute Loire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1211', '74', '44', 'Loire Atlantique');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1212', '74', '45', 'Loiret');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1213', '74', '46', 'Lot');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1214', '74', '47', 'Lot et Garonne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1215', '74', '48', 'Loz&egrave;re');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1216', '74', '49', 'Maine et Loire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1217', '74', '50', 'Manche');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1218', '74', '51', 'Marne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1219', '74', '52', 'Haute Marne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1220', '74', '53', 'Mayenne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1221', '74', '54', 'Meurthe et Moselle');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1222', '74', '55', 'Meuse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1223', '74', '56', 'Morbihan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1224', '74', '57', 'Moselle');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1225', '74', '58', 'Ni&egrave;vre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1226', '74', '59', 'Nord');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1227', '74', '60', 'Oise');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1228', '74', '61', 'Orne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1229', '74', '62', 'Pas de Calais');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1230', '74', '63', 'Puy de D&ocirc;me');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1231', '74', '64', 'Pyr&eacute;n&eacute;es Atlantiqu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1232', '74', '65', 'Hautes Pyr&eacute;n&eacute;es');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1233', '74', '66', 'Pyr&eacute;n&eacute;es Orientale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1234', '74', '67', 'Bas Rhin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1235', '74', '68', 'Haut Rhin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1236', '74', '69', 'Rh&ocirc;ne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1237', '74', '70', 'Haute Sa&ocirc;ne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1238', '74', '71', 'Sa&ocirc;ne et Loire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1239', '74', '72', 'Sarthe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1240', '74', '73', 'Savoie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1241', '74', '74', 'Haute Savoie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1242', '74', '75', 'Paris');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1243', '74', '76', 'Seine Maritime');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1244', '74', '77', 'Seine et Marne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1245', '74', '78', 'Yvelines');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1246', '74', '79', 'Deux S&egrave;vres');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1247', '74', '80', 'Somme');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1248', '74', '81', 'Tarn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1249', '74', '82', 'Tarn et Garonne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1250', '74', '83', 'Var');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1251', '74', '84', 'Vaucluse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1252', '74', '85', 'Vend&eacute;e');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1253', '74', '86', 'Vienne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1254', '74', '87', 'Haute Vienne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1255', '74', '88', 'Vosges');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1256', '74', '89', 'Yonne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1257', '74', '90', 'Territoire de Belfort');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1258', '74', '91', 'Essonne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1259', '74', '92', 'Hauts de Seine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1260', '74', '93', 'Seine St-Denis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1261', '74', '94', 'Val de Marne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1262', '74', '95', 'Val d\'Oise');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1263', '75', 'AWA', 'Awala-Yalimapo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1264', '75', 'MAN', 'Mana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1265', '75', 'SAI', 'Saint-Laurent-Du-Maroni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1266', '75', 'APA', 'Apatou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1267', '75', 'GRA', 'Grand-Santi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1268', '75', 'PAP', 'Papa&iuml;chton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1269', '75', 'SAÜ', 'Saül');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1270', '75', 'MAR', 'Maripasoula');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1271', '75', 'CAM', 'Camopi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1272', '75', 'SAI', 'Saint-Georges');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1273', '75', 'OUA', 'Ouanary');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1274', '75', 'R&Eacute;G', 'R&eacute;gina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1275', '75', 'ROU', 'Roura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1276', '75', 'SAI', 'Saint-&Eacute;lie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1277', '75', 'IRA', 'Iracoubo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1278', '75', 'SIN', 'Sinnamary');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1279', '75', 'KOU', 'Kourou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1280', '75', 'MAC', 'Macouria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1281', '75', 'MON', 'Montsin&eacute;ry-Tonnegrande');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1282', '75', 'MAT', 'Matoury');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1283', '75', 'CAY', 'Cayenne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1284', '75', 'REM', 'Remire-Montjoly');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1285', '76', 'M', 'Archipel des Marquises');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1286', '76', 'T', 'Archipel des Tuamotu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1287', '76', 'I', 'Archipel des Tubuai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1288', '76', 'V', 'Iles du Vent');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1289', '76', 'S', 'Iles Sous-le-Vent');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1290', '77', 'C', 'Iles Crozet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1291', '77', 'K', 'Iles Kerguelen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1292', '77', 'A', 'Ile Amsterdam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1293', '77', 'P', 'Ile Saint-Paul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1294', '77', 'D', 'Adelie Land');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1295', '78', 'ES', 'Estuaire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1296', '78', 'HO', 'Haut-Ogooue');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1297', '78', 'MO', 'Moyen-Ogooue');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1298', '78', 'NG', 'Ngounie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1299', '78', 'NY', 'Nyanga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1300', '78', 'OI', 'Ogooue-Ivindo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1301', '78', 'OL', 'Ogooue-Lolo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1302', '78', 'OM', 'Ogooue-Maritime');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1303', '78', 'WN', 'Woleu-Ntem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1304', '79', 'BJ', 'Banjul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1305', '79', 'BS', 'Basse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1306', '79', 'BR', 'Brikama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1307', '79', 'JA', 'Janjangbure');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1308', '79', 'KA', 'Kanifeng');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1309', '79', 'KE', 'Kerewan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1310', '79', 'KU', 'Kuntaur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1311', '79', 'MA', 'Mansakonko');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1312', '79', 'LR', 'Lower River');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1313', '79', 'CR', 'Central River');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1314', '79', 'NB', 'North Bank');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1315', '79', 'UR', 'Upper River');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1316', '79', 'WE', 'Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1317', '80', 'AB', 'Abkhazia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1318', '80', 'AJ', 'Ajaria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1319', '80', 'TB', 'Tbilisi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1320', '80', 'GU', 'Guria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1321', '80', 'IM', 'Imereti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1322', '80', 'KA', 'Kakheti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1323', '80', 'KK', 'Kvemo Kartli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1324', '80', 'MM', 'Mtskheta-Mtianeti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1325', '80', 'RL', 'Racha Lechkhumi and Kvemo Svanet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1326', '80', 'SZ', 'Samegrelo-Zemo Svaneti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1327', '80', 'SJ', 'Samtskhe-Javakheti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1328', '80', 'SK', 'Shida Kartli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1329', '81', 'BAW', 'Baden-Württemberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1330', '81', 'BAY', 'Bayern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1331', '81', 'BER', 'Berlin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1332', '81', 'BRG', 'Brandenburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1333', '81', 'BRE', 'Bremen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1334', '81', 'HAM', 'Hamburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1335', '81', 'HES', 'Hessen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1336', '81', 'MEC', 'Mecklenburg-Vorpommern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1337', '81', 'NDS', 'Niedersachsen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1338', '81', 'NRW', 'Nordrhein-Westfalen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1339', '81', 'RHE', 'Rheinland-Pfalz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1340', '81', 'SAR', 'Saarland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1341', '81', 'SAS', 'Sachsen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1342', '81', 'SAC', 'Sachsen-Anhalt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1343', '81', 'SCN', 'Schleswig-Holstein');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1344', '81', 'THE', 'Th&uuml;ringen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1345', '82', 'AS', 'Ashanti Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1346', '82', 'BA', 'Brong-Ahafo Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1347', '82', 'CE', 'Central Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1348', '82', 'EA', 'Eastern Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1349', '82', 'GA', 'Greater Accra Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1350', '82', 'NO', 'Northern Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1351', '82', 'UE', 'Upper East Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1352', '82', 'UW', 'Upper West Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1353', '82', 'VO', 'Volta Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1354', '82', 'WE', 'Western Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1355', '83', 'EAS', 'East Side');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1356', '83', 'NOR', 'North District');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1357', '83', 'REC', 'Reclamation Areas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1358', '83', 'SAN', 'Sandpits Area');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1359', '83', 'SOU', 'South District');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1360', '83', 'TOW', 'Town Area');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1361', '83', 'UPP', 'Upper Town');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1362', '83', 'OTH', 'Other');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1363', '84', 'AT', 'Attica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1364', '84', 'CN', 'Central Greece');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1365', '84', 'CM', 'Central Macedonia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1366', '84', 'CR', 'Crete');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1367', '84', 'EM', 'East Macedonia and Thrace');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1368', '84', 'EP', 'Epirus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1369', '84', 'II', 'Ionian Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1370', '84', 'NA', 'North Aegean');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1371', '84', 'PP', 'Peloponnesos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1372', '84', 'SA', 'South Aegean');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1373', '84', 'TH', 'Thessaly');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1374', '84', 'WG', 'West Greece');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1375', '84', 'WM', 'West Macedonia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1376', '85', 'A', 'Avannaa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1377', '85', 'T', 'Tunu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1378', '85', 'K', 'Kitaa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1379', '86', 'A', 'Saint Andrew');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1380', '86', 'D', 'Saint David');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1381', '86', 'G', 'Saint George');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1382', '86', 'J', 'Saint John');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1383', '86', 'M', 'Saint Mark');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1384', '86', 'P', 'Saint Patrick');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1385', '86', 'C', 'Carriacou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1386', '86', 'Q', 'Petit Martinique');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1387', '87', 'ARR', 'Arrondissements Of The Guadeloup');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1388', '87', 'CAN', 'Cantons Of The Guadeloupe Depart');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1389', '87', 'COM', 'Communes Of The Guadeloupe Depar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1390', '88', 'AGA', 'Agana Heights');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1391', '88', 'AGA', 'Agat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1392', '88', 'ASA', 'Asan Maina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1393', '88', 'BAR', 'Barrigada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1394', '88', 'CHA', 'Chalan Pago Ordot');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1395', '88', 'DED', 'Dededo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1396', '88', 'HAG', 'Hag&aring;t&ntilde;a');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1397', '88', 'INA', 'Inarajan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1398', '88', 'MAN', 'Mangilao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1399', '88', 'MER', 'Merizo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1400', '88', 'MON', 'Mongmong Toto Maite');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1401', '88', 'PIT', 'Piti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1402', '88', 'SAN', 'Santa Rita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1403', '88', 'SIN', 'Sinajana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1404', '88', 'TAL', 'Talofofo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1405', '88', 'TAM', 'Tamuning');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1406', '88', 'UMA', 'Umatac');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1407', '88', 'YIG', 'Yigo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1408', '88', 'YON', 'Yona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1409', '89', 'AV', 'Alta Verapaz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1410', '89', 'BV', 'Baja Verapaz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1411', '89', 'CM', 'Chimaltenango');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1412', '89', 'CQ', 'Chiquimula');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1413', '89', 'PE', 'El Peten');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1414', '89', 'PR', 'El Progreso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1415', '89', 'QC', 'El Quiche');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1416', '89', 'ES', 'Escuintla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1417', '89', 'GU', 'Guatemala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1418', '89', 'HU', 'Huehuetenango');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1419', '89', 'IZ', 'Izabal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1420', '89', 'JA', 'Jalapa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1421', '89', 'JU', 'Jutiapa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1422', '89', 'QZ', 'Quetzaltenango');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1423', '89', 'RE', 'Retalhuleu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1424', '89', 'ST', 'Sacatepequez');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1425', '89', 'SM', 'San Marcos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1426', '89', 'SR', 'Santa Rosa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1427', '89', 'SO', 'Solola');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1428', '89', 'SU', 'Suchitepequez');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1429', '89', 'TO', 'Totonicapan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1430', '89', 'ZA', 'Zacapa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1431', '90', 'CNK', 'Conakry');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1432', '90', 'BYL', 'Beyla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1433', '90', 'BFA', 'Boffa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1434', '90', 'BOK', 'Boke');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1435', '90', 'COY', 'Coyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1436', '90', 'DBL', 'Dabola');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1437', '90', 'DLB', 'Dalaba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1438', '90', 'DGR', 'Dinguiraye');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1439', '90', 'DBR', 'Dubreka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1440', '90', 'FRN', 'Faranah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1441', '90', 'FRC', 'Forecariah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1442', '90', 'FRI', 'Fria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1443', '90', 'GAO', 'Gaoual');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1444', '90', 'GCD', 'Gueckedou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1445', '90', 'KNK', 'Kankan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1446', '90', 'KRN', 'Kerouane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1447', '90', 'KND', 'Kindia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1448', '90', 'KSD', 'Kissidougou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1449', '90', 'KBA', 'Koubia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1450', '90', 'KDA', 'Koundara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1451', '90', 'KRA', 'Kouroussa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1452', '90', 'LAB', 'Labe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1453', '90', 'LLM', 'Lelouma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1454', '90', 'LOL', 'Lola');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1455', '90', 'MCT', 'Macenta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1456', '90', 'MAL', 'Mali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1457', '90', 'MAM', 'Mamou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1458', '90', 'MAN', 'Mandiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1459', '90', 'NZR', 'Nzerekore');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1460', '90', 'PIT', 'Pita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1461', '90', 'SIG', 'Siguiri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1462', '90', 'TLM', 'Telimele');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1463', '90', 'TOG', 'Tougue');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1464', '90', 'YOM', 'Yomou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1465', '91', 'BF', 'Bafata Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1466', '91', 'BB', 'Biombo Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1467', '91', 'BS', 'Bissau Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1468', '91', 'BL', 'Bolama Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1469', '91', 'CA', 'Cacheu Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1470', '91', 'GA', 'Gabu Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1471', '91', 'OI', 'Oio Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1472', '91', 'QU', 'Quinara Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1473', '91', 'TO', 'Tombali Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1474', '92', 'BW', 'Barima-Waini');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1475', '92', 'CM', 'Cuyuni-Mazaruni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1476', '92', 'DM', 'Demerara-Mahaica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1477', '92', 'EC', 'East Berbice-Corentyne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1478', '92', 'EW', 'Essequibo Islands-West Demerara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1479', '92', 'MB', 'Mahaica-Berbice');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1480', '92', 'PM', 'Pomeroon-Supenaam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1481', '92', 'PI', 'Potaro-Siparuni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1482', '92', 'UD', 'Upper Demerara-Berbice');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1483', '92', 'UT', 'Upper Takutu-Upper Essequibo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1484', '93', 'AR', 'Artibonite');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1485', '93', 'CE', 'Centre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1486', '93', 'GA', 'Grand\'Anse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1487', '93', 'ND', 'Nord');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1488', '93', 'NE', 'Nord-Est');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1489', '93', 'NO', 'Nord-Ouest');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1490', '93', 'OU', 'Ouest');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1491', '93', 'SD', 'Sud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1492', '93', 'SE', 'Sud-Est');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1493', '94', 'F', 'Flat Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1494', '94', 'M', 'McDonald Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1495', '94', 'S', 'Shag Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1496', '94', 'H', 'Heard Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1497', '95', 'AT', 'Atlantida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1498', '95', 'CH', 'Choluteca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1499', '95', 'CL', 'Colon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1500', '95', 'CM', 'Comayagua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1501', '95', 'CP', 'Copan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1502', '95', 'CR', 'Cortes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1503', '95', 'PA', 'El Paraiso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1504', '95', 'FM', 'Francisco Morazan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1505', '95', 'GD', 'Gracias a Dios');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1506', '95', 'IN', 'Intibuca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1507', '95', 'IB', 'Islas de la Bahia (Bay Islands)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1508', '95', 'PZ', 'La Paz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1509', '95', 'LE', 'Lempira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1510', '95', 'OC', 'Ocotepeque');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1511', '95', 'OL', 'Olancho');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1512', '95', 'SB', 'Santa Barbara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1513', '95', 'VA', 'Valle');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1514', '95', 'YO', 'Yoro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1515', '96', 'HCW', 'Central and Western Hong Kong Is');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1516', '96', 'HEA', 'Eastern Hong Kong Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1517', '96', 'HSO', 'Southern Hong Kong Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1518', '96', 'HWC', 'Wan Chai Hong Kong Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1519', '96', 'KKC', 'Kowloon City Kowloon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1520', '96', 'KKT', 'Kwun Tong Kowloon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1521', '96', 'KSS', 'Sham Shui Po Kowloon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1522', '96', 'KWT', 'Wong Tai Sin Kowloon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1523', '96', 'KYT', 'Yau Tsim Mong Kowloon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1524', '96', 'NIS', 'Islands New Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1525', '96', 'NKT', 'Kwai Tsing New Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1526', '96', 'NNO', 'North New Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1527', '96', 'NSK', 'Sai Kung New Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1528', '96', 'NST', 'Sha Tin New Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1529', '96', 'NTP', 'Tai Po New Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1530', '96', 'NTW', 'Tsuen Wan New Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1531', '96', 'NTM', 'Tuen Mun New Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1532', '96', 'NYL', 'Yuen Long New Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1533', '97', 'BK', 'Bacs-Kiskun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1534', '97', 'BA', 'Baranya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1535', '97', 'BE', 'Bekes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1536', '97', 'BS', 'Bekescsaba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1537', '97', 'BZ', 'Borsod-Abauj-Zemplen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1538', '97', 'BU', 'Budapest');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1539', '97', 'CS', 'Csongrad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1540', '97', 'DE', 'Debrecen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1541', '97', 'DU', 'Dunaujvaros');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1542', '97', 'EG', 'Eger');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1543', '97', 'FE', 'Fejer');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1544', '97', 'GY', 'Gyor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1545', '97', 'GM', 'Gyor-Moson-Sopron');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1546', '97', 'HB', 'Hajdu-Bihar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1547', '97', 'HE', 'Heves');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1548', '97', 'HO', 'Hodmezovasarhely');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1549', '97', 'JN', 'Jasz-Nagykun-Szolnok');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1550', '97', 'KA', 'Kaposvar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1551', '97', 'KE', 'Kecskemet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1552', '97', 'KO', 'Komarom-Esztergom');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1553', '97', 'MI', 'Miskolc');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1554', '97', 'NA', 'Nagykanizsa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1555', '97', 'NO', 'Nograd');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1556', '97', 'NY', 'Nyiregyhaza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1557', '97', 'PE', 'Pecs');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1558', '97', 'PS', 'Pest');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1559', '97', 'SO', 'Somogy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1560', '97', 'SP', 'Sopron');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1561', '97', 'SS', 'Szabolcs-Szatmar-Bereg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1562', '97', 'SZ', 'Szeged');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1563', '97', 'SE', 'Szekesfehervar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1564', '97', 'SL', 'Szolnok');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1565', '97', 'SM', 'Szombathely');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1566', '97', 'TA', 'Tatabanya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1567', '97', 'TO', 'Tolna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1568', '97', 'VA', 'Vas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1569', '97', 'VE', 'Veszprem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1570', '97', 'ZA', 'Zala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1571', '97', 'ZZ', 'Zalaegerszeg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1572', '98', 'AL', 'Austurland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1573', '98', 'HF', 'Hofuoborgarsvaeoi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1574', '98', 'NE', 'Norourland eystra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1575', '98', 'NV', 'Norourland vestra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1576', '98', 'SL', 'Suourland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1577', '98', 'SN', 'Suournes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1578', '98', 'VF', 'Vestfiroir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1579', '98', 'VL', 'Vesturland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1580', '99', 'AN', 'Andaman and Nicobar Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1581', '99', 'AP', 'Andhra Pradesh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1582', '99', 'AR', 'Arunachal Pradesh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1583', '99', 'AS', 'Assam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1584', '99', 'BI', 'Bihar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1585', '99', 'CH', 'Chandigarh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1586', '99', 'DA', 'Dadra and Nagar Haveli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1587', '99', 'DM', 'Daman and Diu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1588', '99', 'DE', 'Delhi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1589', '99', 'GO', 'Goa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1590', '99', 'GU', 'Gujarat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1591', '99', 'HA', 'Haryana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1592', '99', 'HP', 'Himachal Pradesh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1593', '99', 'JA', 'Jammu and Kashmir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1594', '99', 'KA', 'Karnataka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1595', '99', 'KE', 'Kerala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1596', '99', 'LI', 'Lakshadweep Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1597', '99', 'MP', 'Madhya Pradesh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1598', '99', 'MA', 'Maharashtra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1599', '99', 'MN', 'Manipur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1600', '99', 'ME', 'Meghalaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1601', '99', 'MI', 'Mizoram');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1602', '99', 'NA', 'Nagaland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1603', '99', 'OR', 'Orissa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1604', '99', 'PO', 'Pondicherry');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1605', '99', 'PU', 'Punjab');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1606', '99', 'RA', 'Rajasthan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1607', '99', 'SI', 'Sikkim');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1608', '99', 'TN', 'Tamil Nadu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1609', '99', 'TR', 'Tripura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1610', '99', 'UP', 'Uttar Pradesh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1611', '99', 'WB', 'West Bengal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1612', '100', 'DA', 'Daista Aceh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1613', '100', 'SU', 'Sumatera Utara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1614', '100', 'SB', 'Sumatera Barat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1615', '100', 'SI', 'Riau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1616', '100', 'JA', 'Jambi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1617', '100', 'SS', 'Sumatera Selatan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1618', '100', 'BE', 'Bengkulu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1619', '100', 'LA', 'Lampung');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1620', '100', 'JK', 'Dki Jakarta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1621', '100', 'JB', 'Jawa Barat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1622', '100', 'JT', 'Jawa Tengah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1623', '100', 'DY', 'Daista Yogyakarta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1624', '100', 'JT', 'Jawa Timur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1625', '100', 'KB', 'Kalimantan Barat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1626', '100', 'KT', 'Kalimantan Tengah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1627', '100', 'KI', 'Kalimantan Timur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1628', '100', 'KS', 'Kalimantan Selatan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1629', '100', 'BA', 'Bali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1630', '100', 'NB', 'Nusa Tenggara Barat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1631', '100', 'NT', 'Nusa Tenggara Timur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1632', '100', 'SN', 'Sulawesi Selatan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1633', '100', 'ST', 'Sulawesi Tengah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1634', '100', 'SA', 'Sulawesi Utara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1635', '100', 'SG', 'Sulawesi Tenggara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1636', '100', 'MA', 'Maluku');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1637', '100', 'MU', 'Maluku Utara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1638', '100', 'IJ', 'Irian Jaya Timur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1639', '100', 'IT', 'Irian Jaya Tengah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1640', '100', 'IB', 'Irian Jawa Barat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1641', '100', 'BT', 'Banten');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1642', '100', 'BB', 'Bangka Belitung');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1643', '100', 'GO', 'Gorontalo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1644', '101', 'TEH', 'Tehran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1645', '101', 'QOM', 'Qom');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1646', '101', 'MKZ', 'Markazi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1647', '101', 'QAZ', 'Qazvin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1648', '101', 'GIL', 'Gilan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1649', '101', 'ARD', 'Ardabil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1650', '101', 'ZAN', 'Zanjan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1651', '101', 'EAZ', 'East Azarbaijan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1652', '101', 'WEZ', 'West Azarbaijan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1653', '101', 'KRD', 'Kurdistan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1654', '101', 'HMD', 'Hamadan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1655', '101', 'KRM', 'Kermanshah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1656', '101', 'ILM', 'Ilam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1657', '101', 'LRS', 'Lorestan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1658', '101', 'KZT', 'Khuzestan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1659', '101', 'CMB', 'Chahar Mahaal and Bakhtiari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1660', '101', 'KBA', 'Kohkiluyeh and Buyer Ahmad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1661', '101', 'BSH', 'Bushehr');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1662', '101', 'FAR', 'Fars');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1663', '101', 'HRM', 'Hormozgan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1664', '101', 'SBL', 'Sistan and Baluchistan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1665', '101', 'KRB', 'Kerman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1666', '101', 'YZD', 'Yazd');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1667', '101', 'EFH', 'Esfahan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1668', '101', 'SMN', 'Semnan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1669', '101', 'MZD', 'Mazandaran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1670', '101', 'GLS', 'Golestan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1671', '101', 'NKH', 'North Khorasan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1672', '101', 'RKH', 'Razavi Khorasan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1673', '101', 'SKH', 'South Khorasan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1674', '102', 'BD', 'Baghdad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1675', '102', 'SD', 'Salah ad Din');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1676', '102', 'DY', 'Diyala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1677', '102', 'WS', 'Wasit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1678', '102', 'MY', 'Maysan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1679', '102', 'BA', 'Al Basrah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1680', '102', 'DQ', 'Dhi Qar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1681', '102', 'MU', 'Al Muthanna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1682', '102', 'QA', 'Al Qadisyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1683', '102', 'BB', 'Babil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1684', '102', 'KB', 'Al Karbala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1685', '102', 'NJ', 'An Najaf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1686', '102', 'AB', 'Al Anbar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1687', '102', 'NN', 'Ninawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1688', '102', 'DH', 'Dahuk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1689', '102', 'AL', 'Arbil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1690', '102', 'TM', 'At Ta\'mim');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1691', '102', 'SL', 'As Sulaymaniyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1692', '103', 'CA', 'Carlow');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1693', '103', 'CV', 'Cavan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1694', '103', 'CL', 'Clare');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1695', '103', 'CO', 'Cork');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1696', '103', 'DO', 'Donegal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1697', '103', 'DU', 'Dublin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1698', '103', 'GA', 'Galway');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1699', '103', 'KE', 'Kerry');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1700', '103', 'KI', 'Kildare');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1701', '103', 'KL', 'Kilkenny');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1702', '103', 'LA', 'Laois');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1703', '103', 'LE', 'Leitrim');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1704', '103', 'LI', 'Limerick');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1705', '103', 'LO', 'Longford');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1706', '103', 'LU', 'Louth');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1707', '103', 'MA', 'Mayo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1708', '103', 'ME', 'Meath');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1709', '103', 'MO', 'Monaghan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1710', '103', 'OF', 'Offaly');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1711', '103', 'RO', 'Roscommon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1712', '103', 'SL', 'Sligo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1713', '103', 'TI', 'Tipperary');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1714', '103', 'WA', 'Waterford');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1715', '103', 'WE', 'Westmeath');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1716', '103', 'WX', 'Wexford');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1717', '103', 'WI', 'Wicklow');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1718', '104', 'BS', 'Be\'er Sheva');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1719', '104', 'BH', 'Bika\'at Hayarden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1720', '104', 'EA', 'Eilat and Arava');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1721', '104', 'GA', 'Galil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1722', '104', 'HA', 'Haifa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1723', '104', 'JM', 'Jehuda Mountains');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1724', '104', 'JE', 'Jerusalem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1725', '104', 'NE', 'Negev');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1726', '104', 'SE', 'Semaria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1727', '104', 'SH', 'Sharon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1728', '104', 'TA', 'Tel Aviv (Gosh Dan)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1729', '105', 'AG', 'Agrigento');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1730', '105', 'AL', 'Alessandria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1731', '105', 'AN', 'Ancona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1732', '105', 'AO', 'Aosta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1733', '105', 'AR', 'Arezzo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1734', '105', 'AP', 'Ascoli Piceno');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1735', '105', 'AT', 'Asti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1736', '105', 'AV', 'Avellino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1737', '105', 'BA', 'Bari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1738', '105', 'BL', 'Belluno');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1739', '105', 'BN', 'Benevento');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1740', '105', 'BG', 'Bergamo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1741', '105', 'BI', 'Biella');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1742', '105', 'BO', 'Bologna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1743', '105', 'BZ', 'Bolzano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1744', '105', 'BS', 'Brescia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1745', '105', 'BR', 'Brindisi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1746', '105', 'CA', 'Cagliari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1747', '105', 'CL', 'Caltanissetta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1748', '105', 'CB', 'Campobasso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1749', '105', 'CE', 'Caserta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1750', '105', 'CT', 'Catania');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1751', '105', 'CZ', 'Catanzaro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1752', '105', 'CH', 'Chieti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1753', '105', 'CO', 'Como');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1754', '105', 'CS', 'Cosenza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1755', '105', 'CR', 'Cremona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1756', '105', 'KR', 'Crotone');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1757', '105', 'CN', 'Cuneo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1758', '105', 'EN', 'Enna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1759', '105', 'FE', 'Ferrara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1760', '105', 'FI', 'Firenze');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1761', '105', 'FG', 'Foggia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1762', '105', 'FO', 'Forlì');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1763', '105', 'FR', 'Frosinone');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1764', '105', 'GE', 'Genova');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1765', '105', 'GO', 'Gorizia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1766', '105', 'GR', 'Grosseto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1767', '105', 'IM', 'Imperia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1768', '105', 'IS', 'Isernia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1769', '105', 'AQ', 'Aquila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1770', '105', 'SP', 'La Spezia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1771', '105', 'LT', 'Latina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1772', '105', 'LE', 'Lecce');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1773', '105', 'LC', 'Lecco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1774', '105', 'LI', 'Livorno');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1775', '105', 'LO', 'Lodi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1776', '105', 'LU', 'Lucca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1777', '105', 'MC', 'Macerata');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1778', '105', 'MN', 'Mantova');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1779', '105', 'MS', 'Massa-Carrara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1780', '105', 'MT', 'Matera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1781', '105', 'ME', 'Messina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1782', '105', 'MI', 'Milano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1783', '105', 'MO', 'Modena');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1784', '105', 'NA', 'Napoli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1785', '105', 'NO', 'Novara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1786', '105', 'NU', 'Nuoro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1787', '105', 'OR', 'Oristano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1788', '105', 'PD', 'Padova');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1789', '105', 'PA', 'Palermo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1790', '105', 'PR', 'Parma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1791', '105', 'PG', 'Perugia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1792', '105', 'PV', 'Pavia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1793', '105', 'PU', 'Pesaro Urbino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1794', '105', 'PE', 'Pescara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1795', '105', 'PC', 'Piacenza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1796', '105', 'PI', 'Pisa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1797', '105', 'PT', 'Pistoia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1798', '105', 'PN', 'Pordenone');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1799', '105', 'PZ', 'Potenza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1800', '105', 'PO', 'Prato');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1801', '105', 'RG', 'Ragusa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1802', '105', 'RA', 'Ravenna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1803', '105', 'RC', 'Reggio Calabria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1804', '105', 'RE', 'Reggio Emilia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1805', '105', 'RI', 'Rieti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1806', '105', 'RN', 'Rimini');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1807', '105', 'RM', 'Roma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1808', '105', 'RO', 'Rovigo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1809', '105', 'SA', 'Salerno');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1810', '105', 'SS', 'Sassari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1811', '105', 'SV', 'Savona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1812', '105', 'SI', 'Siena');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1813', '105', 'SR', 'Siracusa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1814', '105', 'SO', 'Sondrio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1815', '105', 'TA', 'Taranto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1816', '105', 'TE', 'Teramo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1817', '105', 'TR', 'Terni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1818', '105', 'TO', 'Torino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1819', '105', 'TP', 'Trapani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1820', '105', 'TN', 'Trento');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1821', '105', 'TV', 'Treviso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1822', '105', 'TS', 'Trieste');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1823', '105', 'UD', 'Udine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1824', '105', 'VA', 'Varese');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1825', '105', 'VE', 'Venezia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1826', '105', 'VB', 'Verbania');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1827', '105', 'VC', 'Vercelli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1828', '105', 'VR', 'Verona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1829', '105', 'VV', 'Vibo Valentia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1830', '105', 'VI', 'Vicenza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1831', '105', 'VT', 'Viterbo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1832', '105', 'CI', 'Carbonia-Iglesias');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1833', '105', 'VS', 'Medio Campidano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1834', '105', 'OG', 'Ogliastra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1835', '105', 'OT', 'Olbia-Tempio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1836', '105', 'MB', 'Monza e Brianza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1837', '105', 'FM', 'Fermo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1838', '105', 'BT', 'Barletta-Andria-Trani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1839', '106', 'CLA', 'Clarendon Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1840', '106', 'HAN', 'Hanover Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1841', '106', 'KIN', 'Kingston Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1842', '106', 'MAN', 'Manchester Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1843', '106', 'POR', 'Portland Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1844', '106', 'AND', 'Saint Andrew Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1845', '106', 'ANN', 'Saint Ann Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1846', '106', 'CAT', 'Saint Catherine Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1847', '106', 'ELI', 'Saint Elizabeth Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1848', '106', 'JAM', 'Saint James Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1849', '106', 'MAR', 'Saint Mary Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1850', '106', 'THO', 'Saint Thomas Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1851', '106', 'TRL', 'Trelawny Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1852', '106', 'WML', 'Westmoreland Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1853', '107', 'AI', 'Aichi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1854', '107', 'AK', 'Akita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1855', '107', 'AO', 'Aomori');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1856', '107', 'CH', 'Chiba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1857', '107', 'EH', 'Ehime');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1858', '107', 'FK', 'Fukui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1859', '107', 'FU', 'Fukuoka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1860', '107', 'FS', 'Fukushima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1861', '107', 'GI', 'Gifu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1862', '107', 'GU', 'Gumma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1863', '107', 'HI', 'Hiroshima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1864', '107', 'HO', 'Hokkaido');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1865', '107', 'HY', 'Hyogo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1866', '107', 'IB', 'Ibaraki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1867', '107', 'IS', 'Ishikawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1868', '107', 'IW', 'Iwate');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1869', '107', 'KA', 'Kagawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1870', '107', 'KG', 'Kagoshima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1871', '107', 'KN', 'Kanagawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1872', '107', 'KO', 'Kochi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1873', '107', 'KU', 'Kumamoto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1874', '107', 'KY', 'Kyoto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1875', '107', 'MI', 'Mie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1876', '107', 'MY', 'Miyagi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1877', '107', 'MZ', 'Miyazaki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1878', '107', 'NA', 'Nagano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1879', '107', 'NG', 'Nagasaki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1880', '107', 'NR', 'Nara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1881', '107', 'NI', 'Niigata');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1882', '107', 'OI', 'Oita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1883', '107', 'OK', 'Okayama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1884', '107', 'ON', 'Okinawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1885', '107', 'OS', 'Osaka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1886', '107', 'SA', 'Saga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1887', '107', 'SI', 'Saitama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1888', '107', 'SH', 'Shiga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1889', '107', 'SM', 'Shimane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1890', '107', 'SZ', 'Shizuoka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1891', '107', 'TO', 'Tochigi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1892', '107', 'TS', 'Tokushima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1893', '107', 'TK', 'Tokyo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1894', '107', 'TT', 'Tottori');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1895', '107', 'TY', 'Toyama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1896', '107', 'WA', 'Wakayama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1897', '107', 'YA', 'Yamagata');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1898', '107', 'YM', 'Yamaguchi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1899', '107', 'YN', 'Yamanashi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1900', '108', 'AM', '\'Amman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1901', '108', 'AJ', 'Ajlun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1902', '108', 'AA', 'Al \'Aqabah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1903', '108', 'AB', 'Al Balqa\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1904', '108', 'AK', 'Al Karak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1905', '108', 'AL', 'Al Mafraq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1906', '108', 'AT', 'At Tafilah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1907', '108', 'AZ', 'Az Zarqa\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1908', '108', 'IR', 'Irbid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1909', '108', 'JA', 'Jarash');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1910', '108', 'MA', 'Ma\'an');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1911', '108', 'MD', 'Madaba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1912', '109', 'AL', 'Almaty');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1913', '109', 'AC', 'Almaty City');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1914', '109', 'AM', 'Aqmola');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1915', '109', 'AQ', 'Aqtobe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1916', '109', 'AS', 'Astana City');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1917', '109', 'AT', 'Atyrau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1918', '109', 'BA', 'Batys Qazaqstan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1919', '109', 'BY', 'Bayqongyr City');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1920', '109', 'MA', 'Mangghystau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1921', '109', 'ON', 'Ongtustik Qazaqstan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1922', '109', 'PA', 'Pavlodar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1923', '109', 'QA', 'Qaraghandy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1924', '109', 'QO', 'Qostanay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1925', '109', 'QY', 'Qyzylorda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1926', '109', 'SH', 'Shyghys Qazaqstan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1927', '109', 'SO', 'Soltustik Qazaqstan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1928', '109', 'ZH', 'Zhambyl');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1929', '110', 'CE', 'Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1930', '110', 'CO', 'Coast');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1931', '110', 'EA', 'Eastern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1932', '110', 'NA', 'Nairobi Area');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1933', '110', 'NE', 'North Eastern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1934', '110', 'NY', 'Nyanza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1935', '110', 'RV', 'Rift Valley');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1936', '110', 'WE', 'Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1937', '111', 'AG', 'Abaiang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1938', '111', 'AM', 'Abemama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1939', '111', 'AK', 'Aranuka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1940', '111', 'AO', 'Arorae');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1941', '111', 'BA', 'Banaba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1942', '111', 'BE', 'Beru');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1943', '111', 'bT', 'Butaritari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1944', '111', 'KA', 'Kanton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1945', '111', 'KR', 'Kiritimati');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1946', '111', 'KU', 'Kuria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1947', '111', 'MI', 'Maiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1948', '111', 'MN', 'Makin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1949', '111', 'ME', 'Marakei');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1950', '111', 'NI', 'Nikunau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1951', '111', 'NO', 'Nonouti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1952', '111', 'ON', 'Onotoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1953', '111', 'TT', 'Tabiteuea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1954', '111', 'TR', 'Tabuaeran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1955', '111', 'TM', 'Tamana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1956', '111', 'TW', 'Tarawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1957', '111', 'TE', 'Teraina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1958', '112', 'CHA', 'Chagang-do');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1959', '112', 'HAB', 'Hamgyong-bukto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1960', '112', 'HAN', 'Hamgyong-namdo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1961', '112', 'HWB', 'Hwanghae-bukto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1962', '112', 'HWN', 'Hwanghae-namdo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1963', '112', 'KAN', 'Kangwon-do');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1964', '112', 'PYB', 'P\'yongan-bukto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1965', '112', 'PYN', 'P\'yongan-namdo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1966', '112', 'YAN', 'Ryanggang-do (Yanggang-do)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1967', '112', 'NAJ', 'Rason Directly Governed City');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1968', '112', 'PYO', 'P\'yongyang Special City');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1969', '113', 'CO', 'Ch\'ungch\'ong-bukto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1970', '113', 'CH', 'Ch\'ungch\'ong-namdo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1971', '113', 'CD', 'Cheju-do');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1972', '113', 'CB', 'Cholla-bukto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1973', '113', 'CN', 'Cholla-namdo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1974', '113', 'IG', 'Inch\'on-gwangyoksi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1975', '113', 'KA', 'Kangwon-do');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1976', '113', 'KG', 'Kwangju-gwangyoksi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1977', '113', 'KD', 'Kyonggi-do');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1978', '113', 'KB', 'Kyongsang-bukto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1979', '113', 'KN', 'Kyongsang-namdo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1980', '113', 'PG', 'Pusan-gwangyoksi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1981', '113', 'SO', 'Soul-t\'ukpyolsi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1982', '113', 'TA', 'Taegu-gwangyoksi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1983', '113', 'TG', 'Taejon-gwangyoksi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1984', '114', 'AL', 'Al \'Asimah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1985', '114', 'AA', 'Al Ahmadi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1986', '114', 'AF', 'Al Farwaniyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1987', '114', 'AJ', 'Al Jahra\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1988', '114', 'HA', 'Hawalli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1989', '115', 'GB', 'Bishkek');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1990', '115', 'B', 'Batken');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1991', '115', 'C', 'Chu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1992', '115', 'J', 'Jalal-Abad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1993', '115', 'N', 'Naryn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1994', '115', 'O', 'Osh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1995', '115', 'T', 'Talas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1996', '115', 'Y', 'Ysyk-Kol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1997', '116', 'VT', 'Vientiane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1998', '116', 'AT', 'Attapu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1999', '116', 'BK', 'Bokeo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2000', '116', 'BL', 'Bolikhamxai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2001', '116', 'CH', 'Champasak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2002', '116', 'HO', 'Houaphan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2003', '116', 'KH', 'Khammouan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2004', '116', 'LM', 'Louang Namtha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2005', '116', 'LP', 'Louangphabang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2006', '116', 'OU', 'Oudomxai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2007', '116', 'PH', 'Phongsali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2008', '116', 'SL', 'Salavan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2009', '116', 'SV', 'Savannakhet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2010', '116', 'VI', 'Vientiane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2011', '116', 'XA', 'Xaignabouli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2012', '116', 'XE', 'Xekong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2013', '116', 'XI', 'Xiangkhoang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2014', '116', 'XN', 'Xaisomboun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2015', '117', 'AIZ', 'Aizkraukles Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2016', '117', 'ALU', 'Aluksnes Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2017', '117', 'BAL', 'Balvu Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2018', '117', 'BAU', 'Bauskas Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2019', '117', 'CES', 'Cesu Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2020', '117', 'DGR', 'Daugavpils Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2021', '117', 'DOB', 'Dobeles Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2022', '117', 'GUL', 'Gulbenes Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2023', '117', 'JEK', 'Jekabpils Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2024', '117', 'JGR', 'Jelgavas Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2025', '117', 'KRA', 'Kraslavas Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2026', '117', 'KUL', 'Kuldigas Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2027', '117', 'LPR', 'Liepajas Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2028', '117', 'LIM', 'Limbazu Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2029', '117', 'LUD', 'Ludzas Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2030', '117', 'MAD', 'Madonas Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2031', '117', 'OGR', 'Ogres Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2032', '117', 'PRE', 'Preilu Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2033', '117', 'RZR', 'Rezeknes Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2034', '117', 'RGR', 'Rigas Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2035', '117', 'SAL', 'Saldus Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2036', '117', 'TAL', 'Talsu Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2037', '117', 'TUK', 'Tukuma Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2038', '117', 'VLK', 'Valkas Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2039', '117', 'VLM', 'Valmieras Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2040', '117', 'VSR', 'Ventspils Rajons');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2041', '117', 'DGV', 'Daugavpils');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2042', '117', 'JGV', 'Jelgava');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2043', '117', 'JUR', 'Jurmala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2044', '117', 'LPK', 'Liepaja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2045', '117', 'RZK', 'Rezekne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2046', '117', 'RGA', 'Riga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2047', '117', 'VSL', 'Ventspils');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2048', '118', 'BIN', 'Bint Jbeil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2049', '118', 'HAS', 'Hasbaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2050', '118', 'MAR', 'Marjeyoun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2051', '118', 'NAB', 'Nabatieh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2052', '118', 'BAA', 'Baalbek');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2053', '118', 'HER', 'Hermel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2054', '118', 'RAS', 'Rashaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2055', '118', 'WES', 'Western Beqaa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2056', '118', 'ZAH', 'Zahle');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2057', '118', 'AKK', 'Akkar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2058', '118', 'BAT', 'Batroun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2059', '118', 'BSH', 'Bsharri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2060', '118', 'KOU', 'Koura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2061', '118', 'MIN', 'Miniyeh-Danniyeh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2062', '118', 'TRI', 'Tripoli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2063', '118', 'ZGH', 'Zgharta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2064', '118', 'ALE', 'Aley');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2065', '118', 'BAA', 'Baabda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2066', '118', 'BYB', 'Byblos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2067', '118', 'CHO', 'Chouf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2068', '118', 'KES', 'Kesrwan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2069', '118', 'MAT', 'Matn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2070', '118', 'JEZ', 'Jezzine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2071', '118', 'SID', 'Sidon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2072', '118', 'TYR', 'Tyre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2073', '119', 'BE', 'Berea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2074', '119', 'BB', 'Butha-Buthe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2075', '119', 'LE', 'Leribe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2076', '119', 'MF', 'Mafeteng');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2077', '119', 'MS', 'Maseru');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2078', '119', 'MH', 'Mohale\'s Hoek');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2079', '119', 'MK', 'Mokhotlong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2080', '119', 'QN', 'Qacha\'s Nek');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2081', '119', 'QT', 'Quthing');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2082', '119', 'TT', 'Thaba-Tseka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2083', '120', 'BI', 'Bomi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2084', '120', 'BG', 'Bong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2085', '120', 'GB', 'Grand Bassa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2086', '120', 'CM', 'Grand Cape Mount');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2087', '120', 'GG', 'Grand Gedeh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2088', '120', 'GK', 'Grand Kru');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2089', '120', 'LO', 'Lofa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2090', '120', 'MG', 'Margibi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2091', '120', 'ML', 'Maryland.');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2092', '120', 'MS', 'Montserrado');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2093', '120', 'NB', 'Nimba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2094', '120', 'RC', 'River Cess');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2095', '120', 'SN', 'Sinoe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2096', '121', 'AJ', 'Ajdabiya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2097', '121', 'AZ', 'Al \'Aziziyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2098', '121', 'FA', 'Al Fatih');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2099', '121', 'JA', 'Al Jabal al Akhdar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2100', '121', 'JU', 'Al Jufrah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2101', '121', 'KH', 'Al Khums');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2102', '121', 'KU', 'Al Kufrah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2103', '121', 'NK', 'An Nuqat al Khams');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2104', '121', 'AS', 'Ash Shati\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2105', '121', 'AW', 'Awbari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2106', '121', 'ZA', 'Az Zawiyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2107', '121', 'BA', 'Banghazi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2108', '121', 'DA', 'Darnah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2109', '121', 'GD', 'Ghadamis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2110', '121', 'GY', 'Gharyan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2111', '121', 'MI', 'Misratah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2112', '121', 'MZ', 'Murzuq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2113', '121', 'SB', 'Sabha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2114', '121', 'SW', 'Sawfajjin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2115', '121', 'SU', 'Surt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2116', '121', 'TL', 'Tarabulus (Tripoli)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2117', '121', 'TH', 'Tarhunah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2118', '121', 'TU', 'Tubruq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2119', '121', 'YA', 'Yafran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2120', '121', 'ZL', 'Zlitan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2121', '122', 'V', 'Vaduz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2122', '122', 'A', 'Schaan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2123', '122', 'B', 'Balzers');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2124', '122', 'N', 'Triesen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2125', '122', 'E', 'Eschen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2126', '122', 'M', 'Mauren');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2127', '122', 'T', 'Triesenberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2128', '122', 'R', 'Ruggell');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2129', '122', 'G', 'Gamprin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2130', '122', 'L', 'Schellenberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2131', '122', 'P', 'Planken');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2132', '123', 'AL', 'Alytus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2133', '123', 'KA', 'Kaunas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2134', '123', 'KL', 'Klaipeda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2135', '123', 'MA', 'Marijampole');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2136', '123', 'PA', 'Panevezys');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2137', '123', 'SI', 'Siauliai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2138', '123', 'TA', 'Taurage');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2139', '123', 'TE', 'Telsiai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2140', '123', 'UT', 'Utena');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2141', '123', 'VI', 'Vilnius');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2142', '124', 'DD', 'Diekirch');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2143', '124', 'DC', 'Clervaux');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2144', '124', 'DR', 'Redange');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2145', '124', 'DV', 'Vianden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2146', '124', 'DW', 'Wiltz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2147', '124', 'GG', 'Grevenmacher');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2148', '124', 'GE', 'Echternach');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2149', '124', 'GR', 'Remich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2150', '124', 'LL', 'Luxembourg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2151', '124', 'LC', 'Capellen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2152', '124', 'LE', 'Esch-sur-Alzette');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2153', '124', 'LM', 'Mersch');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2154', '125', 'OLF', 'Our Lady Fatima Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2155', '125', 'ANT', 'St. Anthony Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2156', '125', 'LAZ', 'St. Lazarus Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2157', '125', 'CAT', 'Cathedral Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2158', '125', 'LAW', 'St. Lawrence Parish');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2159', '126', 'AER', 'Aerodrom');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2160', '126', 'ARA', 'Ara&#269;inovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2161', '126', 'BER', 'Berovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2162', '126', 'BIT', 'Bitola');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2163', '126', 'BOG', 'Bogdanci');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2164', '126', 'BOG', 'Bogovinje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2165', '126', 'BOS', 'Bosilovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2166', '126', 'BRV', 'Brvenica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2167', '126', 'BUT', 'Butel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2168', '126', '&#268;AI', '&#268;air');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2169', '126', '&#268;A&scaron;', '&#268;a&scaron;ka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2170', '126', 'CEN', 'Centar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2171', '126', 'CEN', 'Centar &#381;upa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2172', '126', '&#268;e&scaron;', '&#268;e&scaron;inovo-Oble&scaron');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2173', '126', '&#268;U&#268;', '&#268;u&#269;er-Sandevo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2174', '126', 'DEB', 'Debar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2175', '126', 'DEB', 'Debarca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2176', '126', 'DEL', 'Del&#269;evo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2177', '126', 'DEM', 'Demir Hisar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2178', '126', 'DEM', 'Demir Kapija');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2179', '126', 'DOL', 'Dolneni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2180', '126', 'DRU', 'Drugovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2181', '126', 'GAZ', 'Gazi Baba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2182', '126', 'GEV', 'Gevgelija');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2183', '126', 'GJO', 'Gjor&#269;e Petrov');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2184', '126', 'GOS', 'Gostivar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2185', '126', 'GRA', 'Gradsko');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2186', '126', 'ILI', 'Ilinden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2187', '126', 'JEG', 'Jegunovce');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2188', '126', 'KAR', 'Karbinci');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2189', '126', 'KAR', 'Karpo&scaron;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2190', '126', 'KAV', 'Kavadarci');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2191', '126', 'KI&#268;', 'Ki&#269;evo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2192', '126', 'KIS', 'Kisela Voda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2193', '126', 'KO&#269;', 'Ko&#269;ani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2194', '126', 'KON', 'Kon&#269;e');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2195', '126', 'KRA', 'Kratovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2196', '126', 'KRI', 'Kriva Palanka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2197', '126', 'KRI', 'Krivoga&scaron;tani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2198', '126', 'KRU', 'Kru&scaron;evo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2199', '126', 'KUM', 'Kumanovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2200', '126', 'LIP', 'Lipkovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2201', '126', 'LOZ', 'Lozovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2202', '126', 'MAK', 'Makedonska Kamenica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2203', '126', 'MAK', 'Makedonski Brod');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2204', '126', 'MAV', 'Mavrovo and Rostu&scaron;a');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2205', '126', 'MOG', 'Mogila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2206', '126', 'NEG', 'Negotino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2207', '126', 'NOV', 'Novaci');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2208', '126', 'NOV', 'Novo Selo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2209', '126', 'OHR', 'Ohrid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2210', '126', 'OSL', 'Oslomej');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2211', '126', 'PEH', 'Peh&#269;evo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2212', '126', 'PET', 'Petrovec');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2213', '126', 'PLA', 'Plasnica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2214', '126', 'PRI', 'Prilep');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2215', '126', 'PRO', 'Probi&scaron;tip');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2216', '126', 'RAD', 'Radovi&scaron;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2217', '126', 'RAN', 'Rankovce');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2218', '126', 'RES', 'Resen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2219', '126', 'ROS', 'Rosoman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2220', '126', 'SAR', 'Saraj');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2221', '126', 'SOP', 'Sopi&scaron;te');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2222', '126', 'STA', 'Star Dojran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2223', '126', 'STA', 'Staro Nagori&#269;ane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2224', '126', '&Scaron;TI', '&Scaron;tip');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2225', '126', 'STR', 'Struga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2226', '126', 'STR', 'Strumica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2227', '126', 'STU', 'Studeni&#269;ani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2228', '126', '&Scaron;UT', '&Scaron;uto Orizari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2229', '126', 'SVE', 'Sveti Nikole');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2230', '126', 'TEA', 'Tearce');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2231', '126', 'TET', 'Tetovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2232', '126', 'VAL', 'Valandovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2233', '126', 'VAS', 'Vasilevo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2234', '126', 'VEL', 'Veles');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2235', '126', 'VEV', 'Vev&#269;ani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2236', '126', 'VIN', 'Vinica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2237', '126', 'VRA', 'Vrane&scaron;tica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2238', '126', 'VRA', 'Vrap&#269;i&scaron;te');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2239', '126', 'ZAJ', 'Zajas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2240', '126', 'ZEL', 'Zelenikovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2241', '126', '&#381;EL', '&#381;elino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2242', '126', 'ZRN', 'Zrnovci');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2243', '127', 'AN', 'Antananarivo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2244', '127', 'AS', 'Antsiranana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2245', '127', 'FN', 'Fianarantsoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2246', '127', 'MJ', 'Mahajanga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2247', '127', 'TM', 'Toamasina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2248', '127', 'TL', 'Toliara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2249', '128', 'BLK', 'Balaka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2250', '128', 'BLT', 'Blantyre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2251', '128', 'CKW', 'Chikwawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2252', '128', 'CRD', 'Chiradzulu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2253', '128', 'CTP', 'Chitipa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2254', '128', 'DDZ', 'Dedza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2255', '128', 'DWA', 'Dowa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2256', '128', 'KRG', 'Karonga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2257', '128', 'KSG', 'Kasungu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2258', '128', 'LKM', 'Likoma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2259', '128', 'LLG', 'Lilongwe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2260', '128', 'MCG', 'Machinga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2261', '128', 'MGC', 'Mangochi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2262', '128', 'MCH', 'Mchinji');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2263', '128', 'MLJ', 'Mulanje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2264', '128', 'MWZ', 'Mwanza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2265', '128', 'MZM', 'Mzimba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2266', '128', 'NTU', 'Ntcheu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2267', '128', 'NKB', 'Nkhata Bay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2268', '128', 'NKH', 'Nkhotakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2269', '128', 'NSJ', 'Nsanje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2270', '128', 'NTI', 'Ntchisi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2271', '128', 'PHL', 'Phalombe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2272', '128', 'RMP', 'Rumphi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2273', '128', 'SLM', 'Salima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2274', '128', 'THY', 'Thyolo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2275', '128', 'ZBA', 'Zomba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2276', '129', 'Johor', 'Johor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2277', '129', 'Kedah', 'Kedah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2278', '129', 'Kelantan', 'Kelantan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2279', '129', 'Labuan', 'Labuan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2280', '129', 'Melaka', 'Melaka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2281', '129', 'Negeri Sembilan', 'Negeri Sembilan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2282', '129', 'Pahang', 'Pahang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2283', '129', 'Perak', 'Perak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2284', '129', 'Perlis', 'Perlis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2285', '129', 'Pulau Pinang', 'Pulau Pinang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2286', '129', 'Sabah', 'Sabah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2287', '129', 'Sarawak', 'Sarawak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2288', '129', 'Selangor', 'Selangor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2289', '129', 'Terengganu', 'Terengganu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2290', '129', 'Kuala Lumpur', 'Kuala Lumpur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2291', '130', 'THU', 'Thiladhunmathi Uthuru');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2292', '130', 'THD', 'Thiladhunmathi Dhekunu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2293', '130', 'MLU', 'Miladhunmadulu Uthuru');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2294', '130', 'MLD', 'Miladhunmadulu Dhekunu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2295', '130', 'MAU', 'Maalhosmadulu Uthuru');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2296', '130', 'MAD', 'Maalhosmadulu Dhekunu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2297', '130', 'FAA', 'Faadhippolhu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2298', '130', 'MAA', 'Male Atoll');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2299', '130', 'AAU', 'Ari Atoll Uthuru');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2300', '130', 'AAD', 'Ari Atoll Dheknu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2301', '130', 'FEA', 'Felidhe Atoll');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2302', '130', 'MUA', 'Mulaku Atoll');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2303', '130', 'NAU', 'Nilandhe Atoll Uthuru');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2304', '130', 'NAD', 'Nilandhe Atoll Dhekunu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2305', '130', 'KLH', 'Kolhumadulu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2306', '130', 'HDH', 'Hadhdhunmathi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2307', '130', 'HAU', 'Huvadhu Atoll Uthuru');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2308', '130', 'HAD', 'Huvadhu Atoll Dhekunu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2309', '130', 'FMU', 'Fua Mulaku');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2310', '130', 'ADD', 'Addu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2311', '131', 'GA', 'Gao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2312', '131', 'KY', 'Kayes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2313', '131', 'KD', 'Kidal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2314', '131', 'KL', 'Koulikoro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2315', '131', 'MP', 'Mopti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2316', '131', 'SG', 'Segou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2317', '131', 'SK', 'Sikasso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2318', '131', 'TB', 'Tombouctou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2319', '131', 'CD', 'Bamako Capital District');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2320', '132', 'ATT', 'Attard');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2321', '132', 'BAL', 'Balzan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2322', '132', 'BGU', 'Birgu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2323', '132', 'BKK', 'Birkirkara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2324', '132', 'BRZ', 'Birzebbuga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2325', '132', 'BOR', 'Bormla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2326', '132', 'DIN', 'Dingli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2327', '132', 'FGU', 'Fgura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2328', '132', 'FLO', 'Floriana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2329', '132', 'GDJ', 'Gudja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2330', '132', 'GZR', 'Gzira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2331', '132', 'GRG', 'Gargur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2332', '132', 'GXQ', 'Gaxaq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2333', '132', 'HMR', 'Hamrun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2334', '132', 'IKL', 'Iklin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2335', '132', 'ISL', 'Isla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2336', '132', 'KLK', 'Kalkara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2337', '132', 'KRK', 'Kirkop');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2338', '132', 'LIJ', 'Lija');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2339', '132', 'LUQ', 'Luqa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2340', '132', 'MRS', 'Marsa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2341', '132', 'MKL', 'Marsaskala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2342', '132', 'MXL', 'Marsaxlokk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2343', '132', 'MDN', 'Mdina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2344', '132', 'MEL', 'Melliea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2345', '132', 'MGR', 'Mgarr');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2346', '132', 'MST', 'Mosta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2347', '132', 'MQA', 'Mqabba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2348', '132', 'MSI', 'Msida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2349', '132', 'MTF', 'Mtarfa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2350', '132', 'NAX', 'Naxxar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2351', '132', 'PAO', 'Paola');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2352', '132', 'PEM', 'Pembroke');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2353', '132', 'PIE', 'Pieta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2354', '132', 'QOR', 'Qormi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2355', '132', 'QRE', 'Qrendi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2356', '132', 'RAB', 'Rabat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2357', '132', 'SAF', 'Safi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2358', '132', 'SGI', 'San Giljan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2359', '132', 'SLU', 'Santa Lucija');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2360', '132', 'SPB', 'San Pawl il-Bahar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2361', '132', 'SGW', 'San Gwann');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2362', '132', 'SVE', 'Santa Venera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2363', '132', 'SIG', 'Siggiewi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2364', '132', 'SLM', 'Sliema');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2365', '132', 'SWQ', 'Swieqi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2366', '132', 'TXB', 'Ta Xbiex');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2367', '132', 'TRX', 'Tarxien');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2368', '132', 'VLT', 'Valletta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2369', '132', 'XGJ', 'Xgajra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2370', '132', 'ZBR', 'Zabbar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2371', '132', 'ZBG', 'Zebbug');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2372', '132', 'ZJT', 'Zejtun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2373', '132', 'ZRQ', 'Zurrieq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2374', '132', 'FNT', 'Fontana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2375', '132', 'GHJ', 'Ghajnsielem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2376', '132', 'GHR', 'Gharb');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2377', '132', 'GHS', 'Ghasri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2378', '132', 'KRC', 'Kercem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2379', '132', 'MUN', 'Munxar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2380', '132', 'NAD', 'Nadur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2381', '132', 'QAL', 'Qala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2382', '132', 'VIC', 'Victoria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2383', '132', 'SLA', 'San Lawrenz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2384', '132', 'SNT', 'Sannat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2385', '132', 'ZAG', 'Xagra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2386', '132', 'XEW', 'Xewkija');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2387', '132', 'ZEB', 'Zebbug');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2388', '133', 'ALG', 'Ailinginae');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2389', '133', 'ALL', 'Ailinglaplap');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2390', '133', 'ALK', 'Ailuk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2391', '133', 'ARN', 'Arno');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2392', '133', 'AUR', 'Aur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2393', '133', 'BKR', 'Bikar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2394', '133', 'BKN', 'Bikini');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2395', '133', 'BKK', 'Bokak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2396', '133', 'EBN', 'Ebon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2397', '133', 'ENT', 'Enewetak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2398', '133', 'EKB', 'Erikub');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2399', '133', 'JBT', 'Jabat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2400', '133', 'JLT', 'Jaluit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2401', '133', 'JEM', 'Jemo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2402', '133', 'KIL', 'Kili');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2403', '133', 'KWJ', 'Kwajalein');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2404', '133', 'LAE', 'Lae');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2405', '133', 'LIB', 'Lib');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2406', '133', 'LKP', 'Likiep');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2407', '133', 'MJR', 'Majuro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2408', '133', 'MLP', 'Maloelap');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2409', '133', 'MJT', 'Mejit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2410', '133', 'MIL', 'Mili');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2411', '133', 'NMK', 'Namorik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2412', '133', 'NAM', 'Namu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2413', '133', 'RGL', 'Rongelap');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2414', '133', 'RGK', 'Rongrik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2415', '133', 'TOK', 'Toke');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2416', '133', 'UJA', 'Ujae');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2417', '133', 'UJL', 'Ujelang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2418', '133', 'UTK', 'Utirik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2419', '133', 'WTH', 'Wotho');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2420', '133', 'WTJ', 'Wotje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2421', '134', 'LAJ', 'L\'Ajoupa-Bouillon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2422', '134', 'LES', 'Les Anses-d\'Arlet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2423', '134', 'BAS', 'Basse-Pointe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2424', '134', 'BEL', 'Bellefontaine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2425', '134', 'LE', 'Le Carbet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2426', '134', 'CAS', 'Case-Pilote');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2427', '134', 'LE', 'Le Diamant');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2428', '134', 'DUC', 'Ducos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2429', '134', 'FON', 'Fonds-Saint-Denis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2430', '134', 'FOR', 'Fort-De-France');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2431', '134', 'LE', 'Le Fran&ccedil;ois');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2432', '134', 'GRA', 'Grand\'Rivi&egrave;re');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2433', '134', 'GRO', 'Gros-Morne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2434', '134', 'LE', 'Le Lamentin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2435', '134', 'LE', 'Le Lorrain');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2436', '134', 'MAC', 'Macouba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2437', '134', 'LE', 'Le Marigot');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2438', '134', 'LE', 'Le Marin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2439', '134', 'LE', 'Le Morne-Rouge');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2440', '134', 'LE', 'Le Morne-Vert');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2441', '134', 'LE', 'Le Pr&ecirc;cheur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2442', '134', 'RIV', 'Rivi&egrave;re-Pilote');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2443', '134', 'RIV', 'Rivi&egrave;re-Sal&eacute;e');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2444', '134', 'LE', 'Le Robert');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2445', '134', 'SAI', 'Sainte-Anne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2446', '134', 'SAI', 'Sainte-Luce');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2447', '134', 'SAI', 'Sainte-Marie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2448', '134', 'SAI', 'Saint-Esprit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2449', '134', 'SAI', 'Saint-Joseph');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2450', '134', 'SAI', 'Saint-Pierre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2451', '134', 'SCH', 'Sch&oelig;lcher');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2452', '134', 'LA', 'La Trinit&eacute;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2453', '134', 'LES', 'Les Trois-&Icirc;lets');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2454', '134', 'LE', 'Le Vauclin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2455', '135', 'AD', 'Adrar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2456', '135', 'AS', 'Assaba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2457', '135', 'BR', 'Brakna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2458', '135', 'DN', 'Dakhlet Nouadhibou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2459', '135', 'GO', 'Gorgol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2460', '135', 'GM', 'Guidimaka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2461', '135', 'HC', 'Hodh Ech Chargui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2462', '135', 'HG', 'Hodh El Gharbi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2463', '135', 'IN', 'Inchiri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2464', '135', 'TA', 'Tagant');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2465', '135', 'TZ', 'Tiris Zemmour');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2466', '135', 'TR', 'Trarza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2467', '135', 'NO', 'Nouakchott');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2468', '136', 'BR', 'Beau Bassin-Rose Hill');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2469', '136', 'CU', 'Curepipe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2470', '136', 'PU', 'Port Louis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2471', '136', 'QB', 'Quatre Bornes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2472', '136', 'VP', 'Vacoas-Phoenix');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2473', '136', 'AG', 'Agalega Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2474', '136', 'CC', 'Cargados Carajos Shoals (Saint B');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2475', '136', 'RO', 'Rodrigues');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2476', '136', 'BL', 'Black River');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2477', '136', 'FL', 'Flacq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2478', '136', 'GP', 'Grand Port');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2479', '136', 'MO', 'Moka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2480', '136', 'PA', 'Pamplemousses');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2481', '136', 'PW', 'Plaines Wilhems');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2482', '136', 'PL', 'Port Louis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2483', '136', 'RR', 'Riviere du Rempart');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2484', '136', 'SA', 'Savanne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2485', '137', 'DZA', 'Dzaoudzi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2486', '137', 'PAM', 'Pamandzi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2487', '137', 'MAM', 'Mamoudzou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2488', '137', 'DEM', 'Dembeni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2489', '137', 'BAN', 'Bandrele');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2490', '137', 'KAN', 'Kani-K&eacute;li');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2491', '137', 'BOU', 'Bou&eacute;ni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2492', '137', 'CHI', 'Chirongui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2493', '137', 'SAD', 'Sada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2494', '137', 'OUA', 'Ouangani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2495', '137', 'CHI', 'Chiconi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2496', '137', 'TSI', 'Tsingoni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2497', '137', 'MTS', 'M\'Tsangamouji');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2498', '137', 'ACO', 'Acoua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2499', '137', 'MTS', 'Mtsamboro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2500', '137', 'BAN', 'Bandraboua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2501', '137', 'KOU', 'Koungou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2502', '138', 'AGU', 'Aguascalientes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2503', '138', 'BCN', 'Baja California Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2504', '138', 'BCS', 'Baja California Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2505', '138', 'CAM', 'Campeche');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2506', '138', 'CHP', 'Chiapas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2507', '138', 'CHH', 'Chihuahua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2508', '138', 'COA', 'Coahuila de Zaragoza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2509', '138', 'COL', 'Colima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2510', '138', 'DIF', 'Distrito Federal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2511', '138', 'DUR', 'Durango');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2512', '138', 'GUA', 'Guanajuato');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2513', '138', 'GRO', 'Guerrero');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2514', '138', 'HID', 'Hidalgo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2515', '138', 'JAL', 'Jalisco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2516', '138', 'MEX', 'Mexico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2517', '138', 'MIC', 'Michoacan de Ocampo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2518', '138', 'MOR', 'Morelos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2519', '138', 'NAY', 'Nayarit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2520', '138', 'NLE', 'Nuevo Leon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2521', '138', 'OAX', 'Oaxaca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2522', '138', 'PUE', 'Puebla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2523', '138', 'QUE', 'Queretaro de Arteaga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2524', '138', 'ROO', 'Quintana Roo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2525', '138', 'SLP', 'San Luis Potosi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2526', '138', 'SIN', 'Sinaloa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2527', '138', 'SON', 'Sonora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2528', '138', 'TAB', 'Tabasco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2529', '138', 'TAM', 'Tamaulipas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2530', '138', 'TLA', 'Tlaxcala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2531', '138', 'VER', 'Veracruz-Llave');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2532', '138', 'YUC', 'Yucatan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2533', '138', 'ZAC', 'Zacatecas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2534', '139', 'C', 'Chuuk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2535', '139', 'K', 'Kosrae');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2536', '139', 'P', 'Pohnpei');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2537', '139', 'Y', 'Yap');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2538', '140', 'GA', 'Gagauzia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2539', '140', 'CU', 'Chisinau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2540', '140', 'BA', 'Balti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2541', '140', 'CA', 'Cahul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2542', '140', 'ED', 'Edinet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2543', '140', 'LA', 'Lapusna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2544', '140', 'OR', 'Orhei');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2545', '140', 'SO', 'Soroca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2546', '140', 'TI', 'Tighina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2547', '140', 'UN', 'Ungheni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2548', '140', 'SN', 'Stânga Nistrului');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2549', '141', 'FV', 'Fontvieille');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2550', '141', 'LC', 'La Condamine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2551', '141', 'MV', 'Monaco-Ville');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2552', '141', 'MC', 'Monte-Carlo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2553', '142', '1', 'Ulanbaatar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2554', '142', '035', 'Orhon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2555', '142', '037', 'Darhan uul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2556', '142', '039', 'Hentiy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2557', '142', '041', 'Hovsgol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2558', '142', '043', 'Hovd');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2559', '142', '046', 'Uvs');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2560', '142', '047', 'Tov');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2561', '142', '049', 'Selenge');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2562', '142', '051', 'Suhbaatar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2563', '142', '053', 'Omnogovi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2564', '142', '055', 'Ovorhangay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2565', '142', '057', 'Dzavhan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2566', '142', '059', 'DundgovL');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2567', '142', '061', 'Dornod');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2568', '142', '063', 'Dornogov');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2569', '142', '064', 'Govi-Sumber');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2570', '142', '065', 'Govi-Altay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2571', '142', '067', 'Bulgan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2572', '142', '069', 'Bayanhongor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2573', '142', '071', 'Bayan-Olgiy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2574', '142', '073', 'Arhangay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2575', '143', 'A', 'Saint Anthony');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2576', '143', 'G', 'Saint Georges');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2577', '143', 'P', 'Saint Peter');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2578', '144', 'AGD', 'Agadir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2579', '144', 'HOC', 'Al Hoceima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2580', '144', 'AZI', 'Azilal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2581', '144', 'BME', 'Beni Mellal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2582', '144', 'BSL', 'Ben Slimane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2583', '144', 'BLM', 'Boulemane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2584', '144', 'CBL', 'Casablanca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2585', '144', 'CHA', 'Chaouen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2586', '144', 'EJA', 'El Jadida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2587', '144', 'EKS', 'El Kelaa des Sraghna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2588', '144', 'ERA', 'Er Rachidia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2589', '144', 'ESS', 'Essaouira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2590', '144', 'FES', 'Fes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2591', '144', 'FIG', 'Figuig');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2592', '144', 'GLM', 'Guelmim');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2593', '144', 'IFR', 'Ifrane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2594', '144', 'KEN', 'Kenitra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2595', '144', 'KHM', 'Khemisset');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2596', '144', 'KHN', 'Khenifra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2597', '144', 'KHO', 'Khouribga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2598', '144', 'LYN', 'Laayoune');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2599', '144', 'LAR', 'Larache');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2600', '144', 'MRK', 'Marrakech');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2601', '144', 'MKN', 'Meknes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2602', '144', 'NAD', 'Nador');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2603', '144', 'ORZ', 'Ouarzazate');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2604', '144', 'OUJ', 'Oujda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2605', '144', 'RSA', 'Rabat-Sale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2606', '144', 'SAF', 'Safi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2607', '144', 'SET', 'Settat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2608', '144', 'SKA', 'Sidi Kacem');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2609', '144', 'TGR', 'Tangier');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2610', '144', 'TAN', 'Tan-Tan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2611', '144', 'TAO', 'Taounate');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2612', '144', 'TRD', 'Taroudannt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2613', '144', 'TAT', 'Tata');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2614', '144', 'TAZ', 'Taza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2615', '144', 'TET', 'Tetouan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2616', '144', 'TIZ', 'Tiznit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2617', '144', 'ADK', 'Ad Dakhla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2618', '144', 'BJD', 'Boujdour');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2619', '144', 'ESM', 'Es Smara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2620', '145', 'CD', 'Cabo Delgado');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2621', '145', 'GZ', 'Gaza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2622', '145', 'IN', 'Inhambane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2623', '145', 'MN', 'Manica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2624', '145', 'MC', 'Maputo (city)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2625', '145', 'MP', 'Maputo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2626', '145', 'NA', 'Nampula');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2627', '145', 'NI', 'Niassa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2628', '145', 'SO', 'Sofala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2629', '145', 'TE', 'Tete');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2630', '145', 'ZA', 'Zambezia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2631', '146', 'AY', 'Ayeyarwady');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2632', '146', 'BG', 'Bago');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2633', '146', 'MG', 'Magway');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2634', '146', 'MD', 'Mandalay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2635', '146', 'SG', 'Sagaing');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2636', '146', 'TN', 'Tanintharyi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2637', '146', 'YG', 'Yangon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2638', '146', 'CH', 'Chin State');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2639', '146', 'KC', 'Kachin State');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2640', '146', 'KH', 'Kayah State');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2641', '146', 'KN', 'Kayin State');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2642', '146', 'MN', 'Mon State');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2643', '146', 'RK', 'Rakhine State');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2644', '146', 'SH', 'Shan State');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2645', '147', 'CA', 'Caprivi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2646', '147', 'ER', 'Erongo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2647', '147', 'HA', 'Hardap');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2648', '147', 'KR', 'Karas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2649', '147', 'KV', 'Kavango');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2650', '147', 'KH', 'Khomas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2651', '147', 'KU', 'Kunene');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2652', '147', 'OW', 'Ohangwena');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2653', '147', 'OK', 'Omaheke');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2654', '147', 'OT', 'Omusati');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2655', '147', 'ON', 'Oshana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2656', '147', 'OO', 'Oshikoto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2657', '147', 'OJ', 'Otjozondjupa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2658', '148', 'AO', 'Aiwo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2659', '148', 'AA', 'Anabar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2660', '148', 'AT', 'Anetan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2661', '148', 'AI', 'Anibare');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2662', '148', 'BA', 'Baiti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2663', '148', 'BO', 'Boe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2664', '148', 'BU', 'Buada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2665', '148', 'DE', 'Denigomodu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2666', '148', 'EW', 'Ewa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2667', '148', 'IJ', 'Ijuw');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2668', '148', 'ME', 'Meneng');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2669', '148', 'NI', 'Nibok');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2670', '148', 'UA', 'Uaboe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2671', '148', 'YA', 'Yaren');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2672', '149', 'BA', 'Bagmati');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2673', '149', 'BH', 'Bheri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2674', '149', 'DH', 'Dhawalagiri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2675', '149', 'GA', 'Gandaki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2676', '149', 'JA', 'Janakpur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2677', '149', 'KA', 'Karnali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2678', '149', 'KO', 'Kosi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2679', '149', 'LU', 'Lumbini');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2680', '149', 'MA', 'Mahakali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2681', '149', 'ME', 'Mechi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2682', '149', 'NA', 'Narayani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2683', '149', 'RA', 'Rapti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2684', '149', 'SA', 'Sagarmatha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2685', '149', 'SE', 'Seti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2686', '150', 'DR', 'Drenthe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2687', '150', 'FL', 'Flevoland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2688', '150', 'FR', 'Friesland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2689', '150', 'GE', 'Gelderland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2690', '150', 'GR', 'Groningen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2691', '150', 'LI', 'Limburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2692', '150', 'NB', 'Noord Brabant');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2693', '150', 'NH', 'Noord Holland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2694', '150', 'OV', 'Overijssel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2695', '150', 'UT', 'Utrecht');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2696', '150', 'ZE', 'Zeeland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2697', '150', 'ZH', 'Zuid Holland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2698', '151', 'BON', 'Bonaire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2699', '151', 'CUR', 'Cura&ccedil;ao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2700', '151', 'SAB', 'Saba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2701', '151', 'SEU', 'Sint Eustatius');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2702', '151', 'SMA', 'Sint Maarten');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2703', '152', 'L', 'Iles Loyaute');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2704', '152', 'N', 'Nord');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2705', '152', 'S', 'Sud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2706', '153', 'AUK', 'Auckland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2707', '153', 'BOP', 'Bay of Plenty');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2708', '153', 'CAN', 'Canterbury');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2709', '153', 'COR', 'Coromandel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2710', '153', 'GIS', 'Gisborne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2711', '153', 'FIO', 'Fiordland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2712', '153', 'HKB', 'Hawke\'s Bay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2713', '153', 'MBH', 'Marlborough');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2714', '153', 'MWT', 'Manawatu-Wanganui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2715', '153', 'MCM', 'Mt Cook-Mackenzie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2716', '153', 'NSN', 'Nelson');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2717', '153', 'NTL', 'Northland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2718', '153', 'OTA', 'Otago');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2719', '153', 'STL', 'Southland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2720', '153', 'TKI', 'Taranaki');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2721', '153', 'WGN', 'Wellington');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2722', '153', 'WKO', 'Waikato');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2723', '153', 'WAI', 'Wairprarapa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2724', '153', 'WTC', 'West Coast');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2725', '154', 'AN', 'Atlantico Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2726', '154', 'AS', 'Atlantico Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2727', '154', 'BO', 'Boaco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2728', '154', 'CA', 'Carazo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2729', '154', 'CI', 'Chinandega');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2730', '154', 'CO', 'Chontales');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2731', '154', 'ES', 'Esteli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2732', '154', 'GR', 'Granada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2733', '154', 'JI', 'Jinotega');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2734', '154', 'LE', 'Leon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2735', '154', 'MD', 'Madriz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2736', '154', 'MN', 'Managua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2737', '154', 'MS', 'Masaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2738', '154', 'MT', 'Matagalpa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2739', '154', 'NS', 'Nuevo Segovia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2740', '154', 'RS', 'Rio San Juan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2741', '154', 'RI', 'Rivas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2742', '155', 'AG', 'Agadez');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2743', '155', 'DF', 'Diffa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2744', '155', 'DS', 'Dosso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2745', '155', 'MA', 'Maradi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2746', '155', 'NM', 'Niamey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2747', '155', 'TH', 'Tahoua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2748', '155', 'TL', 'Tillaberi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2749', '155', 'ZD', 'Zinder');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2750', '156', 'AB', 'Abia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2751', '156', 'CT', 'Abuja Federal Capital Territory');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2752', '156', 'AD', 'Adamawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2753', '156', 'AK', 'Akwa Ibom');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2754', '156', 'AN', 'Anambra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2755', '156', 'BC', 'Bauchi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2756', '156', 'BY', 'Bayelsa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2757', '156', 'BN', 'Benue');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2758', '156', 'BO', 'Borno');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2759', '156', 'CR', 'Cross River');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2760', '156', 'DE', 'Delta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2761', '156', 'EB', 'Ebonyi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2762', '156', 'ED', 'Edo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2763', '156', 'EK', 'Ekiti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2764', '156', 'EN', 'Enugu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2765', '156', 'GO', 'Gombe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2766', '156', 'IM', 'Imo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2767', '156', 'JI', 'Jigawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2768', '156', 'KD', 'Kaduna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2769', '156', 'KN', 'Kano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2770', '156', 'KT', 'Katsina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2771', '156', 'KE', 'Kebbi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2772', '156', 'KO', 'Kogi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2773', '156', 'KW', 'Kwara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2774', '156', 'LA', 'Lagos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2775', '156', 'NA', 'Nassarawa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2776', '156', 'NI', 'Niger');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2777', '156', 'OG', 'Ogun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2778', '156', 'ONG', 'Ondo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2779', '156', 'OS', 'Osun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2780', '156', 'OY', 'Oyo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2781', '156', 'PL', 'Plateau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2782', '156', 'RI', 'Rivers');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2783', '156', 'SO', 'Sokoto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2784', '156', 'TA', 'Taraba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2785', '156', 'YO', 'Yobe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2786', '156', 'ZA', 'Zamfara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2787', '157', 'MAK', 'Makefu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2788', '157', 'TUA', 'Tuapa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2789', '157', 'NAM', 'Namukulu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2790', '157', 'HIK', 'Hikutavake');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2791', '157', 'TOI', 'Toi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2792', '157', 'MUT', 'Mutalau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2793', '157', 'LAK', 'Lakepa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2794', '157', 'LIK', 'Liku');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2795', '157', 'HAK', 'Hakupu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2796', '157', 'VAI', 'Vaiea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2797', '157', 'AVA', 'Avatele');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2798', '157', 'TAM', 'Tamakautoga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2799', '157', 'ALO', 'Alofi South');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2800', '157', 'ALO', 'Alofi North');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2801', '158', 'NOR', 'Norfolk Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2802', '159', 'N', 'Northern Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2803', '159', 'R', 'Rota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2804', '159', 'S', 'Saipan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2805', '159', 'T', 'Tinian');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2806', '160', 'AK', 'Akershus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2807', '160', 'AA', 'Aust-Agder');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2808', '160', 'BU', 'Buskerud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2809', '160', 'FM', 'Finnmark');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2810', '160', 'HM', 'Hedmark');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2811', '160', 'HL', 'Hordaland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2812', '160', 'MR', 'M&oslash;re og Romsdal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2813', '160', 'NL', 'Nordland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2814', '160', 'NT', 'Nord-Tr&oslash;ndelag');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2815', '160', 'OP', 'Oppland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2816', '160', 'OL', 'Oslo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2817', '160', 'RL', 'Rogaland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2818', '160', 'SJ', 'Sogn og Fjordane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2819', '160', 'ST', 'S&oslash;r-Tr&oslash;ndelag');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2820', '160', 'SV', 'Svalbard');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2821', '160', 'TM', 'Telemark');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2822', '160', 'TR', 'Troms');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2823', '160', 'VA', 'Vest-Agder');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2824', '160', 'VF', 'Vestfold');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2825', '160', 'OF', '&Oslash;stfold');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2826', '161', 'DA', 'Ad Dakhiliyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2827', '161', 'BA', 'Al Batinah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2828', '161', 'WU', 'Al Wusta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2829', '161', 'SH', 'Ash Sharqiyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2830', '161', 'ZA', 'Az Zahirah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2831', '161', 'MA', 'Masqat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2832', '161', 'MU', 'Musandam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2833', '161', 'ZU', 'Zufar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2834', '162', 'B', 'Balochistan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2835', '162', 'T', 'Federally Administered Tribal Ar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2836', '162', 'I', 'Islamabad Capital Territory');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2837', '162', 'N', 'North-West Frontier');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2838', '162', 'P', 'Punjab');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2839', '162', 'S', 'Sindh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2840', '163', 'AM', 'Aimeliik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2841', '163', 'AR', 'Airai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2842', '163', 'AN', 'Angaur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2843', '163', 'HA', 'Hatohobei');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2844', '163', 'KA', 'Kayangel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2845', '163', 'KO', 'Koror');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2846', '163', 'ME', 'Melekeok');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2847', '163', 'NA', 'Ngaraard');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2848', '163', 'NG', 'Ngarchelong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2849', '163', 'ND', 'Ngardmau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2850', '163', 'NT', 'Ngatpang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2851', '163', 'NC', 'Ngchesar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2852', '163', 'NR', 'Ngeremlengui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2853', '163', 'NW', 'Ngiwal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2854', '163', 'PE', 'Peleliu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2855', '163', 'SO', 'Sonsorol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2856', '164', 'BT', 'Bocas del Toro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2857', '164', 'CH', 'Chiriqui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2858', '164', 'CC', 'Cocle');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2859', '164', 'CL', 'Colon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2860', '164', 'DA', 'Darien');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2861', '164', 'HE', 'Herrera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2862', '164', 'LS', 'Los Santos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2863', '164', 'PA', 'Panama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2864', '164', 'SB', 'San Blas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2865', '164', 'VG', 'Veraguas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2866', '165', 'BV', 'Bougainville');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2867', '165', 'CE', 'Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2868', '165', 'CH', 'Chimbu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2869', '165', 'EH', 'Eastern Highlands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2870', '165', 'EB', 'East New Britain');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2871', '165', 'ES', 'East Sepik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2872', '165', 'EN', 'Enga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2873', '165', 'GU', 'Gulf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2874', '165', 'MD', 'Madang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2875', '165', 'MN', 'Manus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2876', '165', 'MB', 'Milne Bay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2877', '165', 'MR', 'Morobe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2878', '165', 'NC', 'National Capital');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2879', '165', 'NI', 'New Ireland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2880', '165', 'NO', 'Northern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2881', '165', 'SA', 'Sandaun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2882', '165', 'SH', 'Southern Highlands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2883', '165', 'WE', 'Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2884', '165', 'WH', 'Western Highlands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2885', '165', 'WB', 'West New Britain');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2886', '166', 'AG', 'Alto Paraguay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2887', '166', 'AN', 'Alto Parana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2888', '166', 'AM', 'Amambay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2889', '166', 'AS', 'Asuncion');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2890', '166', 'BO', 'Boqueron');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2891', '166', 'CG', 'Caaguazu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2892', '166', 'CZ', 'Caazapa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2893', '166', 'CN', 'Canindeyu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2894', '166', 'CE', 'Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2895', '166', 'CC', 'Concepcion');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2896', '166', 'CD', 'Cordillera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2897', '166', 'GU', 'Guaira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2898', '166', 'IT', 'Itapua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2899', '166', 'MI', 'Misiones');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2900', '166', 'NE', 'Neembucu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2901', '166', 'PA', 'Paraguari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2902', '166', 'PH', 'Presidente Hayes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2903', '166', 'SP', 'San Pedro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2904', '167', 'AM', 'Amazonas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2905', '167', 'AN', 'Ancash');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2906', '167', 'AP', 'Apurimac');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2907', '167', 'AR', 'Arequipa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2908', '167', 'AY', 'Ayacucho');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2909', '167', 'CJ', 'Cajamarca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2910', '167', 'CL', 'Callao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2911', '167', 'CU', 'Cusco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2912', '167', 'HV', 'Huancavelica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2913', '167', 'HO', 'Huanuco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2914', '167', 'IC', 'Ica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2915', '167', 'JU', 'Junin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2916', '167', 'LD', 'La Libertad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2917', '167', 'LY', 'Lambayeque');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2918', '167', 'LI', 'Lima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2919', '167', 'LO', 'Loreto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2920', '167', 'MD', 'Madre de Dios');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2921', '167', 'MO', 'Moquegua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2922', '167', 'PA', 'Pasco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2923', '167', 'PI', 'Piura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2924', '167', 'PU', 'Puno');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2925', '167', 'SM', 'San Martin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2926', '167', 'TA', 'Tacna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2927', '167', 'TU', 'Tumbes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2928', '167', 'UC', 'Ucayali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2929', '168', 'ABR', 'Abra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2930', '168', 'ANO', 'Agusan del Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2931', '168', 'ASU', 'Agusan del Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2932', '168', 'AKL', 'Aklan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2933', '168', 'ALB', 'Albay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2934', '168', 'ANT', 'Antique');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2935', '168', 'APY', 'Apayao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2936', '168', 'AUR', 'Aurora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2937', '168', 'BAS', 'Basilan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2938', '168', 'BTA', 'Bataan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2939', '168', 'BTE', 'Batanes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2940', '168', 'BTG', 'Batangas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2941', '168', 'BLR', 'Biliran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2942', '168', 'BEN', 'Benguet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2943', '168', 'BOL', 'Bohol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2944', '168', 'BUK', 'Bukidnon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2945', '168', 'BUL', 'Bulacan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2946', '168', 'CAG', 'Cagayan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2947', '168', 'CNO', 'Camarines Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2948', '168', 'CSU', 'Camarines Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2949', '168', 'CAM', 'Camiguin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2950', '168', 'CAP', 'Capiz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2951', '168', 'CAT', 'Catanduanes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2952', '168', 'CAV', 'Cavite');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2953', '168', 'CEB', 'Cebu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2954', '168', 'CMP', 'Compostela');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2955', '168', 'DNO', 'Davao del Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2956', '168', 'DSU', 'Davao del Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2957', '168', 'DOR', 'Davao Oriental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2958', '168', 'ESA', 'Eastern Samar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2959', '168', 'GUI', 'Guimaras');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2960', '168', 'IFU', 'Ifugao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2961', '168', 'INO', 'Ilocos Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2962', '168', 'ISU', 'Ilocos Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2963', '168', 'ILO', 'Iloilo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2964', '168', 'ISA', 'Isabela');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2965', '168', 'KAL', 'Kalinga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2966', '168', 'LAG', 'Laguna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2967', '168', 'LNO', 'Lanao del Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2968', '168', 'LSU', 'Lanao del Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2969', '168', 'UNI', 'La Union');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2970', '168', 'LEY', 'Leyte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2971', '168', 'MAG', 'Maguindanao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2972', '168', 'MRN', 'Marinduque');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2973', '168', 'MSB', 'Masbate');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2974', '168', 'MIC', 'Mindoro Occidental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2975', '168', 'MIR', 'Mindoro Oriental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2976', '168', 'MSC', 'Misamis Occidental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2977', '168', 'MOR', 'Misamis Oriental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2978', '168', 'MOP', 'Mountain');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2979', '168', 'NOC', 'Negros Occidental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2980', '168', 'NOR', 'Negros Oriental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2981', '168', 'NCT', 'North Cotabato');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2982', '168', 'NSM', 'Northern Samar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2983', '168', 'NEC', 'Nueva Ecija');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2984', '168', 'NVZ', 'Nueva Vizcaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2985', '168', 'PLW', 'Palawan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2986', '168', 'PMP', 'Pampanga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2987', '168', 'PNG', 'Pangasinan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2988', '168', 'QZN', 'Quezon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2989', '168', 'QRN', 'Quirino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2990', '168', 'RIZ', 'Rizal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2991', '168', 'ROM', 'Romblon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2992', '168', 'SMR', 'Samar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2993', '168', 'SRG', 'Sarangani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2994', '168', 'SQJ', 'Siquijor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2995', '168', 'SRS', 'Sorsogon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2996', '168', 'SCO', 'South Cotabato');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2997', '168', 'SLE', 'Southern Leyte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2998', '168', 'SKU', 'Sultan Kudarat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2999', '168', 'SLU', 'Sulu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3000', '168', 'SNO', 'Surigao del Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3001', '168', 'SSU', 'Surigao del Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3002', '168', 'TAR', 'Tarlac');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3003', '168', 'TAW', 'Tawi-Tawi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3004', '168', 'ZBL', 'Zambales');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3005', '168', 'ZNO', 'Zamboanga del Norte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3006', '168', 'ZSU', 'Zamboanga del Sur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3007', '168', 'ZSI', 'Zamboanga Sibugay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3008', '169', 'PIT', 'Pitcairn Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3009', '170', 'DO', 'Dolnoslaskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3010', '170', 'KP', 'Kujawsko-Pomorskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3011', '170', 'LO', 'Lodzkie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3012', '170', 'LL', 'Lubelskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3013', '170', 'LU', 'Lubuskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3014', '170', 'ML', 'Malopolskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3015', '170', 'MZ', 'Mazowieckie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3016', '170', 'OP', 'Opolskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3017', '170', 'PP', 'Podkarpackie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3018', '170', 'PL', 'Podlaskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3019', '170', 'PM', 'Pomorskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3020', '170', 'SL', 'Slaskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3021', '170', 'SW', 'Swietokrzyskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3022', '170', 'WM', 'Warminsko-Mazurskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3023', '170', 'WP', 'Wielkopolskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3024', '170', 'ZA', 'Zachodniopomorskie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3025', '171', 'AC', 'A&ccedil;ores');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3026', '171', 'AV', 'Aveiro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3027', '171', 'BE', 'Beja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3028', '171', 'BR', 'Braga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3029', '171', 'BA', 'Bragan&ccedil;a');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3030', '171', 'CB', 'Castelo Branco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3031', '171', 'CO', 'Coimbra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3032', '171', 'EV', '&Eacute;vora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3033', '171', 'FA', 'Faro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3034', '171', 'GU', 'Guarda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3035', '171', 'LE', 'Leiria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3036', '171', 'LI', 'Lisboa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3037', '171', 'ME', 'Madeira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3038', '171', 'PO', 'Portalegre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3039', '171', 'PR', 'Porto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3040', '171', 'SA', 'Santar&eacute;m');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3041', '171', 'SE', 'Set&uacute;bal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3042', '171', 'VC', 'Viana do Castelo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3043', '171', 'VR', 'Vila Real');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3044', '171', 'VI', 'Viseu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3045', '172', 'ADJ', 'Adjuntas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3046', '172', 'AGU', 'Aguada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3047', '172', 'AGU', 'Aguadilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3048', '172', 'AGU', 'Aguas Buenas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3049', '172', 'AIB', 'Aibonito');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3050', '172', 'A-A', 'Añasco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3051', '172', 'ARE', 'Arecibo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3052', '172', 'ARR', 'Arroyo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3053', '172', 'BAR', 'Barceloneta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3054', '172', 'BAR', 'Barranquitas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3055', '172', 'BAY', 'Bayam&oacute;n');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3056', '172', 'CAB', 'Cabo Rojo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3057', '172', 'CAG', 'Caguas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3058', '172', 'CAM', 'Camuy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3059', '172', 'CAN', 'Can&oacute;vanas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3060', '172', 'CAR', 'Carolina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3061', '172', 'CAT', 'Cata&ntilde;o');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3062', '172', 'CAY', 'Cayey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3063', '172', 'CEI', 'Ceiba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3064', '172', 'CIA', 'Ciales');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3065', '172', 'CID', 'Cidra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3066', '172', 'COA', 'Coamo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3067', '172', 'COM', 'Comer&iacute;o');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3068', '172', 'COR', 'Corozal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3069', '172', 'CUL', 'Culebra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3070', '172', 'DOR', 'Dorado');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3071', '172', 'FAJ', 'Fajardo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3072', '172', 'FLO', 'Florida.');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3073', '172', 'GU¡', 'Guánica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3074', '172', 'GUA', 'Guayama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3075', '172', 'GUA', 'Guayanilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3076', '172', 'GUA', 'Guaynabo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3077', '172', 'GUR', 'Gurabo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3078', '172', 'HAT', 'Hatillo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3079', '172', 'HOR', 'Hormigueros');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3080', '172', 'HUM', 'Humacao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3081', '172', 'ISA', 'Isabela');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3082', '172', 'JAY', 'Jayuya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3083', '172', 'JUA', 'Juana D&iacute;az');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3084', '172', 'JUN', 'Juncos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3085', '172', 'LAJ', 'Lajas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3086', '172', 'LAR', 'Lares');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3087', '172', 'LAS', 'Las Mar&iacute;as');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3088', '172', 'LAS', 'Las Piedras');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3089', '172', 'LOÕ', 'Loíza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3090', '172', 'LUQ', 'Luquillo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3091', '172', 'MAN', 'Manat&iacute;');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3092', '172', 'MAR', 'Maricao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3093', '172', 'MAU', 'Maunabo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3094', '172', 'MAY', 'Mayagüez');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3095', '172', 'MOC', 'Moca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3096', '172', 'MOR', 'Morovis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3097', '172', 'NAG', 'Naguabo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3098', '172', 'NAR', 'Naranjito');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3099', '172', 'ORO', 'Orocovis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3100', '172', 'PAT', 'Patillas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3101', '172', 'PE-', 'Peñuelas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3102', '172', 'PON', 'Ponce');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3103', '172', 'QUE', 'Quebradillas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3104', '172', 'RIN', 'Rinc&oacute;n');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3105', '172', 'RÕO', 'Río Grande');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3106', '172', 'SAB', 'Sabana Grande');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3107', '172', 'SAL', 'Salinas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3108', '172', 'SAN', 'San Germ&aacute;n');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3109', '172', 'SAN', 'San Juan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3110', '172', 'SAN', 'San Lorenzo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3111', '172', 'SAN', 'San Sebasti&aacute;n');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3112', '172', 'SAN', 'Santa Isabel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3113', '172', 'TOA', 'Toa Alta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3114', '172', 'TOA', 'Toa Baja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3115', '172', 'TRU', 'Trujillo Alto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3116', '172', 'UTU', 'Utuado');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3117', '172', 'VEG', 'Vega Alta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3118', '172', 'VEG', 'Vega Baja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3119', '172', 'VIE', 'Vieques');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3120', '172', 'VIL', 'Villalba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3121', '172', 'YAB', 'Yabucoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3122', '172', 'YAU', 'Yauco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3123', '173', 'DW', 'Ad Dawhah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3124', '173', 'GW', 'Al Ghuwayriyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3125', '173', 'JM', 'Al Jumayliyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3126', '173', 'KR', 'Al Khawr');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3127', '173', 'WK', 'Al Wakrah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3128', '173', 'RN', 'Ar Rayyan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3129', '173', 'JB', 'Jarayan al Batinah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3130', '173', 'MS', 'Madinat ash Shamal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3131', '173', 'UD', 'Umm Sa\'id');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3132', '173', 'UL', 'Umm Salal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3133', '175', 'AB', 'Alba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3134', '175', 'AR', 'Arad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3135', '175', 'AG', 'Arges');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3136', '175', 'BC', 'Bacau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3137', '175', 'BH', 'Bihor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3138', '175', 'BN', 'Bistrita-Nasaud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3139', '175', 'BT', 'Botosani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3140', '175', 'BV', 'Brasov');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3141', '175', 'BR', 'Braila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3142', '175', 'B', 'Bucuresti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3143', '175', 'BZ', 'Buzau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3144', '175', 'CS', 'Caras-Severin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3145', '175', 'CL', 'Calarasi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3146', '175', 'CJ', 'Cluj');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3147', '175', 'CT', 'Constanta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3148', '175', 'CV', 'Covasna');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3149', '175', 'DB', 'Dimbovita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3150', '175', 'DJ', 'Dolj');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3151', '175', 'GL', 'Galati');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3152', '175', 'GR', 'Giurgiu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3153', '175', 'GJ', 'Gorj');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3154', '175', 'HR', 'Harghita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3155', '175', 'HD', 'Hunedoara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3156', '175', 'IL', 'Ialomita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3157', '175', 'IS', 'Iasi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3158', '175', 'IF', 'Ilfov');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3159', '175', 'MM', 'Maramures');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3160', '175', 'MH', 'Mehedinti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3161', '175', 'MS', 'Mures');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3162', '175', 'NT', 'Neamt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3163', '175', 'OT', 'Olt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3164', '175', 'PH', 'Prahova');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3165', '175', 'SM', 'Satu-Mare');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3166', '175', 'SJ', 'Salaj');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3167', '175', 'SB', 'Sibiu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3168', '175', 'SV', 'Suceava');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3169', '175', 'TR', 'Teleorman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3170', '175', 'TM', 'Timis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3171', '175', 'TL', 'Tulcea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3172', '175', 'VS', 'Vaslui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3173', '175', 'VL', 'Valcea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3174', '175', 'VN', 'Vrancea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3175', '176', 'AB', 'Abakan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3176', '176', 'AG', 'Aginskoye');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3177', '176', 'AN', 'Anadyr');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3178', '176', 'AR', 'Arkahangelsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3179', '176', 'AS', 'Astrakhan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3180', '176', 'BA', 'Barnaul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3181', '176', 'BE', 'Belgorod');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3182', '176', 'BI', 'Birobidzhan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3183', '176', 'BL', 'Blagoveshchensk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3184', '176', 'BR', 'Bryansk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3185', '176', 'CH', 'Cheboksary');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3186', '176', 'CL', 'Chelyabinsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3187', '176', 'CR', 'Cherkessk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3188', '176', 'CI', 'Chita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3189', '176', 'DU', 'Dudinka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3190', '176', 'EL', 'Elista');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3191', '176', 'GO', 'Gomo-Altaysk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3192', '176', 'GA', 'Gorno-Altaysk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3193', '176', 'GR', 'Groznyy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3194', '176', 'IR', 'Irkutsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3195', '176', 'IV', 'Ivanovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3196', '176', 'IZ', 'Izhevsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3197', '176', 'KA', 'Kalinigrad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3198', '176', 'KL', 'Kaluga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3199', '176', 'KS', 'Kasnodar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3200', '176', 'KZ', 'Kazan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3201', '176', 'KE', 'Kemerovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3202', '176', 'KH', 'Khabarovsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3203', '176', 'KM', 'Khanty-Mansiysk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3204', '176', 'KO', 'Kostroma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3205', '176', 'KR', 'Krasnodar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3206', '176', 'KN', 'Krasnoyarsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3207', '176', 'KU', 'Kudymkar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3208', '176', 'KG', 'Kurgan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3209', '176', 'KK', 'Kursk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3210', '176', 'KY', 'Kyzyl');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3211', '176', 'LI', 'Lipetsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3212', '176', 'MA', 'Magadan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3213', '176', 'MK', 'Makhachkala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3214', '176', 'MY', 'Maykop');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3215', '176', 'MO', 'Moscow');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3216', '176', 'MU', 'Murmansk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3217', '176', 'NA', 'Nalchik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3218', '176', 'NR', 'Naryan Mar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3219', '176', 'NZ', 'Nazran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3220', '176', 'NI', 'Nizhniy Novgorod');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3221', '176', 'NO', 'Novgorod');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3222', '176', 'NV', 'Novosibirsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3223', '176', 'OM', 'Omsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3224', '176', 'OR', 'Orel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3225', '176', 'OE', 'Orenburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3226', '176', 'PA', 'Palana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3227', '176', 'PE', 'Penza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3228', '176', 'PR', 'Perm');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3229', '176', 'PK', 'Petropavlovsk-Kamchatskiy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3230', '176', 'PT', 'Petrozavodsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3231', '176', 'PS', 'Pskov');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3232', '176', 'RO', 'Rostov-na-Donu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3233', '176', 'RY', 'Ryazan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3234', '176', 'SL', 'Salekhard');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3235', '176', 'SA', 'Samara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3236', '176', 'SR', 'Saransk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3237', '176', 'SV', 'Saratov');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3238', '176', 'SM', 'Smolensk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3239', '176', 'SP', 'St. Petersburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3240', '176', 'ST', 'Stavropol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3241', '176', 'SY', 'Syktyvkar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3242', '176', 'TA', 'Tambov');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3243', '176', 'TO', 'Tomsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3244', '176', 'TU', 'Tula');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3245', '176', 'TR', 'Tura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3246', '176', 'TV', 'Tver');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3247', '176', 'TY', 'Tyumen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3248', '176', 'UF', 'Ufa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3249', '176', 'UL', 'Ul\'yanovsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3250', '176', 'UU', 'Ulan-Ude');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3251', '176', 'US', 'Ust\'-Ordynskiy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3252', '176', 'VL', 'Vladikavkaz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3253', '176', 'VA', 'Vladimir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3254', '176', 'VV', 'Vladivostok');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3255', '176', 'VG', 'Volgograd');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3256', '176', 'VD', 'Vologda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3257', '176', 'VO', 'Voronezh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3258', '176', 'VY', 'Vyatka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3259', '176', 'YA', 'Yakutsk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3260', '176', 'YR', 'Yaroslavl');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3261', '176', 'YE', 'Yekaterinburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3262', '176', 'YO', 'Yoshkar-Ola');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3263', '177', 'BU', 'Butare');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3264', '177', 'BY', 'Byumba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3265', '177', 'CY', 'Cyangugu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3266', '177', 'GK', 'Gikongoro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3267', '177', 'GS', 'Gisenyi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3268', '177', 'GT', 'Gitarama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3269', '177', 'KG', 'Kibungo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3270', '177', 'KY', 'Kibuye');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3271', '177', 'KR', 'Kigali Rurale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3272', '177', 'KV', 'Kigali-ville');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3273', '177', 'RU', 'Ruhengeri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3274', '177', 'UM', 'Umutara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3275', '178', 'CCN', 'Christ Church Nichola Town');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3276', '178', 'SAS', 'Saint Anne Sandy Point');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3277', '178', 'SGB', 'Saint George Basseterre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3278', '178', 'SGG', 'Saint George Gingerland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3279', '178', 'SJW', 'Saint James Windward');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3280', '178', 'SJC', 'Saint John Capesterre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3281', '178', 'SJF', 'Saint John Figtree');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3282', '178', 'SMC', 'Saint Mary Cayon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3283', '178', 'CAP', 'Saint Paul Capesterre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3284', '178', 'CHA', 'Saint Paul Charlestown');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3285', '178', 'SPB', 'Saint Peter Basseterre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3286', '178', 'STL', 'Saint Thomas Lowland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3287', '178', 'STM', 'Saint Thomas Middle Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3288', '178', 'TPP', 'Trinity Palmetto Point');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3289', '179', 'AR', 'Anse-la-Raye');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3290', '179', 'CA', 'Castries');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3291', '179', 'CH', 'Choiseul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3292', '179', 'DA', 'Dauphin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3293', '179', 'DE', 'Dennery');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3294', '179', 'GI', 'Gros-Islet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3295', '179', 'LA', 'Laborie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3296', '179', 'MI', 'Micoud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3297', '179', 'PR', 'Praslin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3298', '179', 'SO', 'Soufriere');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3299', '179', 'VF', 'Vieux-Fort');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3300', '180', 'C', 'Charlotte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3301', '180', 'R', 'Grenadines');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3302', '180', 'A', 'Saint Andrew');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3303', '180', 'D', 'Saint David');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3304', '180', 'G', 'Saint George');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3305', '180', 'P', 'Saint Patrick');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3306', '181', 'AN', 'A\'ana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3307', '181', 'AI', 'Aiga-i-le-Tai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3308', '181', 'AT', 'Atua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3309', '181', 'FA', 'Fa\'asaleleaga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3310', '181', 'GE', 'Gaga\'emauga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3311', '181', 'GF', 'Gagaifomauga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3312', '181', 'PA', 'Palauli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3313', '181', 'SA', 'Satupa\'itea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3314', '181', 'TU', 'Tuamasaga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3315', '181', 'VF', 'Va\'a-o-Fonoti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3316', '181', 'VS', 'Vaisigano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3317', '182', 'AC', 'Acquaviva');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3318', '182', 'BM', 'Borgo Maggiore');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3319', '182', 'CH', 'Chiesanuova');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3320', '182', 'DO', 'Domagnano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3321', '182', 'FA', 'Faetano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3322', '182', 'FI', 'Fiorentino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3323', '182', 'MO', 'Montegiardino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3324', '182', 'SM', 'Citta di San Marino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3325', '182', 'SE', 'Serravalle');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3326', '183', 'S', 'Sao Tome');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3327', '183', 'P', 'Principe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3328', '184', 'BH', 'Al Bahah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3329', '184', 'HS', 'Al Hudud ash Shamaliyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3330', '184', 'JF', 'Al Jawf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3331', '184', 'MD', 'Al Madinah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3332', '184', 'QS', 'Al Qasim');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3333', '184', 'RD', 'Ar Riyad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3334', '184', 'AQ', 'Ash Sharqiyah (Eastern)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3335', '184', 'AS', '\'Asir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3336', '184', 'HL', 'Ha\'il');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3337', '184', 'JZ', 'Jizan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3338', '184', 'ML', 'Makkah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3339', '184', 'NR', 'Najran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3340', '184', 'TB', 'Tabuk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3341', '185', 'DA', 'Dakar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3342', '185', 'DI', 'Diourbel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3343', '185', 'FA', 'Fatick');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3344', '185', 'KA', 'Kaolack');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3345', '185', 'KO', 'Kolda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3346', '185', 'LO', 'Louga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3347', '185', 'MA', 'Matam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3348', '185', 'SL', 'Saint-Louis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3349', '185', 'TA', 'Tambacounda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3350', '185', 'TH', 'Thies');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3351', '185', 'ZI', 'Ziguinchor');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3352', '186', 'AP', 'Anse aux Pins');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3353', '186', 'AB', 'Anse Boileau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3354', '186', 'AE', 'Anse Etoile');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3355', '186', 'AL', 'Anse Louis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3356', '186', 'AR', 'Anse Royale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3357', '186', 'BL', 'Baie Lazare');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3358', '186', 'BS', 'Baie Sainte Anne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3359', '186', 'BV', 'Beau Vallon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3360', '186', 'BA', 'Bel Air');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3361', '186', 'BO', 'Bel Ombre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3362', '186', 'CA', 'Cascade');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3363', '186', 'GL', 'Glacis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3364', '186', 'GM', 'Grand\' Anse (on Mahe)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3365', '186', 'GP', 'Grand\' Anse (on Praslin)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3366', '186', 'DG', 'La Digue');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3367', '186', 'RA', 'La Riviere Anglaise');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3368', '186', 'MB', 'Mont Buxton');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3369', '186', 'MF', 'Mont Fleuri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3370', '186', 'PL', 'Plaisance');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3371', '186', 'PR', 'Pointe La Rue');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3372', '186', 'PG', 'Port Glaud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3373', '186', 'SL', 'Saint Louis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3374', '186', 'TA', 'Takamaka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3375', '187', 'E', 'Eastern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3376', '187', 'N', 'Northern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3377', '187', 'S', 'Southern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3378', '187', 'W', 'Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3379', '189', 'BA', 'Banskobystricky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3380', '189', 'BR', 'Bratislavsky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3381', '189', 'KO', 'Kosicky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3382', '189', 'NI', 'Nitriansky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3383', '189', 'PR', 'Presovsky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3384', '189', 'TC', 'Trenciansky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3385', '189', 'TV', 'Trnavsky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3386', '189', 'ZI', 'Zilinsky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3387', '190', '4', 'Å tajerska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3388', '190', '2A', 'Gorenjska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3389', '190', '5', 'Prekmurje');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3390', '190', '3', 'Koroška');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3391', '190', '2B', 'Notranjska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3392', '190', '1', 'Primorska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3393', '190', '2C', 'Dolenjska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3394', '190', '2C', 'Bela Krajina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3395', '191', 'CE', 'Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3396', '191', 'CH', 'Choiseul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3397', '191', 'GC', 'Guadalcanal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3398', '191', 'HO', 'Honiara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3399', '191', 'IS', 'Isabel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3400', '191', 'MK', 'Makira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3401', '191', 'ML', 'Malaita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3402', '191', 'RB', 'Rennell and Bellona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3403', '191', 'TM', 'Temotu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3404', '191', 'WE', 'Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3405', '192', 'AW', 'Awdal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3406', '192', 'BK', 'Bakool');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3407', '192', 'BN', 'Banaadir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3408', '192', 'BR', 'Bari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3409', '192', 'BY', 'Bay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3410', '192', 'GA', 'Galguduud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3411', '192', 'GE', 'Gedo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3412', '192', 'HI', 'Hiiraan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3413', '192', 'JD', 'Jubbada Dhexe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3414', '192', 'JH', 'Jubbada Hoose');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3415', '192', 'MU', 'Mudug');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3416', '192', 'NU', 'Nugaal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3417', '192', 'SA', 'Sanaag');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3418', '192', 'SD', 'Shabeellaha Dhexe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3419', '192', 'SH', 'Shabeellaha Hoose');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3420', '192', 'SL', 'Sool');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3421', '192', 'TO', 'Togdheer');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3422', '192', 'WG', 'Woqooyi Galbeed');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3423', '193', 'EC', 'Eastern Cape');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3424', '193', 'FS', 'Free State');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3425', '193', 'GT', 'Gauteng');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3426', '193', 'KN', 'KwaZulu-Natal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3427', '193', 'LP', 'Limpopo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3428', '193', 'MP', 'Mpumalanga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3429', '193', 'NW', 'North West');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3430', '193', 'NC', 'Northern Cape');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3431', '193', 'WC', 'Western Cape');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3432', '195', 'CA', 'La Coru&ntilde;a');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3433', '195', 'AL', '&Aacute;lava');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3434', '195', 'AB', 'Albacete');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3435', '195', 'AC', 'Alicante');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3436', '195', 'AM', 'Almeria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3437', '195', 'AS', 'Asturias');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3438', '195', 'AV', '&Aacute;vila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3439', '195', 'BJ', 'Badajoz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3440', '195', 'IB', 'Baleares');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3441', '195', 'BA', 'Barcelona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3442', '195', 'BU', 'Burgos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3443', '195', 'CC', 'C&aacute;ceres');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3444', '195', 'CZ', 'C&aacute;diz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3445', '195', 'CT', 'Cantabria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3446', '195', 'CL', 'Castell&oacute;n');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3447', '195', 'CE', 'Ceuta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3448', '195', 'CR', 'Ciudad Real');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3449', '195', 'CD', 'C&oacute;rdoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3450', '195', 'CU', 'Cuenca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3451', '195', 'GI', 'Gerona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3452', '195', 'GD', 'Granada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3453', '195', 'GJ', 'Guadalajara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3454', '195', 'GP', 'Guip&uacute;zcoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3455', '195', 'HL', 'Huelva');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3456', '195', 'HS', 'Huesca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3457', '195', 'JN', 'Ja&eacute;n');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3458', '195', 'RJ', 'La Rioja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3459', '195', 'PM', 'Las Palmas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3460', '195', 'LE', 'Le&oacute;n');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3461', '195', 'LL', 'L&eacute;rida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3462', '195', 'LG', 'Lugo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3463', '195', 'MD', 'Madrid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3464', '195', 'MA', 'M&aacute;laga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3465', '195', 'ML', 'Melilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3466', '195', 'MU', 'Murcia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3467', '195', 'NV', 'Navarra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3468', '195', 'OU', 'Ourense');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3469', '195', 'PL', 'Palencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3470', '195', 'PO', 'Pontevedra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3471', '195', 'SL', 'Salamanca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3472', '195', 'SC', 'Santa Cruz de Tenerife');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3473', '195', 'SG', 'Segovia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3474', '195', 'SV', 'Sevilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3475', '195', 'SO', 'Soria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3476', '195', 'TA', 'Tarragona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3477', '195', 'TE', 'Teruel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3478', '195', 'TO', 'Toledo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3479', '195', 'VC', 'Valencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3480', '195', 'VD', 'Valladolid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3481', '195', 'VZ', 'Vizcaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3482', '195', 'ZM', 'Zamora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3483', '195', 'ZR', 'Zaragoza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3484', '196', 'CE', 'Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3485', '196', 'EA', 'Eastern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3486', '196', 'NC', 'North Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3487', '196', 'NO', 'Northern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3488', '196', 'NW', 'North Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3489', '196', 'SA', 'Sabaragamuwa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3490', '196', 'SO', 'Southern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3491', '196', 'UV', 'Uva');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3492', '196', 'WE', 'Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3493', '197', 'A', 'Ascension');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3494', '197', 'S', 'Saint Helena');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3495', '197', 'T', 'Tristan da Cunha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3496', '198', 'P', 'Saint Pierre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3497', '198', 'M', 'Miquelon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3498', '199', 'ANL', 'A\'ali an Nil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3499', '199', 'BAM', 'Al Bahr al Ahmar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3500', '199', 'BRT', 'Al Buhayrat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3501', '199', 'JZR', 'Al Jazirah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3502', '199', 'KRT', 'Al Khartum');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3503', '199', 'QDR', 'Al Qadarif');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3504', '199', 'WDH', 'Al Wahdah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3505', '199', 'ANB', 'An Nil al Abyad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3506', '199', 'ANZ', 'An Nil al Azraq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3507', '199', 'ASH', 'Ash Shamaliyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3508', '199', 'BJA', 'Bahr al Jabal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3509', '199', 'GIS', 'Gharb al Istiwa\'iyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3510', '199', 'GBG', 'Gharb Bahr al Ghazal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3511', '199', 'GDA', 'Gharb Darfur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3512', '199', 'GKU', 'Gharb Kurdufan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3513', '199', 'JDA', 'Janub Darfur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3514', '199', 'JKU', 'Janub Kurdufan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3515', '199', 'JQL', 'Junqali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3516', '199', 'KSL', 'Kassala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3517', '199', 'NNL', 'Nahr an Nil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3518', '199', 'SBG', 'Shamal Bahr al Ghazal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3519', '199', 'SDA', 'Shamal Darfur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3520', '199', 'SKU', 'Shamal Kurdufan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3521', '199', 'SIS', 'Sharq al Istiwa\'iyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3522', '199', 'SNR', 'Sinnar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3523', '199', 'WRB', 'Warab');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3524', '200', 'BR', 'Brokopondo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3525', '200', 'CM', 'Commewijne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3526', '200', 'CR', 'Coronie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3527', '200', 'MA', 'Marowijne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3528', '200', 'NI', 'Nickerie');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3529', '200', 'PA', 'Para');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3530', '200', 'PM', 'Paramaribo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3531', '200', 'SA', 'Saramacca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3532', '200', 'SI', 'Sipaliwini');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3533', '200', 'WA', 'Wanica');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3534', '202', 'H', 'Hhohho');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3535', '202', 'L', 'Lubombo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3536', '202', 'M', 'Manzini');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3537', '202', 'S', 'Shishelweni');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3538', '203', 'K', 'Blekinge');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3539', '203', 'W', 'Dalama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3540', '203', 'I', 'Gotland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3541', '203', 'X', 'Gävleborg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3542', '203', 'N', 'Halland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3543', '203', 'Z', 'Jämtland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3544', '203', 'F', 'Jönköping');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3545', '203', 'H', 'Kalmar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3546', '203', 'G', 'Kronoberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3547', '203', 'BD', 'Norrbotten');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3548', '203', 'M', 'Sk&aring;ne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3549', '203', 'AB', 'Stockholm');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3550', '203', 'D', 'Södermanland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3551', '203', 'C', 'Uppsala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3552', '203', 'S', 'Värmland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3553', '203', 'AC', 'Västerbotten');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3554', '203', 'Y', 'Västernorrland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3555', '203', 'U', 'Västmanland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3556', '203', 'O', 'Västra Götaland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3557', '203', 'T', 'Örebro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3558', '203', 'E', 'Östergötland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3559', '204', 'AG', 'Aargau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3560', '204', 'AR', 'Appenzell Ausserrhoden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3561', '204', 'AI', 'Appenzell Innerrhoden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3562', '204', 'BS', 'Basel-Stadt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3563', '204', 'BL', 'Basel-Landschaft');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3564', '204', 'BE', 'Bern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3565', '204', 'FR', 'Fribourg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3566', '204', 'GE', 'Gen&egrave;ve');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3567', '204', 'GL', 'Glarus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3568', '204', 'GR', 'Graubünden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3569', '204', 'JU', 'Jura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3570', '204', 'LU', 'Lucerne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3571', '204', 'NE', 'Neuch&acirc;tel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3572', '204', 'NW', 'Nidwalden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3573', '204', 'OW', 'Obwalden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3574', '204', 'SG', 'St. Gallen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3575', '204', 'SH', 'Schaffhausen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3576', '204', 'SZ', 'Schwyz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3577', '204', 'SO', 'Solothurn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3578', '204', 'TG', 'Thurgau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3579', '204', 'TI', 'Ticino');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3580', '204', 'UR', 'Uri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3581', '204', 'VS', 'Valais');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3582', '204', 'VD', 'Vaud');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3583', '204', 'ZG', 'Zug');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3584', '204', 'ZH', 'Zürich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3585', '205', 'HA', 'Al Hasakah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3586', '205', 'LA', 'Al Ladhiqiyah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3587', '205', 'QU', 'Al Qunaytirah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3588', '205', 'RQ', 'Ar Raqqah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3589', '205', 'SU', 'As Suwayda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3590', '205', 'DA', 'Dara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3591', '205', 'DZ', 'Dayr az Zawr');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3592', '205', 'DI', 'Dimashq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3593', '205', 'HL', 'Halab');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3594', '205', 'HM', 'Hamah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3595', '205', 'HI', 'Hims');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3596', '205', 'ID', 'Idlib');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3597', '205', 'RD', 'Rif Dimashq');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3598', '205', 'TA', 'Tartus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3599', '206', 'CH', 'Chang-hua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3600', '206', 'CI', 'Chia-i');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3601', '206', 'HS', 'Hsin-chu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3602', '206', 'HL', 'Hua-lien');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3603', '206', 'IL', 'I-lan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3604', '206', 'KH', 'Kao-hsiung county');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3605', '206', 'KM', 'Kin-men');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3606', '206', 'LC', 'Lien-chiang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3607', '206', 'ML', 'Miao-li');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3608', '206', 'NT', 'Nan-t\'ou');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3609', '206', 'PH', 'P\'eng-hu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3610', '206', 'PT', 'P\'ing-tung');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3611', '206', 'TG', 'T\'ai-chung');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3612', '206', 'TA', 'T\'ai-nan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3613', '206', 'TP', 'T\'ai-pei county');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3614', '206', 'TT', 'T\'ai-tung');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3615', '206', 'TY', 'T\'ao-yuan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3616', '206', 'YL', 'Yun-lin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3617', '206', 'CC', 'Chia-i city');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3618', '206', 'CL', 'Chi-lung');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3619', '206', 'HC', 'Hsin-chu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3620', '206', 'TH', 'T\'ai-chung');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3621', '206', 'TN', 'T\'ai-nan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3622', '206', 'KC', 'Kao-hsiung city');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3623', '206', 'TC', 'T\'ai-pei city');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3624', '207', 'GB', 'Gorno-Badakhstan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3625', '207', 'KT', 'Khatlon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3626', '207', 'SU', 'Sughd');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3627', '208', 'AR', 'Arusha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3628', '208', 'DS', 'Dar es Salaam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3629', '208', 'DO', 'Dodoma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3630', '208', 'IR', 'Iringa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3631', '208', 'KA', 'Kagera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3632', '208', 'KI', 'Kigoma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3633', '208', 'KJ', 'Kilimanjaro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3634', '208', 'LN', 'Lindi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3635', '208', 'MY', 'Manyara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3636', '208', 'MR', 'Mara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3637', '208', 'MB', 'Mbeya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3638', '208', 'MO', 'Morogoro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3639', '208', 'MT', 'Mtwara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3640', '208', 'MW', 'Mwanza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3641', '208', 'PN', 'Pemba North');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3642', '208', 'PS', 'Pemba South');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3643', '208', 'PW', 'Pwani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3644', '208', 'RK', 'Rukwa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3645', '208', 'RV', 'Ruvuma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3646', '208', 'SH', 'Shinyanga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3647', '208', 'SI', 'Singida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3648', '208', 'TB', 'Tabora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3649', '208', 'TN', 'Tanga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3650', '208', 'ZC', 'Zanzibar Central/South');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3651', '208', 'ZN', 'Zanzibar North');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3652', '208', 'ZU', 'Zanzibar Urban/West');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3653', '209', 'Amnat Charoen', 'Amnat Charoen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3654', '209', 'Ang Thong', 'Ang Thong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3655', '209', 'Ayutthaya', 'Ayutthaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3656', '209', 'Bangkok', 'Bangkok');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3657', '209', 'Buriram', 'Buriram');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3658', '209', 'Chachoengsao', 'Chachoengsao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3659', '209', 'Chai Nat', 'Chai Nat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3660', '209', 'Chaiyaphum', 'Chaiyaphum');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3661', '209', 'Chanthaburi', 'Chanthaburi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3662', '209', 'Chiang Mai', 'Chiang Mai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3663', '209', 'Chiang Rai', 'Chiang Rai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3664', '209', 'Chon Buri', 'Chon Buri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3665', '209', 'Chumphon', 'Chumphon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3666', '209', 'Kalasin', 'Kalasin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3667', '209', 'Kamphaeng Phet', 'Kamphaeng Phet');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3668', '209', 'Kanchanaburi', 'Kanchanaburi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3669', '209', 'Khon Kaen', 'Khon Kaen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3670', '209', 'Krabi', 'Krabi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3671', '209', 'Lampang', 'Lampang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3672', '209', 'Lamphun', 'Lamphun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3673', '209', 'Loei', 'Loei');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3674', '209', 'Lop Buri', 'Lop Buri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3675', '209', 'Mae Hong Son', 'Mae Hong Son');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3676', '209', 'Maha Sarakham', 'Maha Sarakham');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3677', '209', 'Mukdahan', 'Mukdahan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3678', '209', 'Nakhon Nayok', 'Nakhon Nayok');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3679', '209', 'Nakhon Pathom', 'Nakhon Pathom');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3680', '209', 'Nakhon Phanom', 'Nakhon Phanom');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3681', '209', 'Nakhon Ratchasima', 'Nakhon Ratchasima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3682', '209', 'Nakhon Sawan', 'Nakhon Sawan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3683', '209', 'Nakhon Si Thammarat', 'Nakhon Si Thammarat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3684', '209', 'Nan', 'Nan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3685', '209', 'Narathiwat', 'Narathiwat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3686', '209', 'Nong Bua Lamphu', 'Nong Bua Lamphu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3687', '209', 'Nong Khai', 'Nong Khai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3688', '209', 'Nonthaburi', 'Nonthaburi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3689', '209', 'Pathum Thani', 'Pathum Thani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3690', '209', 'Pattani', 'Pattani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3691', '209', 'Phangnga', 'Phangnga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3692', '209', 'Phatthalung', 'Phatthalung');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3693', '209', 'Phayao', 'Phayao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3694', '209', 'Phetchabun', 'Phetchabun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3695', '209', 'Phetchaburi', 'Phetchaburi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3696', '209', 'Phichit', 'Phichit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3697', '209', 'Phitsanulok', 'Phitsanulok');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3698', '209', 'Phrae', 'Phrae');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3699', '209', 'Phuket', 'Phuket');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3700', '209', 'Prachin Buri', 'Prachin Buri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3701', '209', 'Prachuap Khiri Khan', 'Prachuap Khiri Khan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3702', '209', 'Ranong', 'Ranong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3703', '209', 'Ratchaburi', 'Ratchaburi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3704', '209', 'Rayong', 'Rayong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3705', '209', 'Roi Et', 'Roi Et');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3706', '209', 'Sa Kaeo', 'Sa Kaeo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3707', '209', 'Sakon Nakhon', 'Sakon Nakhon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3708', '209', 'Samut Prakan', 'Samut Prakan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3709', '209', 'Samut Sakhon', 'Samut Sakhon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3710', '209', 'Samut Songkhram', 'Samut Songkhram');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3711', '209', 'Sara Buri', 'Sara Buri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3712', '209', 'Satun', 'Satun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3713', '209', 'Sing Buri', 'Sing Buri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3714', '209', 'Sisaket', 'Sisaket');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3715', '209', 'Songkhla', 'Songkhla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3716', '209', 'Sukhothai', 'Sukhothai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3717', '209', 'Suphan Buri', 'Suphan Buri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3718', '209', 'Surat Thani', 'Surat Thani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3719', '209', 'Surin', 'Surin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3720', '209', 'Tak', 'Tak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3721', '209', 'Trang', 'Trang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3722', '209', 'Trat', 'Trat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3723', '209', 'Ubon Ratchathani', 'Ubon Ratchathani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3724', '209', 'Udon Thani', 'Udon Thani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3725', '209', 'Uthai Thani', 'Uthai Thani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3726', '209', 'Uttaradit', 'Uttaradit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3727', '209', 'Yala', 'Yala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3728', '209', 'Yasothon', 'Yasothon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3729', '210', 'K', 'Kara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3730', '210', 'P', 'Plateaux');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3731', '210', 'S', 'Savanes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3732', '210', 'C', 'Centrale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3733', '210', 'M', 'Maritime');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3734', '211', 'A', 'Atafu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3735', '211', 'F', 'Fakaofo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3736', '211', 'N', 'Nukunonu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3737', '212', 'H', 'Ha\'apai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3738', '212', 'T', 'Tongatapu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3739', '212', 'V', 'Vava\'u');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3740', '213', 'CT', 'Couva/Tabaquite/Talparo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3741', '213', 'DM', 'Diego Martin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3742', '213', 'MR', 'Mayaro/Rio Claro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3743', '213', 'PD', 'Penal/Debe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3744', '213', 'PT', 'Princes Town');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3745', '213', 'SG', 'Sangre Grande');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3746', '213', 'SL', 'San Juan/Laventille');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3747', '213', 'SI', 'Siparia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3748', '213', 'TP', 'Tunapuna/Piarco');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3749', '213', 'PS', 'Port of Spain');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3750', '213', 'SF', 'San Fernando');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3751', '213', 'AR', 'Arima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3752', '213', 'PF', 'Point Fortin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3753', '213', 'CH', 'Chaguanas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3754', '213', 'TO', 'Tobago');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3755', '214', 'AR', 'Ariana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3756', '214', 'BJ', 'Beja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3757', '214', 'BA', 'Ben Arous');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3758', '214', 'BI', 'Bizerte');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3759', '214', 'GB', 'Gabes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3760', '214', 'GF', 'Gafsa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3761', '214', 'JE', 'Jendouba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3762', '214', 'KR', 'Kairouan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3763', '214', 'KS', 'Kasserine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3764', '214', 'KB', 'Kebili');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3765', '214', 'KF', 'Kef');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3766', '214', 'MH', 'Mahdia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3767', '214', 'MN', 'Manouba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3768', '214', 'ME', 'Medenine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3769', '214', 'MO', 'Monastir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3770', '214', 'NA', 'Nabeul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3771', '214', 'SF', 'Sfax');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3772', '214', 'SD', 'Sidi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3773', '214', 'SL', 'Siliana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3774', '214', 'SO', 'Sousse');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3775', '214', 'TA', 'Tataouine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3776', '214', 'TO', 'Tozeur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3777', '214', 'TU', 'Tunis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3778', '214', 'ZA', 'Zaghouan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3779', '215', 'ADA', 'Adana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3780', '215', 'ADI', 'Adiyaman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3781', '215', 'AFY', 'Afyonkarahisar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3782', '215', 'AGR', 'Agri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3783', '215', 'AKS', 'Aksaray');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3784', '215', 'AMA', 'Amasya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3785', '215', 'ANK', 'Ankara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3786', '215', 'ANT', 'Antalya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3787', '215', 'ARD', 'Ardahan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3788', '215', 'ART', 'Artvin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3789', '215', 'AYI', 'Aydin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3790', '215', 'BAL', 'Balikesir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3791', '215', 'BAR', 'Bartin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3792', '215', 'BAT', 'Batman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3793', '215', 'BAY', 'Bayburt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3794', '215', 'BIL', 'Bilecik');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3795', '215', 'BIN', 'Bingol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3796', '215', 'BIT', 'Bitlis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3797', '215', 'BOL', 'Bolu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3798', '215', 'BRD', 'Burdur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3799', '215', 'BRS', 'Bursa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3800', '215', 'CKL', 'Canakkale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3801', '215', 'CKR', 'Cankiri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3802', '215', 'COR', 'Corum');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3803', '215', 'DEN', 'Denizli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3804', '215', 'DIY', 'Diyarbakir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3805', '215', 'DUZ', 'Duzce');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3806', '215', 'EDI', 'Edirne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3807', '215', 'ELA', 'Elazig');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3808', '215', 'EZC', 'Erzincan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3809', '215', 'EZR', 'Erzurum');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3810', '215', 'ESK', 'Eskisehir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3811', '215', 'GAZ', 'Gaziantep');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3812', '215', 'GIR', 'Giresun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3813', '215', 'GMS', 'Gumushane');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3814', '215', 'HKR', 'Hakkari');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3815', '215', 'HTY', 'Hatay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3816', '215', 'IGD', 'Igdir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3817', '215', 'ISP', 'Isparta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3818', '215', 'IST', 'Istanbul');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3819', '215', 'IZM', 'Izmir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3820', '215', 'KAH', 'Kahramanmaras');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3821', '215', 'KRB', 'Karabuk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3822', '215', 'KRM', 'Karaman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3823', '215', 'KRS', 'Kars');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3824', '215', 'KAS', 'Kastamonu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3825', '215', 'KAY', 'Kayseri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3826', '215', 'KLS', 'Kilis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3827', '215', 'KRK', 'Kirikkale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3828', '215', 'KLR', 'Kirklareli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3829', '215', 'KRH', 'Kirsehir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3830', '215', 'KOC', 'Kocaeli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3831', '215', 'KON', 'Konya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3832', '215', 'KUT', 'Kutahya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3833', '215', 'MAL', 'Malatya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3834', '215', 'MAN', 'Manisa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3835', '215', 'MAR', 'Mardin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3836', '215', 'MER', 'Mersin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3837', '215', 'MUG', 'Mugla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3838', '215', 'MUS', 'Mus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3839', '215', 'NEV', 'Nevsehir');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3840', '215', 'NIG', 'Nigde');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3841', '215', 'ORD', 'Ordu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3842', '215', 'OSM', 'Osmaniye');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3843', '215', 'RIZ', 'Rize');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3844', '215', 'SAK', 'Sakarya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3845', '215', 'SAM', 'Samsun');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3846', '215', 'SAN', 'Sanliurfa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3847', '215', 'SII', 'Siirt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3848', '215', 'SIN', 'Sinop');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3849', '215', 'SIR', 'Sirnak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3850', '215', 'SIV', 'Sivas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3851', '215', 'TEL', 'Tekirdag');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3852', '215', 'TOK', 'Tokat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3853', '215', 'TRA', 'Trabzon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3854', '215', 'TUN', 'Tunceli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3855', '215', 'USK', 'Usak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3856', '215', 'VAN', 'Van');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3857', '215', 'YAL', 'Yalova');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3858', '215', 'YOZ', 'Yozgat');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3859', '215', 'ZON', 'Zonguldak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3860', '216', 'A', 'Ahal Welayaty');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3861', '216', 'B', 'Balkan Welayaty');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3862', '216', 'D', 'Dashhowuz Welayaty');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3863', '216', 'L', 'Lebap Welayaty');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3864', '216', 'M', 'Mary Welayaty');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3865', '217', 'AC', 'Ambergris Cays');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3866', '217', 'DC', 'Dellis Cay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3867', '217', 'FC', 'French Cay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3868', '217', 'LW', 'Little Water Cay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3869', '217', 'RC', 'Parrot Cay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3870', '217', 'PN', 'Pine Cay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3871', '217', 'SL', 'Salt Cay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3872', '217', 'GT', 'Grand Turk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3873', '217', 'SC', 'South Caicos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3874', '217', 'EC', 'East Caicos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3875', '217', 'MC', 'Middle Caicos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3876', '217', 'NC', 'North Caicos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3877', '217', 'PR', 'Providenciales');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3878', '217', 'WC', 'West Caicos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3879', '218', 'NMG', 'Nanumanga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3880', '218', 'NLK', 'Niulakita');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3881', '218', 'NTO', 'Niutao');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3882', '218', 'FUN', 'Funafuti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3883', '218', 'NME', 'Nanumea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3884', '218', 'NUI', 'Nui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3885', '218', 'NFT', 'Nukufetau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3886', '218', 'NLL', 'Nukulaelae');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3887', '218', 'VAI', 'Vaitupu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3888', '219', 'KAL', 'Kalangala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3889', '219', 'KMP', 'Kampala');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3890', '219', 'KAY', 'Kayunga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3891', '219', 'KIB', 'Kiboga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3892', '219', 'LUW', 'Luwero');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3893', '219', 'MAS', 'Masaka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3894', '219', 'MPI', 'Mpigi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3895', '219', 'MUB', 'Mubende');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3896', '219', 'MUK', 'Mukono');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3897', '219', 'NKS', 'Nakasongola');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3898', '219', 'RAK', 'Rakai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3899', '219', 'SEM', 'Sembabule');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3900', '219', 'WAK', 'Wakiso');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3901', '219', 'BUG', 'Bugiri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3902', '219', 'BUS', 'Busia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3903', '219', 'IGA', 'Iganga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3904', '219', 'JIN', 'Jinja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3905', '219', 'KAB', 'Kaberamaido');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3906', '219', 'KML', 'Kamuli');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3907', '219', 'KPC', 'Kapchorwa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3908', '219', 'KTK', 'Katakwi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3909', '219', 'KUM', 'Kumi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3910', '219', 'MAY', 'Mayuge');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3911', '219', 'MBA', 'Mbale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3912', '219', 'PAL', 'Pallisa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3913', '219', 'SIR', 'Sironko');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3914', '219', 'SOR', 'Soroti');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3915', '219', 'TOR', 'Tororo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3916', '219', 'ADJ', 'Adjumani');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3917', '219', 'APC', 'Apac');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3918', '219', 'ARU', 'Arua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3919', '219', 'GUL', 'Gulu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3920', '219', 'KIT', 'Kitgum');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3921', '219', 'KOT', 'Kotido');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3922', '219', 'LIR', 'Lira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3923', '219', 'MRT', 'Moroto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3924', '219', 'MOY', 'Moyo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3925', '219', 'NAK', 'Nakapiripirit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3926', '219', 'NEB', 'Nebbi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3927', '219', 'PAD', 'Pader');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3928', '219', 'YUM', 'Yumbe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3929', '219', 'BUN', 'Bundibugyo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3930', '219', 'BSH', 'Bushenyi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3931', '219', 'HOI', 'Hoima');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3932', '219', 'KBL', 'Kabale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3933', '219', 'KAR', 'Kabarole');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3934', '219', 'KAM', 'Kamwenge');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3935', '219', 'KAN', 'Kanungu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3936', '219', 'KAS', 'Kasese');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3937', '219', 'KBA', 'Kibaale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3938', '219', 'KIS', 'Kisoro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3939', '219', 'KYE', 'Kyenjojo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3940', '219', 'MSN', 'Masindi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3941', '219', 'MBR', 'Mbarara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3942', '219', 'NTU', 'Ntungamo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3943', '219', 'RUK', 'Rukungiri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3944', '220', 'CK', 'Cherkasy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3945', '220', 'CH', 'Chernihiv');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3946', '220', 'CV', 'Chernivtsi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3947', '220', 'CR', 'Crimea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3948', '220', 'DN', 'Dnipropetrovs\'k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3949', '220', 'DO', 'Donets\'k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3950', '220', 'IV', 'Ivano-Frankivs\'k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3951', '220', 'KL', 'Kharkiv Kherson');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3952', '220', 'KM', 'Khmel\'nyts\'kyy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3953', '220', 'KR', 'Kirovohrad');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3954', '220', 'KV', 'Kiev');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3955', '220', 'KY', 'Kyyiv');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3956', '220', 'LU', 'Luhans\'k');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3957', '220', 'LV', 'L\'viv');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3958', '220', 'MY', 'Mykolayiv');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3959', '220', 'OD', 'Odesa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3960', '220', 'PO', 'Poltava');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3961', '220', 'RI', 'Rivne');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3962', '220', 'SE', 'Sevastopol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3963', '220', 'SU', 'Sumy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3964', '220', 'TE', 'Ternopil\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3965', '220', 'VI', 'Vinnytsya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3966', '220', 'VO', 'Volyn\'');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3967', '220', 'ZK', 'Zakarpattya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3968', '220', 'ZA', 'Zaporizhzhya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3969', '220', 'ZH', 'Zhytomyr');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3970', '221', 'AZ', 'Abu Zaby');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3971', '221', 'AJ', '\'Ajman');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3972', '221', 'FU', 'Al Fujayrah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3973', '221', 'SH', 'Ash Shariqah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3974', '221', 'DU', 'Dubayy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3975', '221', 'RK', 'R\'as al Khaymah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3976', '221', 'UQ', 'Umm al Qaywayn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3977', '222', 'Aberdeen', 'Aberdeen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3978', '222', 'Aberdeenshire', 'Aberdeenshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3979', '222', 'Anglesey', 'Anglesey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3980', '222', 'Angus', 'Angus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3981', '222', 'Argyll and Bute', 'Argyll and Bute');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3982', '222', 'Bedfordshire', 'Bedfordshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3983', '222', 'Berkshire', 'Berkshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3984', '222', 'Blaenau Gwent', 'Blaenau Gwent');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3985', '222', 'Bridgend', 'Bridgend');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3986', '222', 'Bristol', 'Bristol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3987', '222', 'Buckinghamshire', 'Buckinghamshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3988', '222', 'Caerphilly', 'Caerphilly');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3989', '222', 'Cambridgeshire', 'Cambridgeshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3990', '222', 'Cardiff', 'Cardiff');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3991', '222', 'Carmarthenshire', 'Carmarthenshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3992', '222', 'Ceredigion', 'Ceredigion');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3993', '222', 'Channel Islands', 'Channel Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3994', '222', 'Cheshire', 'Cheshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3995', '222', 'Clackmannanshire', 'Clackmannanshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3996', '222', 'Conwy', 'Conwy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3997', '222', 'Cornwall', 'Cornwall');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3998', '222', 'Cumbria', 'Cumbria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3999', '222', 'Denbighshire', 'Denbighshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4000', '222', 'Derbyshire', 'Derbyshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4001', '222', 'Devon', 'Devon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4002', '222', 'Dorset', 'Dorset');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4003', '222', 'Dumfries and Galloway', 'Dumfries and Galloway');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4004', '222', 'Dundee', 'Dundee');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4005', '222', 'Durham', 'Durham');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4006', '222', 'East Ayrshire', 'East Ayrshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4007', '222', 'East Dunbartonshire', 'East Dunbartonshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4008', '222', 'East Lothian', 'East Lothian');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4009', '222', 'East Renfrewshire', 'East Renfrewshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4010', '222', 'East Riding of Yorkshire', 'East Riding of Yorkshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4011', '222', 'East Sussex', 'East Sussex');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4012', '222', 'Edinburgh', 'Edinburgh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4013', '222', 'Essex', 'Essex');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4014', '222', 'Falkirk', 'Falkirk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4015', '222', 'Fife', 'Fife');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4016', '222', 'Flintshire', 'Flintshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4017', '222', 'Glasgow', 'Glasgow');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4018', '222', 'Gloucestershire', 'Gloucestershire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4019', '222', 'Greater London', 'Greater London');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4020', '222', 'Greater Manchester', 'Greater Manchester');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4021', '222', 'Gwynedd', 'Gwynedd');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4022', '222', 'Hampshire', 'Hampshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4023', '222', 'Herefordshire', 'Herefordshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4024', '222', 'Hertfordshire', 'Hertfordshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4025', '222', 'Highlands', 'Highlands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4026', '222', 'Inverclyde', 'Inverclyde');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4027', '222', 'Isle of Man', 'Isle of Man');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4028', '222', 'Isle of Wight', 'Isle of Wight');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4029', '222', 'Kent', 'Kent');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4030', '222', 'Lancashire', 'Lancashire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4031', '222', 'Leicestershire', 'Leicestershire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4032', '222', 'Lincolnshire', 'Lincolnshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4033', '222', 'Merseyside', 'Merseyside');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4034', '222', 'Merthyr Tydfil', 'Merthyr Tydfil');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4035', '222', 'Middlesex', 'Middlesex');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4036', '222', 'Midlothian', 'Midlothian');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4037', '222', 'Monmouthshire', 'Monmouthshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4038', '222', 'Moray', 'Moray');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4039', '222', 'Neath Port Talbot', 'Neath Port Talbot');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4040', '222', 'Newport', 'Newport');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4041', '222', 'Norfolk', 'Norfolk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4042', '222', 'North Ayrshire', 'North Ayrshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4043', '222', 'North Lanarkshire', 'North Lanarkshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4044', '222', 'North Yorkshire', 'North Yorkshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4045', '222', 'Northamptonshire', 'Northamptonshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4046', '222', 'Northumberland', 'Northumberland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4047', '222', 'Nottinghamshire', 'Nottinghamshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4048', '222', 'Orkney Islands', 'Orkney Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4049', '222', 'Oxfordshire', 'Oxfordshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4050', '222', 'Pembrokeshire', 'Pembrokeshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4051', '222', 'Perth and Kinross', 'Perth and Kinross');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4052', '222', 'Powys', 'Powys');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4053', '222', 'Renfrewshire', 'Renfrewshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4054', '222', 'Rhondda Cynon Taff', 'Rhondda Cynon Taff');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4055', '222', 'Rutland', 'Rutland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4056', '222', 'Scottish Borders', 'Scottish Borders');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4057', '222', 'Shetland Islands', 'Shetland Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4058', '222', 'Shropshire', 'Shropshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4059', '222', 'Somerset', 'Somerset');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4060', '222', 'South Ayrshire', 'South Ayrshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4061', '222', 'South Lanarkshire', 'South Lanarkshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4062', '222', 'South Yorkshire', 'South Yorkshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4063', '222', 'Staffordshire', 'Staffordshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4064', '222', 'Stirling', 'Stirling');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4065', '222', 'Suffolk', 'Suffolk');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4066', '222', 'Surrey', 'Surrey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4067', '222', 'Swansea', 'Swansea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4068', '222', 'Torfaen', 'Torfaen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4069', '222', 'Tyne and Wear', 'Tyne and Wear');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4070', '222', 'Vale of Glamorgan', 'Vale of Glamorgan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4071', '222', 'Warwickshire', 'Warwickshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4072', '222', 'West Dunbartonshire', 'West Dunbartonshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4073', '222', 'West Lothian', 'West Lothian');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4074', '222', 'West Midlands', 'West Midlands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4075', '222', 'West Sussex', 'West Sussex');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4076', '222', 'West Yorkshire', 'West Yorkshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4077', '222', 'Western Isles', 'Western Isles');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4078', '222', 'Wiltshire', 'Wiltshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4079', '222', 'Worcestershire', 'Worcestershire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4080', '222', 'Wrexham', 'Wrexham');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4081', '223', 'AL', 'Alabama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4082', '223', 'AK', 'Alaska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4083', '223', 'AS', 'American Samoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4084', '223', 'AZ', 'Arizona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4085', '223', 'AR', 'Arkansas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4086', '223', 'AF', 'Armed Forces Africa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4087', '223', 'AA', 'Armed Forces Americas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4088', '223', 'AC', 'Armed Forces Canada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4089', '223', 'AE', 'Armed Forces Europe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4090', '223', 'AM', 'Armed Forces Middle East');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4091', '223', 'AP', 'Armed Forces Pacific');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4092', '223', 'CA', 'California');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4093', '223', 'CO', 'Colorado');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4094', '223', 'CT', 'Connecticut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4095', '223', 'DE', 'Delaware');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4096', '223', 'DC', 'District of Columbia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4097', '223', 'FM', 'Federated States Of Micronesia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4098', '223', 'FL', 'Florida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4099', '223', 'GA', 'Georgia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4100', '223', 'GU', 'Guam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4101', '223', 'HI', 'Hawaii');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4102', '223', 'ID', 'Idaho');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4103', '223', 'IL', 'Illinois');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4104', '223', 'IN', 'Indiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4105', '223', 'IA', 'Iowa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4106', '223', 'KS', 'Kansas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4107', '223', 'KY', 'Kentucky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4108', '223', 'LA', 'Louisiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4109', '223', 'ME', 'Maine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4110', '223', 'MH', 'Marshall Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4111', '223', 'MD', 'Maryland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4112', '223', 'MA', 'Massachusetts');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4113', '223', 'MI', 'Michigan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4114', '223', 'MN', 'Minnesota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4115', '223', 'MS', 'Mississippi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4116', '223', 'MO', 'Missouri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4117', '223', 'MT', 'Montana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4118', '223', 'NE', 'Nebraska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4119', '223', 'NV', 'Nevada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4120', '223', 'NH', 'New Hampshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4121', '223', 'NJ', 'New Jersey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4122', '223', 'NM', 'New Mexico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4123', '223', 'NY', 'New York');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4124', '223', 'NC', 'North Carolina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4125', '223', 'ND', 'North Dakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4126', '223', 'MP', 'Northern Mariana Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4127', '223', 'OH', 'Ohio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4128', '223', 'OK', 'Oklahoma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4129', '223', 'OR', 'Oregon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4130', '223', 'PW', 'Palau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4131', '223', 'PA', 'Pennsylvania');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4132', '223', 'PR', 'Puerto Rico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4133', '223', 'RI', 'Rhode Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4134', '223', 'SC', 'South Carolina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4135', '223', 'SD', 'South Dakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4136', '223', 'TN', 'Tennessee');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4137', '223', 'TX', 'Texas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4138', '223', 'UT', 'Utah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4139', '223', 'VT', 'Vermont');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4140', '223', 'VI', 'Virgin Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4141', '223', 'VA', 'Virginia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4142', '223', 'WA', 'Washington');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4143', '223', 'WV', 'West Virginia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4144', '223', 'WI', 'Wisconsin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4145', '223', 'WY', 'Wyoming');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4146', '224', 'BI', 'Baker Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4147', '224', 'HI', 'Howland Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4148', '224', 'JI', 'Jarvis Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4149', '224', 'JA', 'Johnston Atoll');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4150', '224', 'KR', 'Kingman Reef');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4151', '224', 'MA', 'Midway Atoll');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4152', '224', 'NI', 'Navassa Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4153', '224', 'PA', 'Palmyra Atoll');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4154', '224', 'WI', 'Wake Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4155', '225', 'AR', 'Artigas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4156', '225', 'CA', 'Canelones');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4157', '225', 'CL', 'Cerro Largo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4158', '225', 'CO', 'Colonia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4159', '225', 'DU', 'Durazno');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4160', '225', 'FS', 'Flores');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4161', '225', 'FA', 'Florida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4162', '225', 'LA', 'Lavalleja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4163', '225', 'MA', 'Maldonado');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4164', '225', 'MO', 'Montevideo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4165', '225', 'PA', 'Paysandu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4166', '225', 'RN', 'Rio Negro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4167', '225', 'RV', 'Rivera');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4168', '225', 'RO', 'Rocha');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4169', '225', 'SL', 'Salto');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4170', '225', 'SJ', 'San Jose');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4171', '225', 'SO', 'Soriano');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4172', '225', 'TA', 'Tacuarembo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4173', '225', 'TT', 'Treinta y Tres');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4174', '226', 'AN', 'Andijon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4175', '226', 'BU', 'Buxoro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4176', '226', 'FA', 'Farg\'ona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4177', '226', 'JI', 'Jizzax');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4178', '226', 'NG', 'Namangan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4179', '226', 'NW', 'Navoiy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4180', '226', 'QA', 'Qashqadaryo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4181', '226', 'QR', 'Qoraqalpog\'iston Republikasi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4182', '226', 'SA', 'Samarqand');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4183', '226', 'SI', 'Sirdaryo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4184', '226', 'SU', 'Surxondaryo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4185', '226', 'TK', 'Toshkent City');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4186', '226', 'TO', 'Toshkent Region');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4187', '226', 'XO', 'Xorazm');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4188', '227', 'MA', 'Malampa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4189', '227', 'PE', 'Penama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4190', '227', 'SA', 'Sanma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4191', '227', 'SH', 'Shefa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4192', '227', 'TA', 'Tafea');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4193', '227', 'TO', 'Torba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4194', '229', 'AM', 'Amazonas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4195', '229', 'AN', 'Anzoategui');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4196', '229', 'AP', 'Apure');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4197', '229', 'AR', 'Aragua');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4198', '229', 'BA', 'Barinas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4199', '229', 'BO', 'Bolivar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4200', '229', 'CA', 'Carabobo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4201', '229', 'CO', 'Cojedes');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4202', '229', 'DA', 'Delta Amacuro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4203', '229', 'DF', 'Dependencias Federales');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4204', '229', 'DI', 'Distrito Federal');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4205', '229', 'FA', 'Falcon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4206', '229', 'GU', 'Guarico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4207', '229', 'LA', 'Lara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4208', '229', 'ME', 'Merida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4209', '229', 'MI', 'Miranda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4210', '229', 'MO', 'Monagas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4211', '229', 'NE', 'Nueva Esparta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4212', '229', 'PO', 'Portuguesa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4213', '229', 'SU', 'Sucre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4214', '229', 'TA', 'Tachira');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4215', '229', 'TR', 'Trujillo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4216', '229', 'VA', 'Vargas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4217', '229', 'YA', 'Yaracuy');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4218', '229', 'ZU', 'Zulia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4219', '230', 'AG', 'An Giang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4220', '230', 'BG', 'Bac Giang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4221', '230', 'BK', 'Bac Kan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4222', '230', 'BL', 'Bac Lieu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4223', '230', 'BC', 'Bac Ninh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4224', '230', 'BR', 'Ba Ria-Vung Tau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4225', '230', 'BN', 'Ben Tre');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4226', '230', 'BH', 'Binh Dinh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4227', '230', 'BU', 'Binh Duong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4228', '230', 'BP', 'Binh Phuoc');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4229', '230', 'BT', 'Binh Thuan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4230', '230', 'CM', 'Ca Mau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4231', '230', 'CT', 'Can Tho');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4232', '230', 'CB', 'Cao Bang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4233', '230', 'DL', 'Dak Lak');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4234', '230', 'DG', 'Dak Nong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4235', '230', 'DN', 'Da Nang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4236', '230', 'DB', 'Dien Bien');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4237', '230', 'DI', 'Dong Nai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4238', '230', 'DT', 'Dong Thap');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4239', '230', 'GL', 'Gia Lai');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4240', '230', 'HG', 'Ha Giang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4241', '230', 'HD', 'Hai Duong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4242', '230', 'HP', 'Hai Phong');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4243', '230', 'HM', 'Ha Nam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4244', '230', 'HI', 'Ha Noi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4245', '230', 'HT', 'Ha Tay');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4246', '230', 'HH', 'Ha Tinh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4247', '230', 'HB', 'Hoa Binh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4248', '230', 'HC', 'Ho Chin Minh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4249', '230', 'HU', 'Hau Giang');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4250', '230', 'HY', 'Hung Yen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4251', '232', 'C', 'Saint Croix');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4252', '232', 'J', 'Saint John');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4253', '232', 'T', 'Saint Thomas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4254', '233', 'A', 'Alo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4255', '233', 'S', 'Sigave');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4256', '233', 'W', 'Wallis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4257', '235', 'AB', 'Abyan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4258', '235', 'AD', 'Adan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4259', '235', 'AM', 'Amran');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4260', '235', 'BA', 'Al Bayda');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4261', '235', 'DA', 'Ad Dali');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4262', '235', 'DH', 'Dhamar');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4263', '235', 'HD', 'Hadramawt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4264', '235', 'HJ', 'Hajjah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4265', '235', 'HU', 'Al Hudaydah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4266', '235', 'IB', 'Ibb');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4267', '235', 'JA', 'Al Jawf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4268', '235', 'LA', 'Lahij');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4269', '235', 'MA', 'Ma\'rib');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4270', '235', 'MR', 'Al Mahrah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4271', '235', 'MW', 'Al Mahwit');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4272', '235', 'SD', 'Sa\'dah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4273', '235', 'SN', 'San\'a');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4274', '235', 'SH', 'Shabwah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4275', '235', 'TA', 'Ta\'izz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4276', '236', 'KOS', 'Kosovo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4277', '236', 'MON', 'Montenegro');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4278', '236', 'SER', 'Serbia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4279', '236', 'VOJ', 'Vojvodina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4280', '237', 'BC', 'Bas-Congo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4281', '237', 'BN', 'Bandundu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4282', '237', 'EQ', 'Equateur');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4283', '237', 'KA', 'Katanga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4284', '237', 'KE', 'Kasai-Oriental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4285', '237', 'KN', 'Kinshasa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4286', '237', 'KW', 'Kasai-Occidental');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4287', '237', 'MA', 'Maniema');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4288', '237', 'NK', 'Nord-Kivu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4289', '237', 'OR', 'Orientale');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4290', '237', 'SK', 'Sud-Kivu');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4291', '238', 'CE', 'Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4292', '238', 'CB', 'Copperbelt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4293', '238', 'EA', 'Eastern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4294', '238', 'LP', 'Luapula');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4295', '238', 'LK', 'Lusaka');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4296', '238', 'NO', 'Northern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4297', '238', 'NW', 'North-Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4298', '238', 'SO', 'Southern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4299', '238', 'WE', 'Western');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4300', '239', 'BU', 'Bulawayo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4301', '239', 'HA', 'Harare');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4302', '239', 'ML', 'Manicaland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4303', '239', 'MC', 'Mashonaland Central');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4304', '239', 'ME', 'Mashonaland East');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4305', '239', 'MW', 'Mashonaland West');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4306', '239', 'MV', 'Masvingo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4307', '239', 'MN', 'Matabeleland North');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4308', '239', 'MS', 'Matabeleland South');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4309', '239', 'MD', 'Midlands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4310', '222', 'Antrim', 'Antrim');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4311', '222', 'Armagh', 'Armagh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4312', '222', 'Down', 'Down');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4313', '222', 'Fermanagh', 'Fermanagh');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4314', '222', 'Londonderry', 'Londonderry');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4315', '222', 'Tyrone', 'Tyrone');
drop table if exists zones_to_geo_zones;
create table zones_to_geo_zones (
  association_id int(11) not null auto_increment,
  zone_country_id int(11) not null ,
  zone_id int(11) ,
  geo_zone_id int(11) ,
  last_modified datetime ,
  date_added datetime not null ,
  PRIMARY KEY (association_id),
  KEY idx_zones_to_geo_zones_country_id (zone_country_id)
);

insert into zones_to_geo_zones (association_id, zone_country_id, zone_id, geo_zone_id, last_modified, date_added) values ('1', '223', '18', '1', NULL, '2015-04-04 21:03:03');
