@echo off
title Uncompress Folder using Compact.exe
color 0A

:: More info: https://ed3s.com/30246
echo ------------------------------------------
echo     Folder Uncompression Tool (Compact)
echo ------------------------------------------
echo.

:: Ask user for the folder path
set /p folderPath=Please Enter the full path of the folder to uncompress:

:: Run the uncompression command
echo.
echo Uncompressing files in: %folderPath%
compact /u /s /i "%folderPath%"
echo.
echo ------------------------------------------
echo     Uncompression Complete (if applicable)
echo ------------------------------------------
pause