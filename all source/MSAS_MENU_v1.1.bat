@echo off
set msas_ver=V1.1
title MSAS MENU By ThexGameLord %msas_ver%

for /f "tokens=1,2 delims==" %%a in (MSAS_conf.ini) do (
if %%a==memuse set memuse=%%b
if %%a==color set color=%%b
)

color %color%
goto UPDATE
:MENU
ECHO.
ECHO  ............................................... 
ECHO  MSAS MENU %msas_ver% By ThexGameLord Errorlevel: %errorlevel%
ECHO  ............................................... 
ECHO.
ECHO  1 - install server (changes name of a .jar file to required name)
ECHO  2 - run server
ECHO  3 - Edit Server properties
ECHO  4 - Edit ops
ECHO  5 - Edit whitelist
ECHO  6 - Edit banned-players
ECHO  7 - Edit banned-ips
ECHO  8 - Edit usercache
ECHO  9 - UPDATE Download latest Menu release
ECHO  10 - Here is your server IP [WARNING: SHOWS REAL IP]
ECHO  11 - DEBUG SERVER (if server crashes instantly)
ECHO  12 - EXIT
ECHO.

SET /P M=Type any number then press ENTER:
IF %M%==1 GOTO INS
IF %M%==2 GOTO RUNSER
IF %M%==3 GOTO SRVPRP
IF %M%==4 GOTO OPS
IF %M%==5 GOTO WLIST
IF %M%==6 GOTO BP
IF %M%==7 GOTO BIP
IF %M%==8 GOTO USRCCH
IF %M%==9 GOTO UPDATE
IF %M%==10 GOTO SIP
IF %M%==11 GOTO DBGSER
IF %M%==12 GOTO EOF

:INS
del eula.txt
echo #By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).>> eula.txt
echo #github.com/ThexGameLord/MSAS>> eula.txt
echo #Tue Aug 17 15:37:50 BST 2021>> eula.txt
echo eula=TRUE>> eula.txt
ren *.jar server.jar
cls
goto menu

:RUNSER
cls
echo Running please wait
java -Xms%memuse%G -Xmx%memuse%G -Dterminal.jline=true -Dterminal.ansi=false -jar server.jar -nogui
cls
goto menu

:SRVPRP
notepad server.properties
cls
goto menu

:OPS
notepad ops.json
cls
goto menu

:WLIST
notepad whitelist.json
cls
goto menu

:BP
notepad banned-players.json
cls
goto menu

:BIP
notepad banned-ips.json
cls
goto menu

:USRCCH
notepad usercache.json
cls
goto menu

:UPDATE
ECHO NOT AVAILABLE DUE TO UPDATE DELETING Other versions of MSAS
cls
goto menu

:SIP
cls
for /F %%I in ('curl http://ipecho.net/plain') do set pubip=%%I
cls
for /f "tokens=14" %%a in ('ipconfig ^| findstr IPv4') do set _IPaddr=%%a
echo Private IP is: %_IPaddr%
echo Public IP is: %pubip%
echo.
echo Skip timeout if you are ready to go back to menu 
C:\Windows\System32\timeout.exe 15
cls
goto menu

:DBGSER
cls
echo Running Debug Mode please wait
java -Xms%memuse%G -Xmx%memuse%G -Dterminal.jline=true -Dterminal.ansi=false -jar server.jar -nogui
pause
cls
goto menu

:EOF
title Quitting MSAS MENU
echo See you next time.
C:\Windows\System32\timeout.exe 5