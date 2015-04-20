<?php
/*
  osCmax e-Commerce
  http://www.oscmax.com

  Copyright 2000 - 2011 osCmax

  Released under the GNU General Public License
*/

// Define the webserver and path parameters
// * DIR_FS_* = Filesystem directories (local/physical)
// * DIR_WS_* = Webserver directories (virtual/URL)
  define('HTTP_SERVER', 'http://localhost:8080');
  define('HTTP_CATALOG_SERVER', 'http://localhost:8080');
  define('HTTPS_CATALOG_SERVER', 'http://localhost:8080');
  define('ENABLE_SSL_CATALOG', 'false');
  define('DIR_FS_HOST_ROOT', 'E:\xampp-installation\htdocs');
  define('DIR_FS_DOCUMENT_ROOT', 'E:/xampp-installation/htdocs/oscmax_v2.5.4_0/');
  define('DIR_WS_ADMIN', '/oscmax_v2.5.4_0/admin/');
  define('DIR_FS_ADMIN', 'E:/xampp-installation/htdocs/oscmax_v2.5.4_0/admin/');
  define('DIR_WS_CATALOG', '/oscmax_v2.5.4_0/');
  define('DIR_FS_CATALOG', 'E:/xampp-installation/htdocs/oscmax_v2.5.4_0/');
  define('DIR_WS_IMAGES', 'images/');
  define('DIR_WS_ICONS', DIR_WS_IMAGES . 'icons/');
  define('DIR_WS_CATALOG_IMAGES', DIR_WS_CATALOG . 'images/');
  define('DIR_WS_INCLUDES', 'includes/');
  define('DIR_WS_BOXES', DIR_WS_INCLUDES . 'boxes/');
  define('DIR_WS_FUNCTIONS', DIR_WS_INCLUDES . 'functions/');
  define('DIR_WS_CLASSES', DIR_WS_INCLUDES . 'classes/');
  define('DIR_WS_MODULES', DIR_WS_INCLUDES . 'modules/');
  define('DIR_WS_LANGUAGES', DIR_WS_INCLUDES . 'languages/');
  define('DIR_WS_CATALOG_LANGUAGES', DIR_WS_CATALOG . 'includes/languages/');
  define('DIR_FS_CATALOG_LANGUAGES', DIR_FS_CATALOG . 'includes/languages/');
  define('DIR_FS_CATALOG_IMAGES', DIR_FS_CATALOG . 'images/');
  define('DIR_FS_CATALOG_MODULES', DIR_FS_CATALOG . 'includes/modules/');
  define('DIR_FS_BACKUP', DIR_FS_ADMIN . 'backups/');

// define our database connection
  define('DB_SERVER', 'localhost');
  define('DB_SERVER_USERNAME', 'root');
  define('DB_SERVER_PASSWORD', '');
  define('DB_DATABASE', 'oscmax_v2.5.4_0');
  define('USE_PCONNECT', 'false');
  define('STORE_SESSIONS', 'mysql');
?>