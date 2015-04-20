<?php
/*
$Id: admin_files.php 1985 2013-07-21 15:54:56Z cottonbarn $

  osCmax e-Commerce
  http://www.oscmax.com

  Copyright 2000 - 2011 osCmax

  Released under the GNU General Public License
*/

define('HEADING_TITLE', 'Admin "Boxes" Menu');

define('TABLE_HEADING_ACTION', 'Action');
define('TABLE_HEADING_BOXES', 'Boxes');
define('TABLE_HEADING_FILENAME', 'Filenames');
define('TABLE_HEADING_GROUPS', 'Groups');
define('TABLE_HEADING_STATUS', 'Status');

define('TEXT_COUNT_BOXES', 'Boxes: ');
define('TEXT_COUNT_FILES', 'File(s): ');

//categories access
define('TEXT_INFO_HEADING_DEFAULT_BOXES', 'Boxes: ');

define('TEXT_INFO_DEFAULT_BOXES_INTRO', 'Simply click the green button to install the box or the red button to uninstall it.<br><br><b>WARNING:</b> If you uninstall the box, all files stored in also will be remove!');
define('TEXT_INFO_DEFAULT_BOXES_INSTALLED', ' installed');
define('TEXT_INFO_DEFAULT_BOXES_NOT_INSTALLED', ' not installed');

define('STATUS_BOX_INSTALLED', 'Installed');
define('STATUS_BOX_NOT_INSTALLED', 'Not Installed');
define('STATUS_BOX_REMOVE', 'Remove');
define('STATUS_BOX_INSTALL', 'Install');

//files access
define('TEXT_INFO_HEADING_DEFAULT_FILE', 'File: ');
define('TEXT_INFO_HEADING_DELETE_FILE', 'Remove Confirmation');
define('TEXT_INFO_HEADING_NEW_FILE', 'Store Files');

define('TEXT_INFO_DEFAULT_FILE_INTRO', 'Click <b>store files</b> button to insert new file to current box: ');
define('TEXT_INFO_NEW_FILE_ADDITIONAL', 'If you need to add a parameter to the URL please enter it here.  (Don\'t forget to put the preceeding question mark in the string.)');
define('TEXT_INFO_DELETE_FILE_INTRO', 'Remove <font color="red"><b>%s</b></font> from <b>%s</b> box? ');
define('TEXT_INFO_NEW_FILE_INTRO', 'Check the <font color="red"><b>left menu</b></font> to make sure you store the right files.');

define('TEXT_INFO_NEW_FILE_BOX', 'Current Box: ');

?>