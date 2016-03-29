<?php

require_once(ROOT.DS.'models'.DS.'checkout.php');

Class CheckoutController extends Controller{

    public function __construct($data = array())
    {
        parent::__construct($data);
        $this->model = new Checkout();
    }

    public function index(){

        $cart = Session::get('cart');
        $cart_g = Session::get('cart_g');
        if( empty($cart) ){
            $this->data['g'] = true;
        }

        if( (is_null($cart) or empty($cart)) && (is_null($cart_g) or empty($cart_g)) ){
            Router::redirect('/cart/');
        } else {
            $this->data['cart_goods'] = $this->model->getCartGoods();

            $order = array();
            if($this->data['g']){
                $this->data['code'] = 3;
                foreach ($this->data['cart_goods'] as $cart_good){
                    $order[] =  trim($cart_good['id']) . '-' . trim($cart_g[$cart_good['id']]);
                }
                $order = implode('; ',$order);
            } else {
                $this->data['code'] = 0;
                foreach ($this->data['cart_goods'] as $cart_good){
                    $order[] = '(' . trim($cart_good['id']) . ')' . trim($cart_good['gasket_kit']) . '-' . trim($cart[$cart_good['id']]);
                }
                $order = implode('; ',$order);
            }



            $this->data['order'] = $order;
            $this->data['sum'] = Session::get('sum');


        }

        if( $_POST['name'] && $_POST['phone'] && $_POST['body'] && $_POST['email']){
            if($this->model->saveOrder($_POST)){

                $cart = Session::get('cart');
                $cart_g = Session::get('cart_g');

                if( !empty($cart)){
                    $this->model->resetQuantity($cart);
                    Session::delete('cart');
                }

                if( !empty($cart_g)){
                    $this->model->resetGasketQuantity($cart_g);
                    Session::delete('cart_g');
                }

                Session::delete('sum');
                Session::set('success',true);
                Router::redirect('/checkout/success#st');


            } else {
                Router::redirect('/static.html');
            }
        }
    }

    public function success(){

        if( !Session::get('success') ){
           Router::redirect('/');
        } else {
            Session::delete('success');
        }

    }


    public function admin_gasket(){
        $this->data['g_orders'] = array_reverse($this->model->getGasketOrdersList());
        $this->data['sum'] = 0;
        foreach($this->data['g_orders'] as $order){
            $this->data['sum'] = $this->data['sum'] + $order['sum'];
        }
    }

    public function admin_index(){

        $this->data['orders'] = array_reverse($this->model->getOrdersList());
        $this->data['sum'] = 0;
        foreach($this->data['orders'] as $order){
            $this->data['sum'] = $this->data['sum'] + $order['sum'];
        }

    }

    public function admin_done(){

        $this->data['d_orders'] = array_reverse($this->model->getDoneOrdersList());
        $this->data['sum'] = 0;
        foreach($this->data['d_orders'] as $order){
            $this->data['sum'] = $this->data['sum'] + $order['sum'];
        }


    }

    public function admin_undone(){

        $this->data['u_orders'] = array_reverse($this->model->getUnDoneOrdersList());
        $this->data['sum'] = 0;
        foreach($this->data['u_orders'] as $order){
            $this->data['sum'] = $this->data['sum'] + $order['sum'];
        }

    }

    public function admin_canceled(){

        $this->data['c_orders'] = array_reverse($this->model->getCanceledOrdersList());
        $this->data['sum'] = 0;
        foreach($this->data['c_orders'] as $order){
            $this->data['sum'] = $this->data['sum'] + $order['sum'];
        }

    }

    public function admin_is_done(){

        //Router::redirect('/admin/checkout/undone');

        if( isset($this->params[0]) ){
            $result = $this->model->is_done($this->params[0]);
        }

        Router::redirect('/admin/checkout/undone');
    }

    public function admin_cancel(){

        if( isset($this->params[0]) ){
            $result = $this->model->cancel($this->params[0]);
        }

        Router::redirect('/admin/checkout');

    }

    public function admin_print(){

        if( isset($_GET['order']) ){
            $this->data = $this->model->getById($_GET['order']);
        } else {
            Router::redirect('/admin/checkout');
        }

    }



}

