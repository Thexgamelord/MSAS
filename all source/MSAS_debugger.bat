@echo off
title Debugger for MSAS
mode con:cols=101 lines=16

del *.log

ECHO ...............................................................................................
ECHO 	Please Note that this only works with MSAS menus
ECHO ...............................................................................................

timeout /t 4 >NUL
cls

:errorblank
color 07
ECHO ...............................................................................................
ECHO 	Current Directory: %cd%
ECHO ...............................................................................................

SET /P msasVER=Type any version of MSAS(like 1.1) then press ENTER to DEBUG:
if "%msasVER%"=="" cls & color 04 & Echo You didnt select a version! & timeout 5 >NUL & cls & goto errorblank
start MSAS_MENU_v%msasVER%.bat >> debugging_v%msasVER%.log

ECHO ...............................................................................................
ECHO	Errorlevel: %errorlevel%	Current Directory: %cd%		Version you ran: %msasVER%
ECHO ...............................................................................................
title Debugger for MSAS [running: %msasVER%]
pause >NUL