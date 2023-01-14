@echo off
setlocal enabledelayedexpansion
set c=0
for /f "eol=# tokens=* delims=," %%x in (config.txt) do (
    set /a c+=1
    set v[!c!]=%%x
)

echo Your GRLC address:
echo %v[1]%
echo ====================================
echo Miner: %v[2]%
echo ====================================
echo This version supports the freshgarlic
echo Pool: freshgarlicblocks.net:3032
echo ====================================

:start_grlc
echo Starting the miner, please wait...
timeout /t 10 >nul
.\\bin\\%v[2]% -a allium -o stratum+tcp://freshgarlicblocks.net:3032 -u daily-%v[1]% -p x
goto :start_grlc
pause
