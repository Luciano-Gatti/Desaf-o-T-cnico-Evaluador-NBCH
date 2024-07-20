# Proyecto ETL de Feriados Locales

## Descripción
Este proyecto ETL carga feriados locales desde un archivo de entrada a una base de datos. El proceso incluye validaciones de los datos y la generación de reportes. Utiliza Pentaho Data Integration (Kettle) para transformar y cargar los datos.

## Estructura del Proyecto

- `/kettle/`: Contiene todos los archivos relacionados con Pentaho Data Integration (Kettle), incluyendo transformaciones y trabajos.
  - `/transformations/`: Almacena las transformaciones (.ktr).
  - `/jobs/`: Almacena los trabajos (.kjb).

- `/input/`: Contiene el archivo de entrada que se procesará.

- `/output/`: Almacena los archivos de salida generados por el proceso.

- `/config/`: Almacena archivos de configuración necesarios para el proceso.

- `/sql/`: Contiene scripts SQL, como el DDL para la creación de la tabla en la base de datos.

## Requisitos

- **Pentaho Data Integration**: `pdi-ce-9.4.0.0-343.zip` debe estar instalado y configurado.
- **Java Runtime Environment (JRE)**: Instalado y configurado en el PATH del sistema.
- **Base de Datos**: Compatible con el DDL proporcionado en el directorio `/sql/`.

## Instalación y Configuración

1. **Instalación de Pentaho Data Integration**:
   - Descarga el archivo `pdi-ce-9.4.0.0-343.zip`.
   - Extrae el contenido en una ubicación de tu elección.
   - Configura las variables de entorno si es necesario.

2. **Configuración del Entorno**:
   - Asegúrate de que el JRE esté correctamente instalado y configurado.
   - Verifica que la base de datos esté operativa y accesible desde el entorno donde se ejecutará el proyecto.

