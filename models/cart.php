<?php

Class Cart extends Model{


    public function getCartGoods(){

        $cart = Session::get('cart');

        if( !empty($cart)){

            $ids = array_keys(Session::get('cart'));
            //$id = unserialize(Cookie::get('goods'));
            $id_sql = implode(',',$ids);

            $sql = "SELECT * FROM goods WHERE id IN ({$id_sql})";

            return $this->db->query($sql);

        } else {
            return null;
        }
    }
}