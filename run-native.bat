@echo off
cd /d %~dp0
set PATH=C:\libwatchdogs;%PATH%

start "" watchdogs.win

:wait_start
tasklist /fi "imagename eq watchdogs.win" | find "watchdogs.win" >nul
if %errorlevel% neq 0 (
    timeout /t 1 /nobreak >nul
    goto :wait_start
)

echo .. Watchdogs has been started. This is the Command Prompt terminal that will appear if Watchdogs stops running...

:monitor
timeout /t 1 /nobreak >nul
tasklist /fi "imagename eq watchdogs.win" | find "watchdogs.win" >nul
if %errorlevel%==0 (
    goto :monitor
) else (
    echo Program ended. Opening CMD...
    start cmd /k "cd /d %CD%"
)
