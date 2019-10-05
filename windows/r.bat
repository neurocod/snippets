echo off
REM This script launches lf terminal file manager https://github.com/gokcehan/lf
REM and then cd to last directory, open in lf.
REM Name `r` is to mimic ranger file manager, which I use on linux
lf -last-dir-path=%tmp%\lfLastDir.txt
set /p lastDir=<%tmp%\lfLastDir.txt
cd %lastDir%
del %tmp%\lfLastDir.txt
