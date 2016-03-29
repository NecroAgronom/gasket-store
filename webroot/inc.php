<?php
session_start();


define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));
define('VIEWS_PATH',ROOT.DS.'views');
require_once(ROOT.DS.'lib'.DS.'init.php');

if ( isset($_POST['id']) && isset($_POST['quant']) && isset($_POST['total_quant']) ){

    $cart = Session::get('cart');
    $cart_g = Session::get('cart_g');

    if( !empty($cart)){
        $id = $_POST['id'];
        $quant = (int)$_POST['quant'];
        $total_quant = (int)$_POST['total_quant'];

        if( $total_quant > $quant){
            $quant++;
            $cart[$id] = $quant;
        }

        Session::set('cart',$cart);
    }
    if( !empty($cart_g)){
        $id = $_POST['id'];
        $quant = (int)$_POST['quant'];
        $total_quant = (int)$_POST['total_quant'];

        if( $total_quant > $quant){
            $quant++;
            $cart_g[$id] = $quant;
        }

        Session::set('cart_g',$cart_g);
    }


} else {
    Router::redirect('/cart#st');
}
