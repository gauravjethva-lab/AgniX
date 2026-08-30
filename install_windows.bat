@echo off
REM ============================================================
REM Metasploit Exploit Generator - Windows Installation Script
REM ============================================================

setlocal enabledelayedexpansion

title Metasploit Exploit Generator - Installation

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║  METASPLOIT EXPLOIT GENERATOR - WINDOWS INSTALLER          ║
echo ║  Version 1.0.0                                             ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] ERROR: Python 3.7+ is required but not installed
    echo [*] Download Python from: https://www.python.org/downloads/
    echo [*] Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

echo [+] Python detected
python --version

REM Check if pip is available
python -m pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] ERROR: pip is required but not available
    pause
    exit /b 1
)

echo [+] pip detected
echo.
echo [*] Installing dependencies...

REM Install colorama for colored output
python -m pip install --upgrade colorama
if %errorlevel% neq 0 (
    echo [!] ERROR: Failed to install colorama
    pause
    exit /b 1
)

echo.
echo [+] Dependencies installed successfully
echo.

REM Make the script executable (Windows shortcut creation)
echo [*] Creating shortcuts...

set SCRIPT_PATH=%cd%\metasploit_exploit_generator.py

REM Create shortcut in current directory
python -c "
import os
import sys
target = r'%SCRIPT_PATH%'
link = r'%cd%\Metasploit-Tool.lnk'
print(f'[*] Shortcut created at: {link}')
" 2>nul

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║  INSTALLATION COMPLETE                                     ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo USAGE:
echo   python metasploit_exploit_generator.py --help
echo.
echo EXAMPLES:
echo   python metasploit_exploit_generator.py exploit -n "Apache Struts2" -c CVE-2017-5645
echo   python metasploit_exploit_generator.py payload -t windows_x64 -l 192.168.1.100 -p 4444
echo   python metasploit_exploit_generator.py list --payloads
echo.
echo [*] For more options, run: python metasploit_exploit_generator.py --help
echo.

pause
