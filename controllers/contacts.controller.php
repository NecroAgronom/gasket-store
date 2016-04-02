<?php

Class ContactsController extends Controller{

    public function __construct($data = array())
    {
        parent::__construct($data);
        $this->model = new Message();
    }

    public function index(){

        if( $_POST['name'] && $_POST['email'] && $_POST['message']){
            if ($this->model->save($_POST)){
                Session::setFlash("Спасибо! Ваше сообщение было отправлено");
            }
        }

    }

    public function admin_index(){

        $this->data = $this->model->getList();

    }

}