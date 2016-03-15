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

        $this->data['cart_goods'] = $this->model->getCartGoods();
        if (!empty($_SESSION['cart'])) {
            $sum = 0;
            foreach ($this->data['cart_goods'] as $item) {
                $sum = $sum + ($item['price'] * $_SESSION['cart'][$item['id']]);
            }
            $this->data['sum'] = number_format($sum, 2);
            Session::set('sum',$this->data['sum']);
        }

    }

    public function delete()
    {
        if (isset($this->params[0])) {

            $goods = Session::get('cart');
            unset($goods[$this->params[0]]);
            Session::set('cart', $goods);

        }

        Router::redirect('/cart#st');
    }

    public function delete_all()
    {
        Session::delete('cart');
        Router::redirect('/cart#st');
    }
}