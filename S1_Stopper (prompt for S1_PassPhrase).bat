@ECHO OFF
:: __________________________________________________________________________________________________

@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------


::__________________________________________________________________________________________________


for /f "delims=" %%a in ('dir /b /s /a:d "c:\program files\SentinelOne\S*"') do set "dPath=%%a"

Echo.Path is: %dPath%
@Echo.

CD %dPath%

:: "PP" = Sentinel's PassPhrase 
set "PP="  
set /p PP="Enter SentinelOne PassPhrase: " 

sentinelctl unprotect "-k %PP%"
:: sentinelctl unprotect "-k [Your SentinelOne's PassPhrase]"  
sentinelctl unload -m -a
sc query sentinelagent
sc query sentinelmonitor
Echo.                     

pause
