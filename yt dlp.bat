@echo off
cd downloads
:start
set /p y= "YT LINK: "

echo .\yt-dlp -f "bv*" %y% | clip
start /d C:\Users\kheww\Downloads
goto start

pause