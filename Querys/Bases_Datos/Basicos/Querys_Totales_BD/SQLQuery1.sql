use Potencial_Digital_SQL2

create table Charlas(
	idCharla smallint identity(1,1),
	nombre varchar(100) not null,
	descripcion varchar(max) null,
	votoTotal decimal (4,2) null,
	constraint PK_Charlas primary key(idCharla),
	constraint UQ_Charlas_nombre unique(nombre),
	constraint CK_Charlas_votoTotal check(votoTotal between 0.00 and 10.00)
)

create table Usuarios(
	idUsuario int identity(1,1),
	nombre varchar(100) null,
	telefono char(12) not null,
	constraint PK_Usuarios primary key(idUsuario),
	constraint UQ_Usuarios_telefono unique(telefono)
)

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
)

create table Asistencia(
	idCharla smallint not null,
	idUsuario int not null,
	constraint PK_Asistencia primary key(idCharla,idUsuario),
	constraint FK_Asistencia_Charlas foreign key(idCharla) references Charlas(idCharla),
	constraint FK_Asistencia_Usuarios foreign key(idUsuario) references Usuarios(idUsuario)
)

create table Fecha(
	fecha smalldatetime not null,
	constraint PK_Fecha primary key(fecha)
)

create table Fecha_Charlas(
	idCharla smallint not null,
	fecha smalldatetime not null,
	constraint PK_Fecha_Charlas primary key(idCharla,fecha),
	constraint FK_Charlas foreign key(idCharla) references Charlas(idCharla),
	constraint FK_Fecha foreign key(fecha) references Fecha(fecha)
)


 --Mensaje de error: Instrucci�n INSERT en conflicto con la restricci�n CHECK 'CK_Charlas_votoTotal'. El conflicto ha aparecido en la base de datos 'Potencial_Digital_SQL', tabla 'dbo.Charlas', column 'votoTotal'.
-- insert into Charlas(nombre,votoTotal) values(
-- 	'Javier',
-- 	-1
-- )

-- Mensaje de error: Instrucci�n INSERT en conflicto con la restricci�n CHECK 'CK_Charlas_votoTotal'. El conflicto ha aparecido en la base de datos 'Potencial_Digital_SQL', tabla 'dbo.Charlas', column 'votoTotal'.
-- insert into Charlas(nombre,votoTotal) values(
-- 	'Javier',
-- 	11
-- )

-- Mensaje: (1 fila afectada) 
insert into Charlas(nombre,votoTotal) values(
	'Javier',
	5
)

-- Resetear las filas creadas
-- delete Charlas where idCharla = 1


-- alter table Ponentes add constraint FK_Ponentes_Charlas foreign key (idCharla) references Charlas(idCharla) on delete cascade on update cascade

-- En este caso tras varias pruebas que he hecho como el id tiene identity esta en 3 por eso busco idCharla = 3 en el where
-- insert into Charlas (nombre) values ('Javier')

insert into Ponentes (nombre,idCharla) values ('Federico',1)

-- ERROR: identity es inmutable, no deja modificar la columna idCharla ya que es un identity, y de normal sql server lo considera inmutable
-- update Charlas set idCharla = 100 where idCharla = 3

-- Se cambia el nombre de la tabla padre y la foreign key lo proyecta en la tabla hija
-- update Charlas set nombre = 'Pablo' where idCharla = 3

-- Elimina la fila que contiene el valor de la columna idCharla = 3, y por consecuente gracias a on delete cascade, la foreign key proyecta el cambio en la tabla hijo
-- delete Charlas where idCharla = 3

-- alter table Ponentes drop constraint FK_Ponentes_Charlas

-- Ahora impedimos la operacion si tiene hijos
-- alter table Ponentes add constraint FK_Ponentes_Charlas foreign key (idCharla) references Charlas(idCharla) on delete no action on update no action

insert into Charlas (nombre) values ('Pepe')

insert into Ponentes (nombre,idCharla) values ('Roberto',2)

-- No se visualice un error en la terminal pero si que muestra que 0 filas fueron afectadas porque no hace ninguna accion
update Charlas set nombre = 'Pablo' where idCharla = 3

-- No se visualice un error en la terminal pero si que muestra que 0 filas fueron afectadas porque no hace ninguna accion
-- delete Charlas where idCharla = 3

-- alter table Ponentes drop constraint FK_Ponentes_Charlas

