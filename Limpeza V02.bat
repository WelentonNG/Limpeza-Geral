@echo off
title Windows Cleaner Pro v2.0
color 0A

:: Verifica administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
 echo Execute este script como Administrador.
 pause
 exit /b
)

:menu
cls
echo ===========================================
echo         WINDOWS CLEANER PRO v2.0
echo ===========================================
echo.
echo 1 - Limpeza Rapida
echo 2 - Limpeza Completa
echo 3 - Limpeza Profunda
echo 4 - Sair
echo.
set /p op=Escolha uma opcao: 

if "%op%"=="1" goto rapida
if "%op%"=="2" goto completa
if "%op%"=="3" goto profunda
if "%op%"=="4" exit
goto menu

:rapida
call :temp
call :dns
call :thumbs
call :recycle
goto fim

:completa
call :rapida
call :wu
call :delivery
call :browsers
call :store
goto fim

:profunda
call :completa
call :prefetch
call :defender
DISM /Online /Cleanup-Image /StartComponentCleanup
choice /M "Executar ResetBase (nao sera possivel remover atualizacoes antigas)?"
if errorlevel 2 goto fim
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
goto fim

:temp
echo Limpando temporarios...
del /f /s /q "%TEMP%\*" 2>nul
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i" 2>nul
del /f /s /q "%windir%\Temp\*" 2>nul
for /d %%i in ("%windir%\Temp\*") do rd /s /q "%%i" 2>nul
exit /b

:dns
ipconfig /flushdns
exit /b

:thumbs
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache*" 2>nul
exit /b

:recycle
powershell -NoProfile -Command "Clear-RecycleBin -Force" 2>nul
exit /b

:wu
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /f /s /q "%windir%\SoftwareDistribution\Download\*" 2>nul
net start bits >nul 2>&1
net start wuauserv >nul 2>&1
exit /b

:delivery
del /f /s /q "%ProgramData%\Microsoft\Windows\DeliveryOptimization\Cache\*" 2>nul
exit /b

:browsers
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache" 2>nul
rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" 2>nul
for /d %%i in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do rd /s /q "%%i\cache2" 2>nul
exit /b

:store
wsreset.exe
exit /b

:prefetch
del /f /s /q "%windir%\Prefetch\*" 2>nul
exit /b

:defender
if exist "%ProgramFiles%\Windows Defender\MpCmdRun.exe" (
 "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -RemoveDefinitions -DynamicSignatures
)
exit /b

:fim
echo.
echo Limpeza concluida.
pause
