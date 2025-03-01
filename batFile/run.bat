@echo off
REM Set Width length
setlocal enabledelayedexpansion
for /f %%W in ('powershell -Command "(Get-Host).UI.RawUI.WindowSize.Width"') do set "width=%%W"
set "line="

REM Settings WSL Kali-Linux in Extended Storage
REM Windows requires WSL feature activation.
REM Code By Kai_HT

REM Will be updated later
REM Version 1.0
REM Save format: ANSI

title Kali-Linux With WSL2 on USB - Kai_HT
echo ┌───────────────────────────────────────────────────┒
echo │        Install Kali WSL in Extended Storage       ┃
echo │               Scripting From Kai_HT               ┃
echo ┕━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
echo.
echo.
set /p SetExLocal=Select an External Storage to Install WSL-Kali (Ex. E): 
echo.

for /l %%i in (1,1,%width%) do set "line=!line!─"
echo Start WSL-Kali on Extended Storage.

mkdir %SetExLocal%:\Kali\
wsl --export kali-linux %SetExLocal%:\Kali\Kali-wsl.tar
mkdir %SetExLocal%:\Kali\kali-wsl

wsl --unregister kali-linux
wsl --import kali-linux %SetExLocal%:\Kali\kali-wsl %SetExLocal%:\Kali\Kali-wsl.tar
wsl -
echo Checking Install Complete.
wsl -d kali-linux kex --win -s
for /l %%i in (1,1,%width%) do set "line=!line!─"
echo Kali WSL Move to Extended Storage Complete.
pause
