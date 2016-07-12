<?php

Class Good extends Model{

    public function getGoods(){
        $sql = 'select * from goods';

        $goods =  $this->db->query($sql);


        for ( $i = 0; $i < count($goods); $i++){
            $good = $goods[$i];
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
            $oiq = (int)$oiq['0']['quant'];
            $ooq = (int)$ooq['0']['quant'];
            $giq = (int)$giq['0']['quant'];
            $goq = (int)$goq['0']['quant'];
            $arr = [$oiq,$ooq,$giq,$goq];
            $quant = $arr[0];
            for($k = 1;$k < count($arr);$k++){
                if($arr[$k] < $quant){
                    $quant = $arr[$k];
                }
            }
            $good['quant'] = $quant;
            $goods[$i] = $good;
        }

        return $goods;

    }

    public function getGaskets(){

        $sql = 'select * from gaskets';
        return $this->db->query($sql);

    }

    public function getGasketsByTurbo($turbo){
        $sql = "select oil_in, oli_out, gas_in, gas_out from goods WHERE turbo = '{$turbo}'";
        $result = $this->db->query($sql);
        $oil_in = $result[0]["oil_in"];
        $oil_out = $result[0]["oli_out"];
        $gas_in = $result[0]["gas_in"];
        $gas_out = $result[0]["gas_out"];

        $sql = "select * from gaskets WHERE gasket IN ('{$oil_in}','{$oil_out}','{$gas_in}','{$gas_out}')";
        return $this->db->query($sql);

    }

    public function getById($id){
        $id = (int)$id;
        $sql = "select * from goods where id = '{$id}' limit 1";
        $result = $this->db->query($sql);

        if(isset($result[0])){
            return $result[0];
        } else {
            return null;
        }
    }

    public function getByTurbo($turbo){
        $turbo = $this->db->escape($turbo);
        $sql = "select * from goods where turbo = '{$turbo}' ";
        $goods = $this->db->query($sql);

        if(isset($goods[0])){

            for ( $i = 0; $i < count($goods); $i++){
                $good = $goods[$i];
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
                $oiq = (int)$oiq['0']['quant'];
                $ooq = (int)$ooq['0']['quant'];
                $giq = (int)$giq['0']['quant'];
                $goq = (int)$goq['0']['quant'];
                $arr = [$oiq,$ooq,$giq,$goq];
                $quant = $arr[0];
                for($k = 1;$k < count($arr);$k++){
                    if($arr[$k] < $quant){
                        $quant = $arr[$k];
                    }
                }
                $good['quant'] = $quant;
                $goods[$i] = $good;
            }
            return $goods;
        } else {
            return null;
        }
    }

    public function getByKit($kit){

        $kit = $this->db->escape($kit);
        $sql = "select * from goods where gasket_kit = '{$kit}'";
        $result = $this->db->query($sql);
        if( isset($result[0]) ){
            return $result;
        } else {
            return null;
        }

    }

    public function getGasket($gasket){
        $sql = "select * from gaskets where gasket = '{$gasket}'";
        return $this->db->query($sql);

    }



    public function save($data, $id = null ){
        if( !isset($data['manufactor']) || !isset($data['turbo']) || !isset($data['gasket_kit']) || !isset($data['img_src']) || !isset($data['price']) || !isset($data['oil_in']) || !isset($data['oil_out']) || !isset($data['gas_in']) || !isset($data['gas_out']) ){
            return false;
        }

        $id = (int)$id;
        $manufactor = $this->db->escape($data['manufactor']); $manufactor = trim($manufactor);
        $turbo = $this->db->escape($data['turbo']); $turbo = trim($turbo);
        $gasket_kit = $this->db->escape($data['gasket_kit']); $gasket_kit = trim($gasket_kit);
        $img_src = $this->db->escape($data['img_src']); $img_src = trim($img_src);
        $price = $this->db->escape($data['price']); $price = trim($price);
        $oil_in = $this->db->escape($data['oil_in']); $oil_in = trim($oil_in);
        $oil_out = $this->db->escape($data['oil_out']); $oil_out = trim($oil_out);
        $gas_in = $this->db->escape($data['gas_in']); $gas_in = trim($gas_in);
        $gas_out = $this->db->escape($data['gas_out']); $gas_out = trim($gas_out);


        if( !$id ){
            //adding new record
            $sql = "
            insert into goods
            set manufactor = '{$manufactor}',
                turbo = '{$turbo}',
                gasket_kit = '{$gasket_kit}',
                img_src = '{$img_src}',
                price = '{$price}',
                oil_in = '{$oil_in}',
                oli_out = '{$oil_out}',
                gas_in = '{$gas_in}',
                gas_out = '{$gas_out}'
            ";
        } else {
            // updating existing record
            $sql = "
            update goods
            set manufactor = '{$manufactor}',
                turbo = '{$turbo}',
                gasket_kit = '{$gasket_kit}',
                img_src = '{$img_src}',
                price = '{$price}',
                oil_in = '{$oil_in}',
                oli_out = '{$oil_out}',
                gas_in = '{$gas_in}',
                gas_out = '{$gas_out}'
            WHERE id = {$id}
            ";
        }

        return $this->db->query($sql);

    }


    public function delete($id){

        $id = (int)$id;
        $sql = "delete from goods WHERE id = '{$id}'";
        return $this->db->query($sql);

    }



    public function getGasketById($id){
        $id = (int)$id;
        $sql = "select * from gaskets where id = '{$id}' limit 1";
        $result = $this->db->query($sql);

        if(isset($result[0])){
            return $result[0];
        } else {
            return null;
        }
    }

    public function deleteGasket($id){

        $id = (int)$id;
        $sql = "delete from gaskets WHERE id = '{$id}'";
        return $this->db->query($sql);

    }

    public function saveGasket($data, $id = null ){
        if( !isset($data['gasket']) && !isset($data['quant'])){
            return false;
        }



        $id = (int)$id;
        $gasket = $this->db->escape($data['gasket']); $gasket = trim($gasket);
        $price = $this->db->escape($data['price']); $price = trim($price);
        $quant = $this->db->escape($data['quant']); $quant = trim($quant);



        if( !$id ){
            $gsk = $this->db->query("select * from gaskets where gasket = '{$gasket}'");
            if ( is_null($gsk[0])) {
                $sql = "
            insert into gaskets
            set gasket = '{$gasket}',
                price = '{$price}',
                quant = '{$quant}'
            ";
            } else {
                $sql = "
            update gaskets
            set gasket = '{$gasket}',
                price = '{$price}',
                quant = '{$quant}'
            WHERE gasket = '{$gasket}'
            ";
            }

        } else {

            $sql = "
            update gaskets
            set gasket = '{$gasket}',
                price = '{$price}',
                quant = '{$quant}'
            WHERE id = {$id}
            ";
        }

        return $this->db->query($sql);

    }


    public function getCartGoods(){

        $cart = Session::get('cart');

        if( !empty($cart)){

            $ids = array_keys(Session::get('cart'));
            //$id = unserialize(Cookie::get('goods'));
            $id_sql = implode(',',$ids);

            $sql = "SELECT id, manufactor, turbo, gasket_kit FROM goods WHERE id IN ({$id_sql})";

            return $this->db->query($sql);

        } else {
            return null;
        }
    }







}