@echo off
setlocal

:: Definir las carpetas de origen y destino
set "origen=C:\Ruta\De\Origen"
set "destino=C:\Ruta\De\Destino"

:: Verificar si la carpeta de destino existe, si no, crearla
if not exist "%destino%" mkdir "%destino%"

:: Copiar los archivos omitiendo Web.config y Web.config2
for %%F in ("%origen%\*") do (
    if /I not "%%~nxF"=="Web.config" if /I not "%%~nxF"=="Web.config2" (
        copy /Y "%%F" "%destino%"
    )
)

echo Copia completada.
pause
