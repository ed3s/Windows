@echo off
title USB Storage Port Manager
color 0A

echo ===============================
echo       USB Port Management
echo ===============================
echo.
echo  [1] Disable USB storage ports
echo  [2] Enable USB storage ports
echo  [0] Exit
echo.

set /p choice=Select an option (1/2/0): 

if "%choice%"=="1" (
    REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 4 /f
    echo.
    echo ✅ USB storage ports have been disabled.
    goto end
)

if "%choice%"=="2" (
    REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 3 /f
    echo.
    echo ✅ USB storage ports have been enabled.
    goto end
)

if "%choice%"=="0" (
    echo Exiting...
    goto end
)

echo ❌ Invalid option!
:end
pause
