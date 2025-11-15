@echo off
cd /d "%~dp0"
set "PATH=C:\libwatchdogs;%PATH%"
if not exist "%~dp0watchdogs.win" (
    echo ERROR: watchdogs.win not found in "%~dp0"
    exit /b 1
)
"%~dp0watchdogs.win" %*
exit /b %ERRORLEVEL%
