# Proyecto ETL de Feriados Locales

## Descripción
Este proyecto ETL carga feriados locales desde un archivo de entrada a una base de datos. 
El proceso incluye validaciones de los datos y la generación de reportes. 
Utiliza Pentaho Data Integration (Kettle) para transformar y cargar los datos.

## Estructura del Proyecto
- `/kettle/`: Contiene todos los archivos relacionados con Pentaho Data Integration (Kettle), incluyendo transformaciones y trabajos.
  - `/transformations/`: Almacena las transformaciones (.ktr).
  - `/jobs/`: Almacena los trabajos (.kjb).

- `/input/`: Contiene el archivo de entrada que se procesará.

- `/output/`: Almacena los archivos de salida generados por el proceso.

- `/config/`: Almacena archivos de configuración necesarios para el proceso.

- `/sql/`: Contiene scripts SQL, como el DDL para la creación de la tabla en la base de datos.

- `/docs/`: Documentación del proyecto.

## Requisitos
- Pentaho Data Integration (PDI) 
- Base de datos compatible con el DDL proporcionado

## Configuración
Modificar el archivo `config/config.properties` con los detalles de la conexión a la base de datos y la ruta de salida.

## DDL de la Tabla
```sql
CREATE TABLE feriados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    pais VARCHAR(100) NOT NULL
);
```
# Ruta de salida
output.path=/Desafio-Tecnico-Evaluador-NBCH/Desafio_Pentaho_V2.0/output
