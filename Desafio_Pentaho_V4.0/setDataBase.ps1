# Definir la ruta del archivo kettle.properties
$kettlePropertiesPath = "D:\Desafio_Pentaho_V4.0\config\config.properties"

# Función para pedir entrada al usuario
function Get-Input {
    param (
        [string]$Prompt
    )
    $input = Read-Host $Prompt
    return $input
}

# Solicitar al usuario los valores para las variables
$db_host = Get-Input "Introduce el host de la base de datos (por defecto 'localhost'):"
$db_port = Get-Input "Introduce el puerto de la base de datos (por defecto '5432'):"
$db_name = Get-Input "Introduce el nombre de la base de datos (por defecto 'NBDCh'):"
$db_user = Get-Input "Introduce el usuario de la base de datos (por defecto 'postgres'):"
$db_password = Get-Input "Introduce la contraseña de la base de datos (por defecto 'root'):"

# Establecer valores predeterminados si el usuario no introduce un valor
if ([string]::IsNullOrEmpty($db_host)) { $db_host = "localhost" }
if ([string]::IsNullOrEmpty($db_port)) { $db_port = "5432" }
if ([string]::IsNullOrEmpty($db_name)) { $db_name = "NBDCh" }
if ([string]::IsNullOrEmpty($db_user)) { $db_user = "postgres" }
if ([string]::IsNullOrEmpty($db_password)) { $db_password = "root" }

# Leer el contenido actual del archivo kettle.properties
if (Test-Path $kettlePropertiesPath) {
    $propertiesContent = Get-Content -Path $kettlePropertiesPath
} else {
    $propertiesContent = @()
}

# Función para actualizar o agregar una línea en el contenido del archivo
function Update-Property {
    param (
        [string]$PropertyName,
        [string]$PropertyValue
    )

    # Verificar si la propiedad ya existe en el contenido
    $propertyFound = $false
    $updatedContent = @()
    
    foreach ($line in $propertiesContent) {
        if ($line -match "^$PropertyName=") {
            $updatedContent += "$PropertyName=$PropertyValue"
            $propertyFound = $true
        } else {
            $updatedContent += $line
        }
    }

    # Si la propiedad no se encontró, agregarla al final
    if (-not $propertyFound) {
        $updatedContent += "$PropertyName=$PropertyValue"
    }

    return $updatedContent
}

# Actualizar o agregar las propiedades en el contenido
$propertiesContent = Update-Property "db_host" $db_host
$propertiesContent = Update-Property "db_port" $db_port
$propertiesContent = Update-Property "db_name" $db_name
$propertiesContent = Update-Property "db_user" $db_user
$propertiesContent = Update-Property "db_password" $db_password

# Guardar el contenido actualizado en kettle.properties
$propertiesContent | Set-Content -Path $kettlePropertiesPath

Write-Output "El archivo kettle.properties ha sido actualizado con los nuevos valores."