-- ############################ CONSULTAS DE VERIFICACIÓN ############################

-- ########### CHARLAS ###########
SELECT * FROM Charlas;
-- Resultado esperado: 6 charlas, con votoTotal entre 0 y 10

-- ########### USUARIOS ###########
SELECT * FROM Usuarios;
-- Resultado esperado: 8 usuarios, uno sin nombre, teléfonos únicos

-- ########### PONENTES ###########
SELECT * FROM Ponentes;
-- Resultado esperado: 6 ponentes, cada uno asociado a una charla

-- ########### ASISTENCIA ###########
SELECT * FROM Asistencia;
-- Resultado esperado: 13 registros de asistencia, cada combinación charla-usuario única

-- ########### FECHA ###########
SELECT * FROM Fecha;
-- Resultado esperado: 8 fechas con formato smalldatetime, días entre 5 y 12 de enero

-- ########### FECHA_CHARLAS ###########
SELECT * FROM Fecha_Charlas;
-- Resultado esperado: 8 registros, asignando charlas a fechas específicas

-- ########### COLEGIOS ###########
SELECT * FROM Colegios;
-- Resultado esperado: 5 colegios, algunos con valores por defecto

-- ########### COLEGIOS_ACTIVIDADES ###########
SELECT * FROM Colegios_Actividades;
-- Resultado esperado: 6 reservas, una sin idCharla (NULL)