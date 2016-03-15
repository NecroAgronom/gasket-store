<?php
session_start();


define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));
define('VIEWS_PATH',ROOT.DS.'views');
require_once(ROOT.DS.'lib'.DS.'init.php');

if (isset($_POST)){

    $cart = Session::get('cart');

    $id = $_POST['id'];
    $quant = (int)$_POST['quant'];
    if ($quant > 1){
        $quant--;
        $cart[$id] = $quant;
    }

    Session::set('cart',$cart);
} else {
    Router::redirect('/cart#st');
}
