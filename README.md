# 🗄️ Potencial Digital SQL2 - Base de Datos

Este repositorio contiene el desarrollo completo de una base de datos para el proyecto **Potencial Digital SQL2**, realizado como ejercicio académico para la asignatura de Bases de Datos.

## 📁 Estructura del Repositorio

```
BBDD-ENTREGAS/
│
├── Queries/
│ └── Bases_Datos/
│ ├── Queries_Parciales/ # Consultas específicas por sección
│ ├── Potencial_Digital_SQL2_CreacionTablas.sql # Script de creación de tablas
│ ├── Potencial_Digital_SQL2_InsercionDatos.sql # Script de inserción de datos
│ ├── Potencial_Digital_SQL2_Consultas.sql # Script de consultas SELECT
│ └── Queries_Totales_BD/ # Consultas completas de la BD
│ └── SQLQuery1.sql # Consulta general de la base de datos
│
└── README.md # Este archivo
```


## 📋 Descripción del Proyecto

La base de datos **Potencial Digital SQL2** gestiona un sistema de charlas educativas que incluye:

- **Charlas** con sistema de votación (0-10 puntos)
- **Ponentes** con información de compensación económica
- **Usuarios** registrados en el sistema
- **Asistencia** a charlas (relación muchos a muchos)
- **Programación de fechas** para eventos
- **Colegios** participantes y sus actividades

## 🗃️ Esquema de la Base de Datos

### Tablas Principales:

1. **`Charlas`** - Información de charlas con restricción de votos (0.00-10.00)
2. **`Usuarios`** - Datos de usuarios con teléfono único obligatorio
3. **`Ponentes`** - Ponentes asociados a charlas específicas
4. **`Asistencia`** - Relación entre usuarios y charlas asistidas
5. **`Fecha`** - Fechas disponibles (tipo `smalldatetime`)
6. **`Fecha_Charlas`** - Programación de charlas en fechas específicas
7. **`Colegios`** - Información de colegios con valores por defecto
8. **`Colegios_Actividades`** - Actividades programadas para colegios

## ⚙️ Características Técnicas

### Restricciones Implementadas:
- **Llaves Primarias**: Identity en todas las tablas principales
- **Llaves Únicas**: Campos como teléfono y nombres para evitar duplicados
- **Foreign Keys**: Con acciones `ON DELETE CASCADE` y `ON DELETE NO ACTION`
- **CHECK Constraints**: Validación de votos entre 0.00 y 10.00
- **Valores por Defecto**: En tabla Colegios para campos opcionales

### Tipos de Datos Específicos:
- `smalldatetime` para fechas con hora
- `smallmoney` para valores monetarios
- `decimal(4,2)` para votos con precisión
- `varchar(max)` para descripciones extensas

## 📊 Relaciones entre Tablas

El diseño implementa las siguientes relaciones:
- Un ponente está asociado a una charla
- Los usuarios pueden asistir a múltiples charlas
- Las charlas pueden tener múltiples fechas programadas
- Los colegios pueden tener múltiples actividades
- Las actividades pueden o no estar asociadas a charlas específicas

## 🎯 Objetivos del Ejercicio

Este proyecto demuestra competencias en:
- Diseño de bases de datos relacionales normalizadas
- Implementación de restricciones de integridad
- Gestión de relaciones entre entidades
- Inserción de datos de prueba coherentes
- Creación de consultas de verificación

## 📝 Notas de Implementación

- Los datos de prueba incluyen casos límite para validar restricciones
- Formato de fechas seguro `YYYYMMDD HH:MM:SS` para evitar ambigüedades
- Días en fechas de prueba limitados a ≤12 para claridad de formato
- Inserción ordenada respetando dependencias de foreign keys
- Consultas JOIN incluidas para verificar relaciones

---

*Ejercicio académico de Bases de Datos - Potencial Digital SQL2*