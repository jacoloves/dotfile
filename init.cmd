@echo off


doskey ls=ls --color=auto --show-control-chars -N $*
doskey cp=cp -i $*
doskey rm=rm -i $*
doskey ll=ls -altr
doskey cdtana=cd %USERPROFILE%/tanasho/
doskey cdroot=cd %USERPROFILE%/tanasho/tmp/

if "%CMD_INIT_LOADED%" neq "" goto :eof
set CMD_INIT_SCRIPT_LOADED=1

set PATH=C:\msys64\usr\bin;%PATH%

cd %USERPROFILE%
cls
