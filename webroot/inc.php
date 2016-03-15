<?php
session_start();


define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));
define('VIEWS_PATH',ROOT.DS.'views');
require_once(ROOT.DS.'lib'.DS.'init.php');

if (isset($_POST)){
    //
} else {
    Router::redirect('/cart#st');
}
