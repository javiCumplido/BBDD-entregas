-- ############ PRUEBAS DE ENTIDAD RELACION INICIALES CON CHARLAS SALAS ############
use Potencial_Digital_SQL2

create table Salas(
	idSalas tinyint identity(1,1),
	nombre varchar(100),
	constraint PK_Salas primary key(idSalas),
	constraint UQ_Salas_nombre unique(nombre)
)

create table Charlas(
	idCharlas smallint identity(1,1),
	nombre varchar(100) not null,
	descripcion varchar(max) null,
	votoTotal decimal (4,2) null,
	idSalas tinyint not null,
	constraint PK_Charlas primary key(idCharlas),
	constraint UQ_Charlas_nombre unique(nombre),
	constraint CK_Charlas_votoTotal check(votoTotal between 0.00 and 10.00),
	constraint FK_Charlas_Salas foreign key(idSalas) references Salas(idSalas)
)


create table Usuarios(
	idUsuarios int identity(1,1),
	nombre varchar(100) null,
	telefono char(12) not null,
	constraint PK_Usuarios primary key(idUsuarios),
	constraint UQ_Usuarios_telefono unique(telefono)
)

create table Asistencia(
	idCharlas smallint not null,
	idUsuarios int not null,
	constraint PK_Asistencia primary key(idCharlas,idUsuarios),
	constraint FK_Asistencia_Charlas foreign key(idCharlas) references Charlas(idCharlas),
	constraint FK_Asistencia_Usuarios foreign key(idUsuarios) references Usuarios(idUsuarios)
)

create table Temas(
	idTemas tinyint identity(1,1),
	nombre varchar(100) not null,
	constraint PK_Temas primary key(idTemas),
	constraint UQ_Temas_nombre unique(nombre)
)

create table Ponentes(
	idPonentes tinyint identity(1,1),
	nombre varchar(100) not null,
	salario smallmoney null,
	alojamiento smallmoney null,
	dieta smallmoney null,
	idTemas tinyint not null,
	constraint PK_Ponentes primary key(idPonentes),
	constraint UQ_Ponentes_nombre unique(nombre),
	constraint FK_Ponentes_Temas foreign key(idTemas) references Temas(idTemas)
)

CREATE INDEX IDX_Ponentes_Temas ON Ponentes(idTemas)

create table Charlas_Ponentes(
	idCharlas smallint not null,
	idPonentes tinyint not null,
	constraint PK_Charlas_Ponentes primary key(idCharlas,idPonentes),
	constraint FK_Charlas_Ponentes_Charlas foreign key(idCharlas) references Charlas(idCharlas),
	constraint FK_Charlas_Ponentes_Ponentes foreign key(idPonentes) references Ponentes(idPonentes)
)

-- ############# INSERT #############
/* BLOQUE DE INSERCIÓN DE DATOS 
   Orden: Salas -> Charlas -> Usuarios -> Asistencia -> Temas -> Ponentes -> Charlas_Ponentes
*/

INSERT INTO Salas (nombre) VALUES
('IA'),
('Seguridad'),
('Arquitectura'),
('Equipos Remotos')

INSERT INTO Charlas (nombre, descripcion, votoTotal, idSalas) VALUES 
('IA Generativa en 2026', 'Explorando el futuro de los modelos LLM', 9.50, 1),
('Seguridad en SQL Server', 'Mejores prácticas de cifrado y roles', 8.20, 2),
('Arquitectura de Microservicios', 'Patrones de diseño modernos', 7.75, 1),
('Gestión de Equipos Remotos', 'Habilidades blandas para líderes', 6.50, 3);

INSERT INTO Usuarios (nombre, telefono) VALUES 
('Juan Pérez', '349123456789'),
('María García', '349876543210'),
('Carlos Ruiz', '346001122334'),
('Ana López', '347778889990');

INSERT INTO Asistencia (idCharlas, idUsuarios) VALUES 
(1, 1), -- Juan asiste a IA
(1, 2), -- María asiste a IA
(2, 2), -- María asiste a Seguridad
(3, 3), -- Carlos asiste a Microservicios
(4, 4), -- Ana asiste a Gestión
(1, 4); -- Ana asiste a IA

INSERT INTO Temas (nombre) VALUES
('IA'),
('Seguridad'),
('Arquitectura'),
('Equipos Remotos'),

INSERT INTO Temas (nombre) VALUES
('Herrero')

INSERT INTO Ponentes (nombre, salario, alojamiento, dieta, idTemas) VALUES 
('Ing. Alan Turing', 1500.00, 200.00, 50.00, 1),
('Dra. Ada Lovelace', 1800.00, 250.00, 60.00, 1),
('Kevin Mitnick', 1200.00, 150.00, 40.00, 2),
('Martin Fowler', 2000.00, 300.00, 100.00, 3);

INSERT INTO Ponentes (nombre, salario, alojamiento, dieta, idTemas) VALUES 
('Martin Fowle', 2000.00, 300.00, 100.00, 6)

INSERT INTO Charlas_Ponentes (idCharlas, idPonentes) VALUES
(1,1),
(2,1),
(3,2),
(1,2)





-- ############### SELECTS ###############
SELECT * FROM Usuarios
SELECT * FROM Asistencia
SELECT * FROM Charlas
SELECT * FROM Salas
SELECT * FROM Charlas_Ponentes
SELECT * FROM Ponentes
SELECT * FROM Temas
