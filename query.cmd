@echo off
set path=%path%;%~dp0
cls
for %%g in (catonrug.net raymond.cc maketecheasier.com www.shoutmeloud.com opensourcepack.blogspot.com) do (
for /f "tokens=*" %%f in ('^
wget -qO- http://www.alexa.com/siteinfo/%%g#trafficstats ^|
awk "/Alexa web traffic metrics are available via/{f=1} /Last 7 days/{f=0;print} f" ^|
sed "s/ \|\d034>\|<\//\n/g" ^|
grep "^[0-9,]" ^|
head -1') do (
echo %%g %%f
)
)
pause
