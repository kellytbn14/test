@echo off
setlocal

:: Definir las carpetas de origen y destino
set "origen=C:\Ruta\De\Origen"
set "destino=C:\Ruta\De\Destino"

:: Crear la carpeta de destino si no existe
if not exist "%destino%" mkdir "%destino%"

:: Copiar todos los archivos y carpetas excepto Web.config y Web.config2
robocopy "%origen%" "%destino%" /E /XC /XN /XO /R:3 /W:5 /XD "%origen%\Web.config" "%origen%\Web.config2" /XF Web.config Web.config2

echo Copia completada.
pause



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
