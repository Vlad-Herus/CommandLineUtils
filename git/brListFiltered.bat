@echo off

rem can be called with two parameters %1 is number of recent branches to be fetched from the server; %2 is filter to be aplied on top of fetched branhces
rem can be called with one parameter : 
rem if %1 is numeric it will be used as a number of recent brancehs to be fetched from the server
rem if %1 is nut numeric it will be used a a filter for fetched branhces with number of branches = 65536

if %2.==. (

  SET "var="&for /f "delims=0123456789" %%i in ("%1") do set var=%%i
  if defined var (
    rem character is numeric. If all are numeric we're passing %1 as count parameter to brList
    brlist.bat 65536|findstr -i %1
    GOTO:EOF 
  ) else (
    rem character is numeric. If all are numeric we're passing %1 as count parameter to brList
  )

  brlist.bat %1

) else (

brlist.bat %1|findstr -i %2

)
