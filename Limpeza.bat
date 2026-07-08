@echo off
title Limpeza Completa do Windows
color 0A

echo ==========================================================
echo             LIMPEZA COMPLETA DO WINDOWS
echo ==========================================================
echo.

:: Verifica se esta como Administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ERRO: Execute este script como Administrador.
    echo.
    pause
    exit
)

:: ----------------------------------------------------------
:: WINDOWS TEMP
:: ----------------------------------------------------------

echo [1/18] Limpando C:\Windows\Temp...
del /f /s /q "%windir%\Temp\*.*" 2>nul
for /d %%i in ("%windir%\Temp\*") do rd /s /q "%%i" 2>nul

echo [2/18] Limpando Temp do Usuario...
del /f /s /q "%TEMP%\*.*" 2>nul
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i" 2>nul

echo [3/18] Limpando Local Temp...
del /f /s /q "%LOCALAPPDATA%\Temp\*.*" 2>nul
for /d %%i in ("%LOCALAPPDATA%\Temp\*") do rd /s /q "%%i" 2>nul

echo [4/18] Limpando Arquivos Recentes...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*.*" 2>nul

:: ----------------------------------------------------------
:: DNS
:: ----------------------------------------------------------

echo [5/18] Limpando Cache DNS...
ipconfig /flushdns >nul

:: ----------------------------------------------------------
:: WINDOWS UPDATE
:: ----------------------------------------------------------

echo [6/18] Limpando Windows Update...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1

rd /s /q "%windir%\SoftwareDistribution\Download" 2>nul
mkdir "%windir%\SoftwareDistribution\Download"

rd /s /q "%windir%\SoftwareDistribution\DeliveryOptimization" 2>nul
mkdir "%windir%\SoftwareDistribution\DeliveryOptimization"

net start bits >nul 2>&1
net start wuauserv >nul 2>&1

:: ----------------------------------------------------------
:: DELIVERY OPTIMIZATION
:: ----------------------------------------------------------

echo [7/18] Limpando Delivery Optimization...
rd /s /q "%ProgramData%\Microsoft\Windows\DeliveryOptimization" 2>nul
mkdir "%ProgramData%\Microsoft\Windows\DeliveryOptimization"

:: ----------------------------------------------------------
:: LOGS
:: ----------------------------------------------------------

echo [8/18] Limpando Logs do Windows...
del /f /s /q "%windir%\Logs\*.*" 2>nul

echo [9/18] Limpando Logs CBS...
del /f /s /q "%windir%\Logs\CBS\*.*" 2>nul

echo [10/18] Limpando Logs DISM...
del /f /s /q "%windir%\Logs\DISM\*.*" 2>nul

:: ----------------------------------------------------------
:: RELATORIOS DE ERRO
:: ----------------------------------------------------------

echo [11/18] Limpando Crash Dumps...
rd /s /q "%LOCALAPPDATA%\CrashDumps" 2>nul
mkdir "%LOCALAPPDATA%\CrashDumps"

echo [12/18] Limpando Windows Error Reporting...
rd /s /q "%ProgramData%\Microsoft\Windows\WER" 2>nul
mkdir "%ProgramData%\Microsoft\Windows\WER"

rd /s /q "%LOCALAPPDATA%\Microsoft\Windows\WER" 2>nul
mkdir "%LOCALAPPDATA%\Microsoft\Windows\WER"

:: ----------------------------------------------------------
:: MINIATURAS
:: ----------------------------------------------------------

echo [13/18] Limpando Cache de Miniaturas...
del /f /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
del /f /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache_*.db" 2>nul

:: ----------------------------------------------------------
:: DIRECTX
:: ----------------------------------------------------------

echo [14/18] Limpando Cache DirectX...
rd /s /q "%LOCALAPPDATA%\D3DSCache" 2>nul
mkdir "%LOCALAPPDATA%\D3DSCache"

:: ----------------------------------------------------------
:: LIXEIRA
:: ----------------------------------------------------------

echo [15/18] Esvaziando Lixeira...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Clear-RecycleBin -Force" >nul 2>&1

:: ----------------------------------------------------------
:: MICROSOFT STORE
:: ----------------------------------------------------------

echo [16/18] Limpando Cache da Microsoft Store...
start /wait wsreset.exe

:: ----------------------------------------------------------
:: COMPONENTES ANTIGOS
:: ----------------------------------------------------------

echo [17/18] Limpando Componentes Antigos do Windows...
DISM /Online /Cleanup-Image /StartComponentCleanup

:: ----------------------------------------------------------
:: CLEANMGR
:: ----------------------------------------------------------

echo [18/18] Abrindo Limpeza de Disco...
start "" cleanmgr.exe

echo.
echo ==========================================================
echo             LIMPEZA CONCLUIDA COM SUCESSO!
echo ==========================================================
echo.
pause
exit
