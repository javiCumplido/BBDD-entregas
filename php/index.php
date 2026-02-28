<!DOCTYPE HTML>
<html lang="es">

<head>
    <title>El libro de nunca mas</title>
    <link rel="stylesheet" href="./css/style.css" type="text/css" />
</head>

<body>
    <?php
    /*
    include_once("./programacion.php");
    $conn = new Conexion();
    $conn->conexion();
    */
    ?>
    <h1>CRUD EN SQL SERVER</h1>
    <form action="">
        <h3>Codigo: </h3>
        <input type="text" name="paramCodigo" id="paramCodigo" readonly="true" />
        <h3>DNI: </h3>
        <input type="text" name="paramDni" id="paramDni" />
        <h3>Nombre: </h3>
        <input type="text" name="paramNombre" id="paramNombre" />
        <h3>Apellido: </h3>
        <input type="text" name="paramApellido" id="paramApellido" />
        <h3>Edad: </h3>
        <input type="text" name="paramEdad" id="paramEdad" />
        <input type="submit" value="insertar" id="insertar" name="insertar" />
        <input type="submit" value="modificar" id="modificar" name="modificar" />
        <input type="submit" value="eliminar" id="eliminar" name="eliminar" />
    </form>
    <h2>Lista de Alumnos: </h2>
    <div>
        <table id="miTabla">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>DNI</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Edad</th>
                    <th>Accion</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // ini_set('display_errors', 1);
                // ini_set('display_startup_errors', 1);
                // error_reporting(E_ALL);
                include_once("Alumnos.php");
                $consulta = Alumnos::mostrarTotalDeAlumnos();
                if (!empty($consulta) && is_array($consulta)) {
                    foreach ($consulta as $fila) {
                        echo "<tr>";
                        echo "<td>" . $fila["codigo"] . "</td>";
                        echo "<td>" . $fila["dni"] . "</td>";
                        echo "<td>" . $fila["nombre"] . "</td>";
                        echo "<td>" . $fila["apellido"] . "</td>";
                        echo "<td>" . $fila["edad"] . "</td>";
                        echo "<td>" . "<input type=\"submit\"/>" . "</td>";

                        echo "</tr>";
                    }
                } else {
                    echo "Ha fallado";
                }
                ?>
            </tbody>
        </table>
    </div>
</body>

</html>
