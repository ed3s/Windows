@echo off
title USB Storage Port Manager -e
color 0A

echo =============================================
echo         USB Storage Port Management Tool
echo =============================================
echo.
echo  [1] Disable USB storage ports
echo  [2] Enable USB storage ports
echo  [0] Exit
echo.
set /p choice=Select an option (1/2/0): 

if "%choice%"=="1" (
    REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 4 /f >nul
    echo.
    echo USB storage ports have been disabled successfully.
    echo.
    goto end
)

if "%choice%"=="2" (
    REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 3 /f >nul
    echo.
    echo USB storage ports have been enabled successfully.
    echo.
    goto end
)

if "%choice%"=="0" (
    echo Exiting...
    goto end
)

echo ❌ Invalid selection! Please choose 1, 2, or 0.

:end
pause
