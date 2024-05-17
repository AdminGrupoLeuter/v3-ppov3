@echo off

%ADAIA_DRIVE%
cd %ADAIA_HOME%\tmp

echo Version de Adaia: %ADAIA_VERSION%

if DEFINED PIPENAME goto ejecuta_adaiavt
if DEFINED GWTN_TTY goto ejecuta_adaiavt
if %USUARIO% == mansco goto ejecuta_adaiavt

start /wait %SPW_BIN%\spw4gl.exe %ADAIA_HOME%\%ADAIA_VERSION%\adaia.ini %1 %2 %3 %4 %5
goto fin

:ejecuta_adaiavt
rem MODIFICADO POR SMR 23/07/2009. Añadir fichero de trazas dbg_trz
call momentos
set FICHTRZ=%ADAIA_HOME%\dbg\dbg_trz.%USUARIO%_%GWTN_AGNTPID%_%MOMENTOS%
rem FIN MODIFICADO
if %USERNAME% == adaia goto adaia
if %USERNAME% == leuter goto adaia
%SPW_BIN%\spwconsole4gl.exe -T%ADAIA_TERM% %ADAIA_HOME%\%ADAIA_VERSION%\adaia.ini -chrf%FICHTRZ% %1 %2 %3 %4 %5 2>NUL


if %USERNAME% == mansco exit
if %USERNAME% == car exit
if %USERNAME% == ltrman exit
if %USERNAME% == ltrcar exit
EXIT

:adaia
%SPW_BIN%\spwconsole4gl.exe %ADAIA_HOME%\%ADAIA_VERSION%\adaia.ini -chrf%FICHTRZ% %1 %2 %3 %4 %5 2>NUL

:fin
