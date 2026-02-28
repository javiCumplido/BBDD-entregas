<?php

class Conexion
{
    public static function conexion()
    {
        $server = "192.168.0.15";
        $db = "Potencial_Digital_SQL2";
        $user = "php2";
        $pass = "1234";
        $puerto = 1433;

        try {
            $comn = new PDO("sqlsrv:Server=$server,$puerto;Database=$db;Encrypt=no;TrustServerCertificate=true", $user, $pass);
            echo "Hemos conseguido";
        } catch (PDOException $ex) {
            echo ("No se encontro la base de datos $db por el error: $ex");
        }

        return $comn;
    }
}
