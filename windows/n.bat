REM This script launches lf terminal file manager https://github.com/gokcehan/lf
REM and then cd to last directory, open on lf.
REM Name `n` is to mimic NNN file manager https://github.com/jarun/nnn or ranger file manager.
lf -last-dir-path=%tmp%\lfLastDir.txt
set /p lastDir=<%tmp%\lfLastDir.txt
cd %lastDir%
del %tmp%\lfLastDir.txt
