<?php

class Alumnos
{
    public static function mostrarTotalDeAlumnos()
    {
        include_once("programacion.php");
        $query = Conexion::conexion()->prepare("select * from ALumnos");
        $query->execute();
        return $query->fetchAll();
    }
}
