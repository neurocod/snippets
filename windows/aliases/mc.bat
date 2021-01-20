echo off
set LANG=ru_RU.UTF-8
set LANGUAGE=
set LC_CTYPE="ru_RU.UTF-8"
set LC_NUMERIC="ru_RU.UTF-8"
set LC_TIME="ru_RU.UTF-8"
set LC_COLLATE="ru_RU.UTF-8"
set LC_MONETARY="ru_RU.UTF-8"
set LC_MESSAGES="ru_RU.UTF-8"
set LC_PAPER="ru_RU.UTF-8"
set LC_NAME="ru_RU.UTF-8"
set LC_ADDRESS="ru_RU.UTF-8"
set LC_TELEPHONE="ru_RU.UTF-8"
set LC_MEASUREMENT="ru_RU.UTF-8"
set LC_IDENTIFICATION="ru_RU.UTF-8"
set LC_ALL=

set MC_PWD_FILE=%tmp%\mc-workDir.txt
"C:\Program Files (x86)\Midnight Commander\mc.exe" --printwd="%MC_PWD_FILE%"
::if exist "%MC_PWD_FILE%"  - can't make it work
:: replace slash from unix to windows
replaceInFile.exe "%MC_PWD_FILE%" / \
set /p newDir=<"%MC_PWD_FILE%"
cd "%newDir%"
:: if not delete - mc does not overwrite next time
del /f /q "%MC_PWD_FILE%"
set MC_PWD_FILE=
set newDir=

:: made from bash analog:
::MC_USER=`id | sed 's/[^(]*(//;s/).*//'`
::MC_PWD_FILE="${TMPDIR-/tmp}/mc-$MC_USER/mc.pwd.$$"
::/usr/bin/mc -P "$MC_PWD_FILE" "$@"
::
::if test -r "$MC_PWD_FILE"; then
::        MC_PWD="`cat "$MC_PWD_FILE"`"
::        if test -n "$MC_PWD" && test -d "$MC_PWD"; then
::                cd "$MC_PWD"
::        fi
::        unset MC_PWD
::fi
::
::rm -f "$MC_PWD_FILE"
::unset MC_PWD_FILE