rem prints n most recently changed remote branches
rem takes one parameter - number of branches to print

@echo off 
setlocal enableextensions 
for /f "tokens=*" %%a in ( 
'git for-each-ref --sort=-committerdate --format="%%(committerdate:short) %%(authorname) %%(refname:short)" refs/remotes/origin --count %1' 
) do ( 
  call :printBranch %%a
) 

exit 


:printBranch

set "spaces=                                           "
set "name=%2%spaces%"
set "name=%name:~0,20%"

echo %1      %name% %3

goto :eof

