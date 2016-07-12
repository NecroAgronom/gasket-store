<?php

Class GoodsController extends Controller{



    public function __construct( $data = array() ){
        parent::__construct($data);
        $this->model = new Good();
    }

    public function index(){
        $cart = Session::get('cart');
        $this->data['sum'] = Session::get('sum');
        $this->data['cart_goods'] = $this->model->getCartGoods();



        if(!isset($cart)){
            Session::set('cart',array());
        }
        if (isset($_GET['turbo'])){

            $this->data['goods'] = $this->model->getByTurbo($_GET['turbo']);
            $this->data['current'] = null;
            $this->data['search'] = true;

        } elseif (isset($_GET['page'])){

            $goods = array_chunk($this->model->getGoods(),15);
            $this->data['goods'] = $goods[$_GET['page']-1];
            $this->data['pages'] = array_keys($goods);
            $this->data['current'] = $_GET['page'];

        } else {

            $goods = array_chunk($this->model->getGoods(),15);
            $this->data['goods'] = $goods[0];
            $this->data['pages'] = array_keys($goods);
            $this->data['current'] = 1;

        }
        //$this->data['gaskets'] = $this->model->getGaskets();
    }

    /*public function add(){

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

    }*/

    public function search(){
        if( isset($_POST['turbo']) ){
            Router::redirect('/goods?turbo=' . trim(htmlspecialchars($_POST['turbo'])). '#st');
            //$this->data['goods'] = $this->model->getByTurbo($_POST['turbo']);
        }
    }

    public function searchgaskets(){
        if( isset($_POST['turbo']) ){
            Router::redirect('/goods/gaskets?turbo=' . trim(htmlspecialchars($_POST['turbo'])). '#st');
        }
    }

    public function admin_search(){
        if( isset($_POST['search']) and ($_POST['opt'] == 'turbo')){
            Router::redirect('/admin/goods?turbo=' . trim(htmlspecialchars($_POST['search'])). '#st');
            //$this->data['goods'] = $this->model->getByTurbo($_POST['turbo']);
        }
        if( isset($_POST['search']) and ($_POST['opt'] == 'kit')){
            Router::redirect('/admin/goods?kit=' . trim(htmlspecialchars($_POST['search'])). '#st');
            //$this->data['goods'] = $this->model->getByTurbo($_POST['turbo']);
        }
    }

    public function admin_gasketsearch(){
        if( isset($_POST['search']) and ($_POST['opt'] == 'turbo')){
            Router::redirect('/admin/goods/gaskets?turbo=' . trim(htmlspecialchars($_POST['search'])). '#st');
            //$this->data['goods'] = $this->model->getByTurbo($_POST['turbo']);
        }
        if( isset($_POST['search']) and ($_POST['opt'] == 'gasket')){
            Router::redirect('/admin/goods/gaskets?gasket=' . trim(htmlspecialchars($_POST['search'])). '#st');
            //$this->data['goods'] = $this->model->getByTurbo($_POST['turbo']);
        }
    }


    public function admin_index(){

        if( isset($_GET['turbo']) ){
            $this->data['goods'] = $this->model->getByTurbo($_GET['turbo']);
            $this->data['search'] = true;
        } elseif( isset($_GET['kit'])){
            $this->data['goods'] = $this->model->getByKit($_GET['kit']);
            $this->data['search'] = true;
        } else {
            $this->data['goods'] = $this->model->getGoods();
        }

    }

    public function admin_gaskets(){


        if( isset($_GET['turbo']) ){
            $this->data['gaskets'] = $this->model->getGasketsByTurbo($_GET['turbo']);
            $this->data['search'] = true;
        } elseif( isset($_GET['gasket'])){
            $this->data['gaskets'] = $this->model->getGasket($_GET['gasket']);
            $this->data['search'] = true;
        } else {
            $this->data['gaskets'] = $this->model->getGaskets();
        }

    }

    public function admin_add(){
        if( $_POST ){
            $result = $this->model->save($_POST);
            if ( $result ){
                Session::setFlash('Комлект сохранен');
            } else {
                Session::setFlash('Ошибка');
            }
            Router::redirect('/admin/goods/');
        }
    }

    public function admin_edit(){
        if( $_POST ){
            $id = isset($_POST['id']) ? $_POST['id'] : null;
            $result = $this->model->save($_POST,$id);
            if ( $result ){
                Session::setFlash('Комплект сохранен');

            } else {
                Session::setFlash('Ошибка');
            }
            Router::redirect('/admin/goods/');
        }
        if( isset($this->params['0'])){
            $this->data['good'] = $this->model->getById($this->params['0']);
        } else {
            Session::setFlash("Неправильный ID страницы");

        }
    }

    public function admin_delete(){

        if( isset($this->params[0]) ){
            $result = $this->model->delete($this->params[0]);
            if ( $result ){
                Session::setFlash('Страница удалена');

            } else {
                Session::setFlash('Ошибка');
            }

        }
        Router::redirect('/admin/goods/');

    }

    public function admin_gasket_add(){
        if( $_POST ){
            $result = $this->model->saveGasket($_POST);
            if ( $result ){
                Session::setFlash('Комлект сохранен');
            } else {
                Session::setFlash('Ошибка');
            }
            Router::redirect('/admin/goods/gaskets');

        }
    }

    public function admin_gasket_edit(){
        if( $_POST ){
            $id = isset($_POST['id']) ? $_POST['id'] : null;
            $result = $this->model->saveGasket($_POST,$id);
            if ( $result ){
                Session::setFlash('Комплект сохранен');

            } else {
                Session::setFlash('Ошибка');
            }
            Router::redirect('/admin/goods/gaskets');
        }
        if( isset($this->params['0'])){
            $this->data['gasket'] = $this->model->getGasketById($this->params['0']);
        } else {
            Session::setFlash("Неправильный ID страницы");

        }
    }

    public function admin_gasket_delete(){

        if( isset($this->params[0]) ){
            $result = $this->model->deleteGasket($this->params[0]);
            if ( $result ){
                Session::setFlash('Страница удалена');

            } else {
                Session::setFlash('Ошибка');
            }

        }
        Router::redirect('/admin/goods/gaskets');

    }

    public function gaskets(){


        //Router::redirect('/');
        $cart_g = Session::get('cart_g');
        if(!isset($cart_g)){
            Session::set('cart_g',array());
        }
        if(isset($_GET['turbo'])){
            $this->data['gaskets'] = $this->model->getGasketsByTurbo($_GET['turbo']);
        } else {
            $this->data['gaskets'] = $this->model->getGaskets();
        }
    }

}