@echo off
set path=%path%;%~dp0
set site=catonrug.net
cls
for %%g in (^
catonrug.net ^
opensourcepack.blogspot.com ^
raymond.cc ^
maketecheasier.com ^
makeuseof.com) do (
echo %%g
for /f "tokens=*" %%f in ('^
wget -qO- http://www.alexa.com/siteinfo/%%g#trafficstats ^|
awk "/Alexa web traffic metrics are available via/{f=1} /Last 7 days/{f=0;print} f" ^|
sed "s/ \|\d034>\|<\//\n/g" ^|
grep "^[0-9,]" ^|
head -1') do (
if not exist "%userprofile%\.alexa\%%g" md "%userprofile%\.alexa\%%g" 
for /f "tokens=*" %%d in ('"%~dp0date.exe" +%%Y-%%m-%%d') do (
if not exist "%userprofile%\.alexa\%%g\%%d.log" (
echo %%d %%g %%f> "%userprofile%\.alexa\%%g\%%d.log"
)
)
)
for /f "tokens=*" %%h in ('dir /b "%userprofile%\.alexa\%%g\"') do (
type "%userprofile%\.alexa\%%g\%%h"
)
echo.
)
pause
