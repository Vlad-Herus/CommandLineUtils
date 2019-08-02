@echo off
if "%~1"=="" (
echo cloneStream :: filename argiment is missing 
exit /b 1
)

setlocal DisableDelayedExpansion

for /F "tokens=*" %%a in ('findstr /n $') do (
  set "line=%%a"
  setlocal EnableDelayedExpansion
  set "line=!line:*:=!"
  echo(!line!
  echo(!line! >> %1
  endlocal
)
