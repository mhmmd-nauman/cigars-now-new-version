<?php
/*
$Id: Christmas-Card.php 1692 2012-02-26 01:26:50Z michael.oscmax@gmail.com $

  osCmax e-Commerce
  http://www.oscmax.com

  Copyright 2000 - 2011 osCmax

  Released under the GNU General Public License
*/

// set paper type and size
if ($pageloop == "0") {
$pdf = new Cezpdf(A4,portrait);
} else {
$currencies = new currencies();

$pdf->selectFont(BATCH_PDF_DIR . 'Helvetica.afm');
$pdf->setFontFamily(BATCH_PDF_DIR . 'Helvetica.afm');


// logo image  set to right of the above .. change first number to move sideways    
$pdf->addJpegFromFile(BATCH_PRINT_INC . 'templates/' . 'christmascard.jpg',0,0,590,820); 

$pdf->addText(330,330,GENERAL_FONT_SIZE,TEXT_DEAR );
$pdf->addText(350,310,GENERAL_FONT_SIZE,$order->billing['name']);
$pdf->addText(350,290,GENERAL_FONT_SIZE,TEXT_THX_CHRISMAS);

//require(BATCH_PRINT_INC . 'templates/' . 'grid.php');

}

?>
