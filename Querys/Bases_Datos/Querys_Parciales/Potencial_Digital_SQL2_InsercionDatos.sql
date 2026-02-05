-- ############################ INSERCIÓN DE DATOS ############################

-- ########### CHARLAS ###########
insert into Charlas (nombre, votoTotal) values ('Fran', 7.00)
insert into Charlas (nombre, descripcion, votoTotal) values ('Inteligencia Artificial', 'Charla sobre los fundamentos de IA', 8.50)
insert into Charlas (nombre, descripcion, votoTotal) values ('Ciberseguridad', 'Importancia de la seguridad informática', 9.00)
insert into Charlas (nombre, descripcion, votoTotal) values ('Desarrollo Web', 'Frontend y Backend con JavaScript', 7.80)
insert into Charlas (nombre, descripcion, votoTotal) values ('Bases de Datos', 'SQL y diseño de bases de datos', 8.20)
insert into Charlas (nombre, descripcion) values ('Cloud Computing', 'Servicios en la nube')

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
-- Día siempre <= 12 para evitar confusión
insert into Fecha (fecha) values ('20240105 10:00:00')  -- 5 de enero
insert into Fecha (fecha) values ('20240106 11:30:00')  -- 6 de enero
insert into Fecha (fecha) values ('20240107 09:00:00')  -- 7 de enero
insert into Fecha (fecha) values ('20240108 16:00:00')  -- 8 de enero
insert into Fecha (fecha) values ('20240109 12:00:00')  -- 9 de enero
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
insert into Colegios_Actividades (idColegio, idCharla, fecha, numero_asistentes) values (1, 4, '2024-01-08', 55)
insert into Colegios_Actividades (idColegio, idCharla, fecha, numero_asistentes) values (5, 5, '2024-01-09', 40)
insert into Colegios_Actividades (idColegio, idCharla, fecha, numero_asistentes) values (2, 3, '2024-01-10', 60)