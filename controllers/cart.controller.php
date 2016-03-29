<?php

require_once(ROOT.DS.'models'.DS.'cart.php');

Class CartController extends Controller
{

    public function __construct($data = array())
    {
        parent::__construct($data);
        $this->model = new Cart();
    }

    public function index()
    {

        $cart = Session::get('cart');
        if( empty($cart) ){
            $this->data['g'] = true;
        }
        $this->data['cart_goods'] = $this->model->getCartGoods();
        if (!empty($_SESSION['cart'])) {
            $sum = 0;
            foreach ($this->data['cart_goods'] as $item) {
                $sum = $sum + ($item['price'] * $_SESSION['cart'][$item['id']]);
            }
            $this->data['sum'] = number_format($sum, 2);
            Session::set('sum',$this->data['sum']);
        }
        if (!empty($_SESSION['cart_g'])) {
            $sum = 0;
            foreach ($this->data['cart_goods'] as $item) {
                $sum = $sum + ($item['price'] * $_SESSION['cart_g'][$item['id']]);
            }
            $this->data['sum'] = number_format($sum, 2);
            Session::set('sum',$this->data['sum']);
        }

    }

    public function delete()
    {
        if (isset($this->params[0])) {

            $cart = Session::get('cart');
            $cart_g = Session::get('cart_g');

            if(!empty($cart)){
                unset($cart[$this->params[0]]);
                Session::set('cart', $cart);
            }

            if(!empty($cart_g)){
                unset($cart_g[$this->params[0]]);
                Session::set('cart_g', $cart_g);
            }

        }

        Router::redirect('/cart#st');
    }

    public function delete_all()
    {
        Session::delete('cart');
        Session::delete('cart_g');
        Router::redirect('/cart#st');
    }
}