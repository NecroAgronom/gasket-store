<?php

Class Checkout extends Model{

    public function getCartGoods(){

        $cart = Session::get('cart');
        $cart_g = Session::get('cart_g');

        if( !empty($cart)) {

            $ids = array_keys(Session::get('cart'));
            //$id = unserialize(Cookie::get('goods'));
            $id_sql = implode(',', $ids);

            $sql = "SELECT id, manufactor, turbo, gasket_kit FROM goods WHERE id IN ({$id_sql})";

            return $this->db->query($sql);
        } elseif( !empty($cart_g)){

            $ids = array_keys($cart_g);
            foreach( $ids as &$item ){
                $item = "'" . $item . "'";
            }
            $id_sql = implode(',',$ids);
            $sql = "select * from gaskets where gasket in ({$id_sql})";
            $goods =  $this->db->query($sql);
            for($i = 0; $i < count($goods); $i++){
                $good = $goods[$i];
                $good['id'] = $good['gasket'];
                $quant = $good['quant'];
                $quant = (int)$quant;
                $good['quant'] = $quant;
                $goods[$i] = $good;

            }

            return $goods;
        } else {
            return null;
        }
    }

    public function saveOrder($data){

        if( !isset($data['name']) || !isset($data['phone']) || !isset($data['email']) || !isset($data['delivery']) || !isset($data['payment']) || !isset($data["body"]) || !isset($data["sum"]) ){
            return false;
        }


        $name = $this->db->escape($data['name']);
        $phone = $this->db->escape($data['phone']);
        $email = $this->db->escape($data['email']);
        $delivery = $this->db->escape($data['delivery']);
        //
        if($delivery == 'nova_poshta'){
            $delivery = 'Нова Пошта';
        }

        if($delivery == 'samovivoz'){
            $delivery = 'Самовывоз';
        }
        //
        $city = $this->db->escape($data['city']);
        $dept = $this->db->escape($data['dept']);
        $payment = $this->db->escape($data['payment']);
        //
        if($payment == 'nal'){
            $payment = 'Нал.';
        }

        if($payment == 'beznal'){
            $payment = 'Безнал.';
        }

        if($payment == 'karta'){
            $payment = 'Карта';
        }
        //
        $body = $this->db->escape($data["body"]);
        $date = date("d.m.Y");
        $time  = date("H:i");
        $sum = $this->db->escape($data['sum']);
        $comment = $this->db->escape($data['comment']);
        $is_done = $this->db->escape($data['is_done']);

        $delivery = $delivery . " " . $city . ' ' . $dept;


            //adding new record
            $sql = "
            insert into orders
            set name = '{$name}',
                phone = '{$phone}',
                email = '{$email}',
                delivery = '{$delivery}',
                payment = '{$payment}',
                body = '{$body}',
                date = '{$date}',
                time = '{$time}',
                sum = '{$sum}',
                comm = '{$comment}',
                is_done = '{$is_done}'
             ";




        return $this->db->query($sql);

    }

    public function getById($id){

        $sql = "select * from orders where id = '{$id}'";
        $result = $this->db->query($sql);

        if(isset($result[0])){

            $result = $result[0];
            /*$body = explode(';',$result['body']);


            foreach($body as &$item){
                $kit_id = explode('-',$item);
                $kit_id = $kit_id[0];

                $kit_quant = explode('-',$item);
                $kit_quant = $kit_quant[1];
                $kit_quant = (int)$kit_quant;

                $item = array($kit_id,$kit_quant);

            }

            $result['body'] = $body;*/
            return $result;
        } else {
            return null;
        }
    }

    public function resetQuantity($cart){

        $ids = array_keys($cart);
        $id_sql = implode(',',$ids);

        $sql = "select id, oil_in, oli_out, gas_in, gas_out from goods WHERE id IN ({$id_sql})";
        $gaskets = $this->db->query($sql);

        foreach($gaskets as $good){

            $id = $good['id'];
            $oil_in = $good['oil_in'];
            $oil_out = $good['oli_out'];
            $gas_in = $good['gas_in'];
            $gas_out = $good['gas_out'];

            $sql_oi = "SELECT quant FROM `gaskets` where gasket = '{$oil_in}'";
            $oiq = $this->db->query($sql_oi);
            $sql_oo = "SELECT quant FROM `gaskets` where gasket = '{$oil_out}'";
            $ooq = $this->db->query($sql_oo);
            $sql_gi = "SELECT quant FROM `gaskets` where gasket = '{$gas_in}'";
            $giq = $this->db->query($sql_gi);
            $sql_go = "SELECT quant FROM `gaskets` where gasket = '{$gas_out}'";
            $goq = $this->db->query($sql_go);
            $c_quant = (int)$cart[$id];
            $oiq = (int)$oiq['0']['quant'];
            $ooq = (int)$ooq['0']['quant'];
            $giq = (int)$giq['0']['quant'];
            $goq = (int)$goq['0']['quant'];
            $oiq = $oiq - $c_quant; $ooq = $ooq - $c_quant; $giq = $giq - $c_quant; $goq = $goq - $c_quant;
            if ($oiq < 0){
                $oiq = 0;
            }
            if ($ooq < 0){
                $ooq = 0;
            }
            if ($giq < 0){
                $giq = 0;
            }
            if ($goq < 0){
                $goq = 0;
            }


            $sql = "update gaskets set quant = '{$oiq}' WHERE gasket = '{$oil_in}'";
            $this->db->query($sql);
            $sql = "update gaskets set quant = '{$ooq}' WHERE gasket = '{$oil_out}'";
            $this->db->query($sql);
            $sql = "update gaskets set quant = '{$giq}' WHERE gasket = '{$gas_in}'";
            $this->db->query($sql);
            $sql = "update gaskets set quant = '{$goq}' WHERE gasket = '{$gas_out}'";
            $this->db->query($sql);

        }

    }

    public function resetGasketQuantity($cart_g){
        $ids = array_keys($cart_g);
        foreach( $ids as $gasket ){
            $sql = "SELECT quant FROM `gaskets` where gasket = '{$gasket}'";
            $quant = $this->db->query($sql);
            $quant = (int)$quant[0]['quant'];
            $c_quant = (int)$cart_g[$gasket];
            $quant = $quant - $c_quant;
            $sql = "update gaskets set quant = '{$quant}' WHERE gasket = '{$gasket}'";
            $this->db->query($sql);
        }
    }

    public function getOrdersList(){

        $sql = 'select * from orders where is_done = 0 or is_done = 1 or is_done = 3';

        return $this->db->query($sql);

    }

    public function getGasketOrdersList(){

        $sql = 'select * from orders where is_done = 3';

        return $this->db->query($sql);

    }

    public function getDoneOrdersList(){

        $sql = 'select * from orders WHERE is_done = 1';

        return $this->db->query($sql);

    }

    public function getUnDoneOrdersList(){

        $sql = 'select * from orders WHERE is_done = 0';

        return $this->db->query($sql);

    }

    public function getCanceledOrdersList(){

        $sql = 'select * from orders WHERE is_done = 2';

        return $this->db->query($sql);

    }

    public function is_done($id){
        $id = (int)$id;
        $sql = "
            update orders
            set is_done = 1
            WHERE id = {$id}
            ";

        return $this->db->query($sql);
    }


    public function cancel($id){

        $id = (int)$id;
        $sql = "select * from orders WHERE id = '{$id}'";
        $result = $this->db->query($sql);
        $result = $result[0];
        if( substr_count($result['body'], '(') != 0){

            $body = explode(';',$result['body']);


            foreach($body as &$item){
                $kit_id = explode(')',$item);
                $kit_id = $kit_id[0];
                $kit_id =str_replace('(','',$kit_id);
                $kit_id = (int)$kit_id;

                $kit_quant = explode('-',$item);
                $kit_quant = $kit_quant[1];
                $kit_quant = (int)$kit_quant;

                $item = array($kit_id,$kit_quant);

            }



            foreach($body as $item){
                $sql = "select id, oil_in, oli_out, gas_in, gas_out from goods WHERE id IN ({$item['0']})";
                $kit = $this->db->query($sql);
                $kit = $kit[0];

                $oil_in = $kit['oil_in'];
                $oil_out = $kit['oli_out'];
                $gas_in = $kit['gas_in'];
                $gas_out = $kit['gas_out'];

                $sql_oi = "SELECT quant FROM `gaskets` where gasket = '{$oil_in}'";
                $oiq = $this->db->query($sql_oi);
                $sql_oo = "SELECT quant FROM `gaskets` where gasket = '{$oil_out}'";
                $ooq = $this->db->query($sql_oo);
                $sql_gi = "SELECT quant FROM `gaskets` where gasket = '{$gas_in}'";
                $giq = $this->db->query($sql_gi);
                $sql_go = "SELECT quant FROM `gaskets` where gasket = '{$gas_out}'";
                $goq = $this->db->query($sql_go);

                $oiq = (int)$oiq['0']['quant'];
                $ooq = (int)$ooq['0']['quant'];
                $giq = (int)$giq['0']['quant'];
                $goq = (int)$goq['0']['quant'];

                $oiq = $oiq + $item['1'];
                $giq = $giq + $item['1'];
                $ooq = $ooq + $item['1'];
                $goq = $goq + $item['1'];

                $sql = "update gaskets set quant = '{$oiq}' WHERE gasket = '{$oil_in}'";
                $this->db->query($sql);
                $sql = "update gaskets set quant = '{$ooq}' WHERE gasket = '{$oil_out}'";
                $this->db->query($sql);
                $sql = "update gaskets set quant = '{$giq}' WHERE gasket = '{$gas_in}'";
                $this->db->query($sql);
                $sql = "update gaskets set quant = '{$goq}' WHERE gasket = '{$gas_out}'";
                $this->db->query($sql);

            }

        } else {
            $body = explode(';',$result['body']);


            foreach($body as &$item){

                $gasket = explode('-',$item);
                $gasket_id = $gasket[0];
                $gasket_quant = $gasket[1];
                $gasket_quant = (int)$gasket_quant;

                $item = array($gasket_id,$gasket_quant);

            }

            foreach($body as $item){

                $sql = "select quant from gaskets where gasket = '{$item[0]}'";
                $gasket = $this->db->query($sql);
                $quant = (int)$gasket[0]['quant'];
                $quant = $quant + $item[1];
                $sql = "update gaskets set quant = '{$quant}' WHERE gasket = '{$$item[0]}'";
                $this->db->query($sql);

            }
        }

        $sql = "
            update orders
            set is_done = 2
            WHERE id = {$id}
            ";
        $this->db->query($sql);
        return $body;

    }


}