@echo off
set /p timer= "Enter the desired shut down timer in seconds: "

shutdown /s /t %timer%

pause
