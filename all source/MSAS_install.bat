@echo off
set msas_ver=1.1
title msas menu installer for %msas_ver%
:MENU
ECHO.
ECHO  ............................................... 
ECHO  MSAS MENU installer for %msas_ver% By ThexGameLord Errorlevel: %errorlevel%
ECHO  ............................................... 
ECHO.
ECHO  1 - Install MSAS Menu
ECHO  2 - Uninstall MSAS Menu
ECHO.

SET /P M=Type any number then press ENTER:
IF %M%==1 GOTO INS
IF %M%==2 GOTO UNINS

:INS
@echo on
copy /V MSAS_MENU_v1.1.bat %userprofile%/Documents/MSAS >> install.log
copy /V MSAS_conf.ini %userprofile%/Documents/MSAS >> install.log
@echo off
goto MENU

:UNINS
@echo on
del %userprofile%/Documents/MSAS/MSAS_MENU_v1.1.bat>> delete.log
del %userprofile%/Documents/MSAS/MSAS_conf.ini>> delete.log
@echo off
goto MENU