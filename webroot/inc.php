<?php
session_start();


define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));
define('VIEWS_PATH',ROOT.DS.'views');
require_once(ROOT.DS.'lib'.DS.'init.php');

if ( isset($_POST['id']) && isset($_POST['quant']) && isset($_POST['total_quant']) ){

    $cart = Session::get('cart');
    $id = $_POST['id'];
    $quant = $_POST['quant'];
    $total_quant = $_POST['total_quant'];

    if( $total_quant > $quant){
        $quant++;
        $cart[$id] = $quant;
    }

    Session::set('cart',$cart);
} else {
    Router::redirect('/cart#st');
}
