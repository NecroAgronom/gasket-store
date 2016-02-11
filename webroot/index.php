<?php
/**
 * Created by PhpStorm.
 * User: Андрей
 * Date: 21.01.2016
 * Time: 0:02
 */
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));
define('VIEWS_PATH',ROOT.DS.'views');

require_once(ROOT.DS.'lib'.DS.'init.php');

//$router = new Router($_SERVER['REQUEST_URI']);


//Session::setFlash('Test flash message');

session_start();

App::run($_SERVER['REQUEST_URI']);

//$test = App::$db->query('select * from pages');


//var_dump($test);












