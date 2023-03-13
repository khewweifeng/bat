@echo off
:start
set /p y= "YT LINK: "

echo yt-dlp -U --yes-playlist -f "ba" %y% | clip
start /d C:\Users\kheww\videos
goto start

pause