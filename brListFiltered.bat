@echo off

if %2.==. (brlist.bat %1) else (brlist.bat %1|findstr -i %2)