-- alter table Ponentes add constraint FK_Ponentes_Charlas foreign key (idCharla) references Charlas(idCharla) on delete set null on update set null

-- En este caso tenemos que observar en que campo aplicamos el cambio porque por ejemplo el campo nombre es unico y not null, por lo que no se puede poner a null, y los demas campos null, ya estaban a null.
-- update Charlas set descripcion = 'fdasfjadlkfjd�lfas' where idCharla = 3

-- Lo mismo pasa con delete
-- delete Charlas where idCharla = 3


-- ############# PRUEBAS FOREIGN KEYS #############

create table Colegios (
	idColegio int not null,
	nombre varchar(100) not null,
	persona_contacto varchar(200) null,
	tfno_contacto char(11) not null,
	constraint PK_Colegios primary key (idColegio)
)

alter table Colegios add constraint DF_Colegios_nombre default 'plazas disponibles' for nombre
alter table Colegios add constraint DF_Colegios_persona_contacto default 'no procede' for persona_contacto
alter table Colegios add constraint DF_Colegios_tfno_contacto default 'no procede' for tfno_contacto

insert into Colegios (idColegio) values (0)
insert into Colegios (idColegio) values (1, Puente Real, NULL)
insert into Colegios (idColegio) values (2)
insert into Colegios (idColegio) values (4)

create table Colegios_Actividades (
	idReserva int identity(1,1),
	idColegio int not null default (0),
	idCharla smallint null,
	fecha date not null,
	numero_asistentes int not null
	constraint PK_Colegios_Actividades primary key (idReserva),
	constraint FK_Colegios_Actividaves_Colegios foreign key (idColegio) references Colegios (idColegio) on delete cascade,
	constraint FK_Colegios_Actividaves_Charlas foreign key (idCharla) references Charlas (idCharla) on delete no action
)

insert into Colegios_Actividades (fecha,numero_asistentes) values ('2026-12-24',100)
insert into Colegios_Actividades (idColegio,idCharla,fecha,numero_asistentes) values (2,2,'2025-2-2',10)
insert into Colegios_Actividades (idColegio,fecha,numero_asistentes) values (4,'2024-12-12',103)

-- En idCharla nos da el siguiente error poruqe es on delete no action y en las demas on delete cascade:Mens. 547, Nivel 16, Estado 0, L�nea 154
-- Instrucci�n DELETE en conflicto con la restricci�n REFERENCE 'FK_Pontentes_Charlas'. El conflicto ha aparecido en la base de datos 'Potencial_Digital_SQL2', tabla 'dbo.Ponentes', column 'idCharla'.
-- delete from Charlas where idCharla = '2'
-- delete from Colegios where idColegio = '0'
-- delete from Colegios where idColegio = '4'

-- ######## SELECT ########

select * from dbo.Ponentes

select * from dbo.Charlas

select * from dbo.Colegios

select * from dbo.Colegios_Actividades

-- ###################### ELIMINACION DE TABLAS Y RESTRICCIONES


-- Solo FOREIGN KEYs (esto es suficiente para poder eliminar tablas)
ALTER TABLE Ponentes DROP CONSTRAINT IF EXISTS FK_Ponentes_Charlas
ALTER TABLE Asistencia DROP CONSTRAINT IF EXISTS FK_Asistencia_Charlas
ALTER TABLE Asistencia DROP CONSTRAINT IF EXISTS FK_Asistencia_Usuarios
ALTER TABLE Fecha_Charlas DROP CONSTRAINT IF EXISTS FK_Charlas
ALTER TABLE Fecha_Charlas DROP CONSTRAINT IF EXISTS FK_Fecha
ALTER TABLE Colegios_Actividades DROP CONSTRAINT IF EXISTS FK_Colegios_Actividaves_Colegios
ALTER TABLE Colegios_Actividades DROP CONSTRAINT IF EXISTS FK_Colegios_Actividaves_Charlas

-- Eliminar tablas
DROP TABLE IF EXISTS Colegios_Actividades
DROP TABLE IF EXISTS Fecha_Charlas
DROP TABLE IF EXISTS Asistencia
DROP TABLE IF EXISTS Ponentes
DROP TABLE IF EXISTS Colegios
DROP TABLE IF EXISTS Fecha
DROP TABLE IF EXISTS Usuarios
DROP TABLE IF EXISTS Charlas
