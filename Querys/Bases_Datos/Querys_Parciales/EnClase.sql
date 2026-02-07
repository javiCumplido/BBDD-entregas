-- ################### CREACION DE TABLAS ###################

use Potencial_Digital_SQL3

create table Charlas(
	idCharla smallint not null,
	nombre varchar(100) not null,
	descripcion varchar(max) null,
	votoTotal decimal (4,2) null,
	constraint PK_Charlas primary key(idCharla),
	constraint UQ_Charlas_nombre unique(nombre),
	constraint CK_Charlas_votoTotal check(votoTotal between 0.00 and 10.00)
);

create table Usuarios(
	idUsuario int identity(1,1),
	nombre varchar(100) null,
	telefono char(12) not null,
	constraint PK_Usuarios primary key(idUsuario),
	constraint UQ_Usuarios_telefono unique(telefono)
);

create table Ponentes(
	idPonente tinyint identity(1,1),
	nombre varchar(100) not null,
	salario smallmoney null,
	alojamiento smallmoney null,
	dieta smallmoney null,
	idCharla smallint not null,
	constraint PK_Ponentes primary key(idPonente),
	constraint UQ_Ponentes_nombre unique(nombre),
	constraint FK_Pontentes_Charlas foreign key(idCharla) references Charlas(idCharla)
);

alter table Ponentes drop constraint FK_Pontentes_Charlas -- Hacer cuando necesito hacer comprobaciones con FK de la tabla hija Colegios_Actividades ! No olvidar activar luego

create table Asistencia(
	idCharla smallint not null,
	idUsuario int not null,
	constraint PK_Asistencia primary key(idCharla,idUsuario),
	constraint FK_Asistencia_Charlas foreign key(idCharla) references Charlas(idCharla),
	constraint FK_Asistencia_Usuarios foreign key(idUsuario) references Usuarios(idUsuario)
);

alter table Asistencia drop constraint FK_Asistencia_Charlas -- Hacer cuando necesito hacer comprobaciones con FK de la tabla hija Colegios_Actividades ! No olvidar activar luego

create table Fecha(
	fecha smalldatetime not null,
	constraint PK_Fecha primary key(fecha)
);

create table Fecha_Charlas(
	idCharla smallint not null,
	fecha smalldatetime not null,
	constraint PK_Fecha_Charlas primary key(idCharla,fecha),
	constraint FK_Charlas foreign key(idCharla) references Charlas(idCharla),
	constraint FK_Fecha foreign key(fecha) references Fecha(fecha)
);

alter table Fecha_Charlas drop constraint FK_Charlas -- Hacer cuando necesito hacer comprobaciones con FK de la tabla hija Colegios_Actividades ! No olvidar activar luego

create table Colegios (
	idColegio int not null,
	nombre varchar(100) not null,
	persona_contacto varchar(200) null,
	tfno_contacto char(11) not null,
	constraint PK_Colegios primary key (idColegio),
)

-- No me deja poner default con constraint dentro de creacion de tabla | comentar en clase 
alter table Colegios add constraint DF_Colegios_nombre default 'plazas disponibles' for nombre
alter table Colegios add constraint DF_Colegios_persona_contacto default 'no procede' for persona_contacto
alter table Colegios add constraint DF_Colegios_tfno_contacto default 'no procede' for tfno_contacto


create table Colegios_Actividades (
	idReserva int identity(1,1),
	idColegio int not null default (0),
	idCharla smallint null,
	fecha date not null,
	numero_asistentes int not null
	constraint PK_Colegios_Actividades primary key (idReserva),
	constraint FK_Colegios_Actividades_Colegios foreign key (idColegio) references Colegios (idColegio) on delete cascade,
	constraint FK_Colegios_Actividades_Charlas foreign key (idCharla) references Charlas (idCharla) on delete no action
)

-- ############################ INSERCIÓN DE DATOS ############################

