@shift /0
@echo off
title Encrypt AI Aimbot
setlocal enabledelayedexpansion
chcp 65001 >nul
MODE 80,20
:: Set variables
set "url=https://raw.githubusercontent.com/cometlmao/encryptai/refs/heads/main/Update4.zip"  :: Replace with the URL of the .zip file
set "output_dir=C:\Program Files\Encrypt"     :: Replace with your desired extraction directory
set "zip_file=EncryptAI.zip"                :: Temporary file name for the downloaded .zip
set PYTHON_VERSION=3.11.0
set PYTHON_INSTALLER=pyins.exe
set DOWNLOAD_URL=https://raw.githubusercontent.com/cometlmao/encryptai/refs/heads/main/pyins.exe

color d
echo.
echo.  ▓█████  ███▄    █  ▄████▄   ██▀███ ▓██   ██▓ ██▓███  ▄▄▄█████▓
echo.  ▓█   ▀  ██ ▀█   █ ▒██▀ ▀█  ▓██ ▒ ██▒▒██  ██▒▓██░  ██▒▓  ██▒ ▓▒
echo.  ▒███   ▓██  ▀█ ██▒▒▓█    ▄ ▓██ ░▄█ ▒ ▒██ ██░▓██░ ██▓▒▒ ▓██░ ▒░
echo.  ▒▓█  ▄ ▓██▒  ▐▌██▒▒▓▓▄ ▄██▒▒██▀▀█▄   ░ ▐██▓░▒██▄█▓▒ ▒░ ▓██▓ ░ 
echo.  ░▒████▒▒██░   ▓██░▒ ▓███▀ ░░██▓ ▒██▒ ░ ██▒▓░▒██▒ ░  ░  ▒██▒ ░ 
echo.  ░░ ▒░ ░░ ▒░   ▒ ▒ ░ ░▒ ▒  ░░ ▒▓ ░▒▓░  ██▒▒▒ ▒▓▒░ ░  ░  ▒ ░░   
echo.   ░ ░  ░░ ░░   ░ ▒░  ░  ▒     ░▒ ░ ▒░▓██ ░▒░ ░▒ ░         ░    
echo.     ░      ░   ░ ░ ░          ░░   ░ ▒ ▒ ░░  ░░         ░      
echo.     ░  ░         ░ ░ ░         ░     ░ ░                       
echo.                    ░                   ░                       

:: Create output directory if it doesn't exist

set TEMP_DIR=%TEMP%\PythonInstaller
if not exist "%TEMP_DIR%" (
    mkdir "%TEMP_DIR%"
)

if not exist "%output_dir%" (
    mkdir "%output_dir%"
)

:Python Installer
set INSTALLER_PATH=%TEMP_DIR%\%PYTHON_INSTALLER%
if not exist "%INSTALLER_PATH%" (
    curl -s -o "%INSTALLER_PATH%" %DOWNLOAD_URL%
    if %ERRORLEVEL% NEQ 0 (
        echo Failed to download Python installer. Please check your internet connection.
        pause
        exit /b
    )

) else (
    echo Python installer already exists in temporary directory: %INSTALLER_PATH%
)

"%INSTALLER_PATH%" /quiet InstallAllUsers=1 PrependPath=1 Include_pip=1 Include_launcher=1

rd /s /q "%TEMP_DIR%"

:EncryptInstaller
cd %output_dir%
curl -s -o "%zip_file%" "%url%"
if errorlevel 1 (
    echo Error: Failed to install.
    pause
    exit /b 1
)

tar -xf "%zip_file%" -C "%output_dir%"

cd %output_dir%
start py main.py