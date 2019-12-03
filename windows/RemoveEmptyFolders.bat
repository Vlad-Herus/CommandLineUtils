@echo off
rem loops through all directories in current fodler recursively calling rd
rem rd does not remove directories that are not empty

for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"