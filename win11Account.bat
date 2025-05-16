@echo off
:: Microsoft Account Login Toggle - For Windows 11
:: Run as Administrator

title Microsoft Account Login Toggle Tool
color 1F

:menu
cls
echo ======================================================
echo     Microsoft Account Login - Enable / Disable
echo ======================================================
echo 1. Disable Microsoft Account Login
echo 2. Enable Microsoft Account Login
echo 3. Exit
echo ======================================================
set /p choice=Enter your choice (1/2/3): 

if "%choice%"=="1" goto disable
if "%choice%"=="2" goto enable
if "%choice%"=="3" exit
goto menu

:disable
echo.
echo Disabling Microsoft Account login system-wide...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v NoConnectedUser /t REG_DWORD /d 3 /f

echo Disabling Microsoft Account requirement in OOBE (setup)...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v BypassNRO /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v BypassMSA /t REG_DWORD /d 1 /f

echo.
echo Microsoft Account login has been DISABLED.
echo Please restart your computer to apply changes.
pause
goto menu

:enable
echo.
echo Enabling Microsoft Account login system-wide...
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v NoConnectedUser /f

echo Enabling Microsoft Account requirement in OOBE (setup)...
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v BypassNRO /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v BypassMSA /f

echo.
echo Microsoft Account login has been ENABLED.
echo Please restart your computer to apply changes.
pause
goto menu
