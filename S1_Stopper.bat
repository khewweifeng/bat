@ECHO OFF

:login
:: ECHO.Admin login
:: set "aUN="
:: set "aPW="
:: set /p "aUN=Enter username: "
:: set /p "aPW=Enter password: "

:: for /f "delims=" %%a in ('dir /b /s /a:d "c:\program files\sentinel agent*"') do set "dPath=%%a"
for /f "delims=" %%a in ('dir /b /s /a:d "c:\program files\SentinelOne\S*"') do set "dPath=%%a"

Echo.Path is: %dPath%
@Echo.

CD %dPath%


sentinelctl unprotect ""
sentinelctl unload -m -a
sc query sentinelagent
sc query sentinelmonitor
Echo.

pause
