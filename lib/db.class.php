<?php

Class DB{

    protected $connection;

    public function __construct($host, $user, $password, $db_name)
    {
        $this->connection = new mysqli($host,$user,$password,$db_name);

        if(mysqli_connect_error()){
            throw new Exception('Could not connect to DB');
        }
    }

    public function query($sql){
        if ( !$this->connection ){
            return false;
        }

        $result = $this->connection->query($sql);

        if( mysqli_error($this->connection) ){
            Session::delete('cart');
            //throw new Exception('connection error');
            Router::redirect('/static.html');
        }

        if( is_bool($result) ){
            return $result;
        }

        $data = array();
        while( $row = mysqli_fetch_assoc($result)){
            $data[] = $row;
        }

        return $data;

    }

    public function escape($str){
        return mysqli_escape_string($this->connection,$str);

    }
}