-- ########### CHARLAS ###########
insert into Charlas (idCharla, descripcion, votoTotal) values (1, 'Fran', 7.00)
insert into Charlas (idCharla, nombre, descripcion, votoTotal) values (2, 'Inteligencia Artificial', 'Charla sobre los fundamentos de IA', 8.50)
insert into Charlas (idCharla, nombre, descripcion, votoTotal) values (3, 'Ciberseguridad', 'Importancia de la seguridad informática', 9.00)
insert into Charlas (idCharla, nombre, descripcion, votoTotal) values (4, 'Desarrollo Web', 'Frontend y Backend con JavaScript', 7.80)
insert into Charlas (idCharla, nombre, descripcion, votoTotal) values (5, 'Bases de Datos', 'SQL y diseño de bases de datos', 8.20)
insert into Charlas (idCharla, nombre, descripcion) values (6, 'Cloud Computing', 'Servicios en la nube')

-- ########### USUARIOS ###########
insert into Usuarios (nombre, telefono) values ('Carlos Ruiz', '612345678')
insert into Usuarios (nombre, telefono) values ('María García', '623456789')
insert into Usuarios (nombre, telefono) values ('Pedro López', '634567890')
insert into Usuarios (nombre, telefono) values ('Ana Martínez', '645678901')
insert into Usuarios (nombre, telefono) values ('Luis Fernández', '656789012')
insert into Usuarios (nombre, telefono) values ('Sofía Rodríguez', '667890123')
insert into Usuarios (telefono) values ('678901234') -- Sin nombre
insert into Usuarios (nombre, telefono) values ('Elena Vargas', '689012345')

-- ########### PONENTES ###########
insert into Ponentes (nombre, idCharla) values ('Federico', 1)
insert into Ponentes (nombre, salario, alojamiento, dieta, idCharla) values ('Dr. Sánchez', 1500.00, 200.00, 50.00, 2)
insert into Ponentes (nombre, salario, idCharla) values ('Ing. Torres', 1200.00, 3)
insert into Ponentes (nombre, salario, alojamiento, idCharla) values ('Profa. Jiménez', 1300.00, 180.00, 4)
insert into Ponentes (nombre, idCharla) values ('Lic. Romero', 5)
insert into Ponentes (nombre, salario, dieta, idCharla) values ('MSc. Ortega', 1400.00, 40.00, 6)

-- ########### FECHA ###########
-- Formato seguro: YYYYMMDD HH:MM:SS (smalldatetime redondea segundos a minutos)
insert into Fecha (fecha) values ('20240105 10:00:00')  -- 5 de enero
insert into Fecha (fecha) values ('20240106 11:30:00')  -- 6 de enero
insert into Fecha (fecha) values ('20240107 09:00:00')  -- 7 de enero
insert into Fecha (fecha) values ('20240108 16:00:00')  -- 8 de enero
insert into Fecha (fecha) values ('20240109 12:00:00')  -- 9 de enero
insert into Fecha (fecha) values ('2024-24-01')
insert into Fecha (fecha) values ('20240124 12:00:00')
insert into Fecha (fecha) values ('20240110 10:30:00')  -- 10 de enero
insert into Fecha (fecha) values ('20240111 16:30:00')  -- 11 de enero
insert into Fecha (fecha) values ('20240112 18:00:00')  -- 12 de enero

-- ########### ASISTENCIA ###########
insert into Asistencia (idCharla, idUsuario) values (1, 1)
insert into Asistencia (idCharla, idUsuario) values (1, 2)
insert into Asistencia (idCharla, idUsuario) values (2, 1)
insert into Asistencia (idCharla, idUsuario) values (2, 3)
insert into Asistencia (idCharla, idUsuario) values (2, 4)
insert into Asistencia (idCharla, idUsuario) values (3, 5)
insert into Asistencia (idCharla, idUsuario) values (3, 6)
insert into Asistencia (idCharla, idUsuario) values (4, 2)
insert into Asistencia (idCharla, idUsuario) values (4, 4)
insert into Asistencia (idCharla, idUsuario) values (4, 6)
insert into Asistencia (idCharla, idUsuario) values (5, 3)
insert into Asistencia (idCharla, idUsuario) values (5, 7)
insert into Asistencia (idCharla, idUsuario) values (6, 8)

