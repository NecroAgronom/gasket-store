<?php

Config::set('site_name',"store");

Config::set('languages', array('ru', 'uk'));

// routes route name => method prefix

Config::set('routes' , array(  'default' => '', 'admin' => 'admin_'  )  );

Config::set('default_route','default');
Config::set('default_language', 'ru');
Config::set('default_controller', 'pages');
Config::set('default_action', 'index');

Config::set('db.host','localhost');
Config::set('db.user','gaskets');
Config::set('db.password','byxRAA8WpeSBDRm7');
Config::set('db.db_name','mcv');

Config::set('salt','n3cr0a5r0n0m1c4l');