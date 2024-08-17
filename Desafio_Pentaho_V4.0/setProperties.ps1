# Paso 1: Buscar el archivo kettle.properties en la carpeta .kettle
$kettleFolder = "D:\Desafio_Pentaho_V4.0\config"
$kettlePropertiesPath = Get-ChildItem -Path $kettleFolder -Recurse -Filter "config.properties" -ErrorAction SilentlyContinue | Select-Object -First 1

if ($kettlePropertiesPath) {
    Write-Output "Archivo config.properties encontrado en: $($kettlePropertiesPath.FullName)"
    $kettlePropertiesPath = $kettlePropertiesPath.FullName
} else {
    Write-Output "Archivo config.properties no encontrado en la carpeta config."
    exit
}

# Paso 2: Buscar el directorio Desafio-Tecnico-Evaluador-NBCH
$searchFolder = "Desafio_Pentaho_V4.0"
$found = $false
$foundPath = ""

# Obtener todas las unidades de disco
$drives = Get-PSDrive -PSProvider FileSystem

foreach ($drive in $drives) {
    Write-Output "Buscando en la unidad $($drive.Name):"
    $results = Get-ChildItem -Path "$($drive.Name):\" -Recurse -Directory -Filter "*$searchFolder*" -ErrorAction SilentlyContinue
    
    foreach ($result in $results) {
        Write-Output "Directorio encontrado: $($result.FullName)"
        $found = $true
        $foundPath = $result.FullName
        break
    }
    
    if ($found) { break }
}

if (-not $found) {
    Write-Output "Directorio no encontrado."
    exit
}

# Convertir las barras invertidas a barras diagonales
$foundPath = $foundPath -replace '\\', '/'

# Leer el contenido actual del archivo config.properties
$properties = Get-Content $kettlePropertiesPath

# Definir la propiedad a agregar
$propertyName = "DirectoryPath"

# Verificar si la propiedad ya existe
$propertyExists = $properties -match "^$propertyName="

if (-not $propertyExists) {
    # Agregar la propiedad si no existe
    $properties += "$propertyName=$foundPath"
    # Escribir el contenido actualizado al archivo config.properties
    $properties | Set-Content $kettlePropertiesPath
    Write-Output "Ruta del directorio guardada en config.properties."
} else {
    Write-Output "La propiedad $propertyName ya existe en config.properties."
}