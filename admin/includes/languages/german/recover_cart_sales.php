<?php
/*
$Id: recover_cart_sales.php 1692 2012-02-26 01:26:50Z michael.oscmax@gmail.com $

  osCmax e-Commerce
  http://www.oscmax.com

  Copyright 2000 - 2011 osCmax

  Released under the GNU General Public License
*/

define('MESSAGE_STACK_CUSTOMER_ID', 'Warenkorb des Kunden ');
define('MESSAGE_STACK_DELETE_SUCCESS', ' erfolgreich gel�scht');
define('HEADING_TITLE', 'Recover Cart Sales');
define('HEADING_EMAIL_SENT', 'E-mail Sende-Report');
define('EMAIL_TEXT_LOGIN', 'Melden Sie sich hier an:');
define('EMAIL_SEPARATOR', '------------------------------------------------------');
define('EMAIL_TEXT_SUBJECT', 'Anfrage von '.  STORE_NAME );
define('EMAIL_TEXT_SALUTATION', 'Sehr geehrte(r) ' );
define('EMAIL_TEXT_NEWCUST_INTRO', "\n\n" . 'Vielen Dank f�r Ihren Besuch bei ' . STORE_NAME .
                                   ' und Ihr uns entgegengebrachtes Vertrauen.  ');
define('EMAIL_TEXT_CURCUST_INTRO', "\n\n" . 'Vielen Dank f�r Ihren erneuten Besuch bei ' .
                                   STORE_NAME . ' und Ihr wiederholtes uns entgegengebrachtes Vertrauen.  ');
define('EMAIL_TEXT_BODY_HEADER', 'Uns ist aufgefallen, da� Sie bei Ihrem Besuch in unserem Onlineshop den Warenkorb mit folgenden ' .
                                 'Artikeln gef�llt, jedoch Ihren Einkauf nicht vollst�ndig abgeschlossen haben. ' .
                                 "\n\n" . 'Inhalt Ihres Warenkorbes:' . "\n\n");
define('EMAIL_TEXT_BODY_FOOTER', 'Wir sind immer bem�ht unseren Service ' .
                                 'im Interesse unserer Kunden zu verbessern. Aus diesem Grund interessiert es uns nat�rlich, was die ' .
                                 'Ursachen daf�r waren, Ihren Einkauf dieses Mal nicht bei '. STORE_NAME . ' zu t�tigen. Wir w�ren Ihnen ' .
                                 'daher sehr dankbar, wenn Sie uns mitteilen w�rden, ob Sie bei Ihrem Besuch in unsererm Onlineshop ' .
                                 'Probleme oder Bedenken hatten ' . 'den Einkauf erfolgreich abzuschlie�en. Unser Ziel ist es Ihnen und ' .
                                 ' anderen Kunden den Einkauf bei ' . STORE_NAME . ' leichter und besser zu gestalten. ' .
                                 "\n\n" . 'Nochmals, vielen Dank f�r Ihre Zeit und Ihre Hilfe ' .
                                 'den Onlineshop von ' . STORE_NAME . ' zu verbessern.' . "\n\n" .
                                 'Mit freundlichen Gr��en' . "\n". 'Ihr Team von ');

define('DAYS_FIELD_PREFIX', 'Zeige die letzten ');
define('DAYS_FIELD_POSTFIX', ' Tage ');
define('DAYS_FIELD_BUTTON', 'Anzeigen');
define('TABLE_HEADING_DATE', 'Datum');
define('TABLE_HEADING_CONTACT', 'kontaktiert?');
define('TABLE_HEADING_CUSTOMER', 'Kundenname');
define('TABLE_HEADING_EMAIL', 'E-Mail');
define('TABLE_HEADING_PHONE', 'Telefon');
define('TABLE_HEADING_MODEL', 'Art-Nr');
define('TABLE_HEADING_DESCRIPTION', 'Beschreibung');
define('TABLE_HEADING_QUANTY', 'Menge');
define('TABLE_HEADING_PRICE', 'Preis');
define('TABLE_HEADING_TOTAL', 'Summe');
define('TABLE_GRAND_TOTAL', 'Summe netto Gesamt: ');
define('TABLE_CART_TOTAL', 'Summe netto: ');
define('TEXT_CURRENT_CUSTOMER', 'Kunde');
define('TEXT_SEND_EMAIL', 'Sende E-mail');
define('TEXT_RETURN', '[Klick hier um zur�ckzugehen]');
define('TEXT_NOT_CONTACTED', 'Nicht kontaktiert');
define('PSMSG', 'Zus�tzliche Nachricht am Ende der E-Mail: ');
define('TEXT_NO_CARTS_FOUND', 'Es wurden keine verworfenen Warenk�rbe im ausgew�hlten Zeitraum gefunden.');
?>