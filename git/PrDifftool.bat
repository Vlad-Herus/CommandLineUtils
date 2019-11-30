@echo off

rem this script will open configured difftool to show the differece between pull reqeust host and base branches

rem input parameters : 
rem %1 - pull request number

rem Dependencies :
rem git must be in path
rem hub must be in path
rem must be called from github repo folder  
rem difftool must be configured in git


rem temp file that will be used to transport command output into variable. I don't know a better way
set fileName=dithubPrMergeTool.tmp
IF EXIST %fileName% del %fileName%

rem string used as a marker to extract branch name from pr list output
set marker==uniqueStringToFind
set markerWithNumber=%1%marker%

rem dumping host branch name(still with marker string) into a file and reading into variable
hub pr list -s open -f "%%I%marker%%%H%%n" | findstr %markerWithNumber% > %fileName%
set /p hostBranchDirty=<%filename%

rem dumping base branch name(still with marker string) into a file and reading into variable
hub pr list -s open -f "%%I%marker%%%B%%n" | findstr %markerWithNumber% > %fileName%
set /p baseBranchDirty=<%filename%

IF EXIST %fileName% del %fileName%

rem removing the garbage from branch names
set hostBranch=%hostBranchDirty:*uniqueStringToFind=%
set baseBranch=%baseBranchDirty:*uniqueStringToFind=%

rem I don't know how to do fancy fetch for branches that I need so I'm fetching all
git fetch --all
@echo on
start git difftool -d origin/%baseBranch%...origin/%hostBranch%    