-- ########### FECHA_CHARLAS ###########
insert into Fecha_Charlas (idCharla, fecha) values (1, '20240105 10:00:00')
insert into Fecha_Charlas (idCharla, fecha) values (2, '20240106 11:30:00')
insert into Fecha_Charlas (idCharla, fecha) values (3, '20240107 09:00:00')
insert into Fecha_Charlas (idCharla, fecha) values (4, '20240108 16:00:00')
insert into Fecha_Charlas (idCharla, fecha) values (5, '20240109 12:00:00')
insert into Fecha_Charlas (idCharla, fecha) values (6, '20240110 10:30:00')
insert into Fecha_Charlas (idCharla, fecha) values (1, '20240111 16:30:00') -- Charla 1 también en la tarde
insert into Fecha_Charlas (idCharla, fecha) values (2, '20240112 18:00:00') -- Charla 2 también en la tarde

-- ########### COLEGIOS ###########
insert into Colegios (idColegio, nombre, persona_contacto, tfno_contacto) values (0, 'Colegio San José', 'Juan', '911111111')
insert into Colegios (idColegio, nombre, persona_contacto, tfno_contacto) values (1, 'Colegio San José', 'Juan Pérez', '911111111')
insert into Colegios (idColegio, nombre, persona_contacto) values (2, 'Colegio Santa María', 'Ana López')
insert into Colegios (idColegio, nombre, tfno_contacto) values (3, 'Colegio Ntra. Sra. del Pilar', '922222222')
insert into Colegios (idColegio) values (4) -- Todos los valores por defecto
insert into Colegios (idColegio, nombre, persona_contacto, tfno_contacto) values (5, 'Colegio Los Álamos', 'Carlos Ruiz', '933333333')

-- ########### COLEGIOS_ACTIVIDADES ###########
-- Usando fechas con día <= 12 para consistencia
insert into Colegios_Actividades (idColegio, idCharla, fecha, numero_asistentes) values (1, 1, '2024-01-05', 50)
insert into Colegios_Actividades (idColegio, idCharla, fecha, numero_asistentes) values (2, 2, '2024-01-06', 45)
insert into Colegios_Actividades (idColegio, fecha, numero_asistentes) values (3, '2024-01-07', 30) -- Sin charla específica
insert into Colegios_Actividades (idCharla, fecha, numero_asistentes) values (3, '2024-01-07', 30) -- Sin colegios específica
insert into Colegios_Actividades (idColegio, idCharla, fecha, numero_asistentes) values (1, 4, '2024-01-08', 55)
insert into Colegios_Actividades (idColegio, idCharla, fecha, numero_asistentes) values (5, 5, '2024-01-09', 40)
insert into Colegios_Actividades (idColegio, idCharla, fecha, numero_asistentes) values (2, 3, '2024-01-10', 60)

-- ################# ALTER #################

-- ######## Colegios ########
alter table Colegios_Actividades drop constraint FK_Colegios_Actividades_Colegios
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Colegios foreign key (idColegio) references Colegios (idColegio) on delete no action
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Colegios foreign key (idColegio) references Colegios (idColegio) on delete set null -- No deja porque tenemos en la tabla colegios actividades definida como not null por lo que no podemos poner un on delete set null
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Colegios foreign key (idColegio) references Colegios (idColegio) on delete set default
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Colegios foreign key (idColegio) references Colegios (idColegio) on delete cascade
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Colegios foreign key (idColegio) references Colegios (idColegio) on update no action
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Colegios foreign key (idColegio) references Colegios (idColegio) on update set null
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Colegios foreign key (idColegio) references Colegios (idColegio) on update set default
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Colegios foreign key (idColegio) references Colegios (idColegio) on update cascade

