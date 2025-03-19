@echo off
setlocal

:: Definir las carpetas
set "carp1=C:\Ruta\De\Carp1"
set "carp2=C:\Ruta\De\Carp2"

:: Verificar si la carpeta de destino (carp1) existe y eliminar todo su contenido
if exist "%carp1%" (
    echo Eliminando archivos y subcarpetas dentro de %carp1%...
    del /S /Q "%carp1%\*.*" 2>nul
    for /D %%D in ("%carp1%\*") do rmdir /S /Q "%%D"
) else (
    echo La carpeta %carp1% no existe, se creará.
    mkdir "%carp1%"
)

:: Copiar todos los archivos y subcarpetas de carp2 a carp1
robocopy "%carp2%" "%carp1%" /E /R:3 /W:5

echo Copia completada de %carp2% a %carp1%.
pause



@echo off
setlocal

:: Definir las carpetas de origen y destino
set "origen=C:\Ruta\De\Origen"
set "destino=C:\Ruta\De\Destino"
set "carpeta_bin=%destino%\bin"

:: Verificar si la carpeta bin existe y eliminar solo su contenido
if exist "%carpeta_bin%" (
    echo Eliminando archivos y subcarpetas dentro de %carpeta_bin%...
    del /S /Q "%carpeta_bin%\*.*" 2>nul
    for /D %%D in ("%carpeta_bin%\*") do rmdir /S /Q "%%D"
)

:: Crear la carpeta de destino si no existe
if not exist "%destino%" mkdir "%destino%"

:: Copiar todos los archivos y carpetas excepto Web.config y Web.config2
robocopy "%origen%" "%destino%" /E /XC /XN /XO /R:3 /W:5 /XF Web.config Web.config2

echo Copia completada.
pause



@echo off
setlocal

:: Definir las carpetas de origen y destino
set "origen=C:\Ruta\De\Origen"
set "destino=C:\Ruta\De\Destino"
set "carpeta_bin=%destino%\bin"

:: Verificar si la carpeta bin existe y eliminar solo los archivos dentro
if exist "%carpeta_bin%" (
    del /Q "%carpeta_bin%\*.*"
)

:: Crear la carpeta de destino si no existe
if not exist "%destino%" mkdir "%destino%"

:: Copiar todos los archivos y carpetas excepto Web.config y Web.config2
robocopy "%origen%" "%destino%" /E /XC /XN /XO /R:3 /W:5 /XF Web.config Web.config2

echo Copia completada.
pause



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
