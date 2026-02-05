-- ################### CREACION DE TABLAS ###################

use Potencial_Digital_SQL2

create table Charlas(
	idCharla smallint identity(1,1),
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

create table Asistencia(
	idCharla smallint not null,
	idUsuario int not null,
	constraint PK_Asistencia primary key(idCharla,idUsuario),
	constraint FK_Asistencia_Charlas foreign key(idCharla) references Charlas(idCharla),
	constraint FK_Asistencia_Usuarios foreign key(idUsuario) references Usuarios(idUsuario)
);

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

create table Colegios (
	idColegio int not null,
	nombre varchar(100) not null,
	persona_contacto varchar(200) null,
	tfno_contacto char(11) not null,
	constraint PK_Colegios primary key (idColegio),
)

-- No me deja poner default con constraint dentro de creacion de tabla | comentar en clase 
alter table Colegios constraint DF_Colegios_nombre default 'plazas disponibles' for nombre,
alter table Colegios constraint DF_Colegios_persona_contacto default 'no procede' for persona_contacto,
alter table Colegios constraint DF_Colegios_tfno_contacto default 'no procede' for tfno_contacto


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