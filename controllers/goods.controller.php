<?php

Class GoodsController extends Controller{



    public function __construct($data = array())
    {
        parent::__construct($data);
        $this->model = new Good();
    }

    public function index(){
        $goods = Session::get('cart');
        if(!isset($goods)){
            Session::set('cart',array());
        }
        if (isset($_GET['turbo'])){
            $this->data['goods'] = $this->model->getByTurbo($_GET['turbo']);
        } else {
            $this->data['goods'] = $this->model->getGoods();
        }
        //$this->data['gaskets'] = $this->model->getGaskets();
    }

    public function add(){

        if( isset($_POST) ){
            $goods = Session::get('cart');
            if( !isset($goods[$_POST['id']])){
                $goods[$_POST['id']] = $_POST['quant'];
            } else {
                $quant = $goods[$_POST['id']];
                $goods[$_POST['id']] = $quant + $_POST['quant'];

            }
            Session::set('cart',$goods);

        }
        Router::redirect('/cart/');

    }

    public function search(){
        if( isset($_POST['turbo']) ){
            Router::redirect('/goods?turbo=' . htmlspecialchars($_POST['turbo']));
            //$this->data['goods'] = $this->model->getByTurbo($_POST['turbo']);
        }
    }

}