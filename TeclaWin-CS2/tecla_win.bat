@echo off
setlocal
title Tecla Windows - CS2

rem Pedir permisos de administrador si no los tiene
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Pidiendo permisos de administrador...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

set "CLAVE=HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout"

:menu
cls
echo ==========================================
echo        Tecla Windows - modo CS2
echo ==========================================
reg query "%CLAVE%" /v "Scancode Map" >nul 2>&1
if %errorlevel% equ 0 (
    echo Estado actual: tecla Windows DESACTIVADA
) else (
    echo Estado actual: tecla Windows ACTIVADA
)
echo  (si acabas de cambiarlo, falta reiniciar)
echo.
echo   1. Desactivar la tecla Windows (para jugar)
echo   2. Activar la tecla Windows (uso normal)
echo   3. Salir
echo.
choice /c 123 /n /m "Elige una opcion [1, 2 o 3]: "
if errorlevel 3 exit /b
if errorlevel 2 goto activar
if errorlevel 1 goto desactivar

:desactivar
reg add "%CLAVE%" /v "Scancode Map" /t REG_BINARY /d 0000000000000000030000005BE000005CE0000000000000 /f >nul
if %errorlevel% neq 0 goto error
echo.
echo Listo: la tecla Windows quedara desactivada despues de reiniciar.
goto reiniciar

:activar
reg query "%CLAVE%" /v "Scancode Map" >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo La tecla Windows ya esta activada. No hay nada que cambiar.
    pause
    goto menu
)
reg delete "%CLAVE%" /v "Scancode Map" /f >nul
if %errorlevel% neq 0 goto error
echo.
echo Listo: la tecla Windows volvera a funcionar despues de reiniciar.
goto reiniciar

:reiniciar
echo.
choice /c SN /m "Quieres reiniciar ahora"
if errorlevel 2 (
    echo Recuerda reiniciar para que el cambio tenga efecto.
    pause
    exit /b
)
shutdown /r /t 5 /c "Reiniciando para aplicar el cambio de la tecla Windows"
exit /b

:error
echo.
echo Hubo un error al cambiar el Registro.
pause
exit /b 1
