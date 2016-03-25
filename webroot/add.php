<?php
session_start();


define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));
define('VIEWS_PATH',ROOT.DS.'views');
require_once(ROOT.DS.'lib'.DS.'init.php');

if ( isset($_POST['id']) && isset($_POST['quant']) && isset($_POST['total_quant']) ){

    $goods = Session::get('cart');

    if( !isset($goods[$_POST['id']]) ){
        $goods[$_POST['id']] = $_POST['quant'];
        if ($goods[$_POST['id']] > $_POST['total_quant']){
            $goods[$_POST['id']] = $_POST['total_quant'];
        } elseif($goods[$_POST['id']] < 0){
            $goods[$_POST['id']] = 1;
        } elseif( !is_numeric( $goods[$_POST['id']] ) ){
            $goods[$_POST['id']] = 1;
        }

    } else {
        $quant = $goods[$_POST['id']];
        $goods[$_POST['id']] = $quant + $_POST['quant'];
        if ($goods[$_POST['id']] > $_POST['total_quant']){
            $goods[$_POST['id']] = $_POST['total_quant'];
        } elseif($goods[$_POST['id']] < 0){
            $goods[$_POST['id']] = 1;
        } elseif( !is_numeric( $goods[$_POST['id']] ) ){
            $goods[$_POST['id']] = 1;
        }
    }

    Session::set('cart',$goods);
} else {
    Router::redirect('/goods');
}


