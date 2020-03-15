for /f "tokens=1,2" %%u in ('date /t') do set d=%%v
for /f "tokens=1" %%u in ('time /t') do set t=%%u
if "%t:~1,1%"==":" set t=0%t%
rem set timestr=%d:~6,4%%d:~3,2%%d:~0,2%%t:~0,2%%t:~3,2%
set datestr=%d:~6,4%%d:~0,2%%d:~3,2%
set timestr=%t:~0,2%%t:~3,2%

@echo %datestr%-%timestr%
@echo %datestr%
@echo %timestr%
exp sarek/Drl1234#@drl file="qFlow_db.dmp" log="logname.log"