-- ######## Charlas ########
alter table Colegios_Actividades drop constraint FK_Colegios_Actividades_Charlas
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Charlas foreign key (idCharla) references Charlas (idCharla) on delete no action
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Charlas foreign key (idCharla) references Charlas (idCharla) on delete set null
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Charlas foreign key (idCharla) references Charlas (idCharla) on delete set default -- No tieene sentido poner la restriccion on delete set default, pese a que nos lo permite. Debido a que su tipo de dato no es un dafault, al igual que ocurre con la otra tabla padre con set null
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Charlas foreign key (idCharla) references Charlas (idCharla) on delete cascade
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Charlas foreign key (idCharla) references Charlas (idCharla) on update no action
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Charlas foreign key (idCharla) references Charlas (idCharla) on update set null
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Charlas foreign key (idCharla) references Charlas (idCharla) on update set default
alter table Colegios_Actividades add constraint FK_Colegios_Actividades_Charlas foreign key (idCharla) references Charlas (idCharla) on update cascade

select * from INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE where CONSTRAINT_CATALOG = 'Potencial_Digital_SQL2'

-- ################# COMPROBACIONES #################

-- ######## delete no action ########
delete Charlas where idCharla = '1'
delete Colegios where idColegio = '4' -- Si me deja porque no tengo la misma fila en la tabla hija

-- ######## delete set null ########
delete Charlas where idCharla = '2' -- No tiene sentido en cuanto a la vision de la base de datos completa porque tenemos una foreign key mas de la tabla Charlas que rompe el funcionamiento de esta instrucción, pero en cuanto a la vision de la tabla Colegios_Actividades, con Colegios y Charlas aislados, si tiene sentido ya que establece el campo id Charla en la tabla hija de la fila identica en la tabla padre eliminada a null.
delete Colegios where idColegio = '5' -- No tiene sentido en cuanto a que el tipo de dato no me va a dejar poner un null simplemente haciendo un insert, porque su tipo de deto es not null => no admite nulos

-- ######## delete set default ########
delete Charlas where idCharla = '4' -- No tiene sentido en cuanto a que el tipo de dato no tiene default y no va a cojer un valor gestionado por nosotros como default. Pese a esto la base de datos es lista y nos proporciona el valor que siempre esta por defecto si tenemos el tipo de dato como null => valor nulo.
delete Colegios where idColegio = '2' 

-- ######## delete cascade ########
delete Charlas where idCharla = '1'
-- delete Colegios_Actividades where idCharla = 2 or idCharla = 4
delete Colegios where idColegio = '0' -- A pesar de que nos va a permitir eliminar de manera normal no tiene mucho sentidoi por su valor default que es (0) y si cambiamos a la restriccion set default despues de eliminar este campo en la tabla padre nos da error de foreign key

-- ######## update cascade ########
update Colegios_Actividades set idCharla = 6 where idCharla = 5
update Colegios_Actividades set idCharla = 4 where idCharla = 6
update Charlas set idCharla = 2 where idCharla = 3

-- ######## update set default ########
update Colegios_Actividades set idCharla = 6 where idCharla = 1
update Colegios_Actividades set idCharla = 5 where idCharla = 4
update Charlas set idCharla = 10 where idCharla = 1

-- ######## update set null ########
update Colegios_Actividades set idCharla = 3 where idCharla = 2
update Colegios_Actividades set idCharla = 5 where idCharla = 6
update Charlas set idCharla = 11 where idCharla = 2

-- ######## update no action ########
update Colegios_Actividades set idCharla = 4 where idCharla = 3
update Colegios_Actividades set idCharla = 2 where idCharla = 5
update Charlas set idCharla = 12 where idCharla = 4


-- ############################ CONSULTAS DE VERIFICACIÓN ############################

-- ########### CHARLAS ###########
SELECT * FROM Charlas;

-- ########### USUARIOS ###########
SELECT * FROM Usuarios;

-- ########### PONENTES ###########
SELECT * FROM Ponentes;

-- ########### ASISTENCIA ###########
SELECT * FROM Asistencia;

-- ########### FECHA ###########
SELECT * FROM Fecha;

-- ########### FECHA_CHARLAS ###########
SELECT * FROM Fecha_Charlas;

-- ########### COLEGIOS ###########
SELECT * FROM Colegios;

-- ########### COLEGIOS_ACTIVIDADES ###########
SELECT * FROM Colegios_Actividades;