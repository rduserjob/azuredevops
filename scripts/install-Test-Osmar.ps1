# Checkeando si Chocolatey esta o no esta instalado
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Output "Instalando Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression "& {$(Invoke-WebRequest -UseBasicParsing -Uri https://chocolatey.org/install.ps1)}"
}

# Actualizando Chocolatey
choco upgrade chocolatey -y

# Instalando las  aplicaciones requeridas
Write-Output "Instalando software requerido..."

# Instalando Office 365 ProPlus 
choco install office365proplus -y

# Instalando NodeJS LTS
choco install nodejs-lts -y

# Instalando Java JDK 
choco install openjdk -y

# Configuracion de las variables de entorno para Java
$env:JAVA_HOME = "C:\Program Files\OpenJDK\jdk-21"
[System.Environment]::SetEnvironmentVariable('JAVA_HOME', $env:JAVA_HOME, [System.EnvironmentVariableTarget]::Machine)
$env:Path += ";$env:JAVA_HOME\bin"
[System.Environment]::SetEnvironmentVariable('Path', $env:Path, [System.EnvironmentVariableTarget]::Machine)

# Instalando Visual Studio Code
choco install vscode -y

# Instalando Git
choco install git -y

# Reiniciando el sistema
Write-Output "Reiniciando la VM test..."
shutdown /r /t 5

# Imprimir variables de entorno del sistema
Write-Output "Imprimiendo variables de entorno:"
Get-ChildItem Env:
