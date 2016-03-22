<?php

Class Cart extends Model{


    public function getCartGoods(){



        $cart = Session::get('cart');

        if( !empty($cart)){

            $ids = array_keys(Session::get('cart'));
            //$id = unserialize(Cookie::get('goods'));
            $id_sql = implode(',',$ids);

            $sql = "SELECT * FROM goods WHERE id IN ({$id_sql})";

            $goods = $this->db->query($sql);


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
}


