@ECHO OFF
:start
set /p r= "RACK NUMBER: "
set /p c= "A OR B: "
set /p n= "COLUMN NUMBER: "

echo rack%r%-%c%%n% | clip
goto start
pause