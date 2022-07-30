@echo off
title MSAS MENU By ThexGameLord V1.0
:MENU
ECHO.
ECHO  ............................................... 
ECHO  MSAS MENU V1.0 By ThexGameLord			
ECHO  ............................................... 
ECHO.
ECHO  1 - install server
ECHO  2 - run server
ECHO  3 - Edit Server properties
ECHO  4 - Edit ops
ECHO  5 - Edit whitelist
ECHO  6 - Edit banned-players
ECHO  7 - Edit banned-ips
ECHO  8 - Edit usercache
ECHO  9 - UPDATE Download latest Menu release
ECHO  10 - Here is your server IP
ECHO  11 - EXIT
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
IF %M%==11 GOTO EOF

:INS
del eula.txt
echo #By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).>> eula.txt
echo #Tue Aug 17 15:37:50 BST 2021>> eula.txt
echo eula=TRUE>> eula.txt
cls
goto menu

:RUNSER
cls
echo Running please wait
java -Xms1G -Xmx1G -Dterminal.jline=true -Dterminal.ansi=false -jar server.jar -nogui
cls
goto menu

:SRVPRP
edit server.properties
cls
goto menu

:OPS
nano ops.json
cls
goto menu

:WLIST
nano whitelist.json
cls
goto menu

:BP
nano banned-players.json
cls
goto menu

:BIP
nano banned-ips.json
cls
goto menu

:USRCCH
nano usercache.json
cls
goto menu

:UPDATE
start https://github.com/ThexGameLord/MSAS/releases/latest/download/MSAS_MENU.exe
cls
goto menu

:SIP
cls
for /f "tokens=14" %%a in ('ipconfig ^| findstr IPv4') do set _IPaddr=%%a
echo IP is: %_IPaddr%
echo.
echo Skip timeout if you are ready to go back to menu 
C:\Windows\System32\timeout.exe 15
cls
goto menu

:EOF
title Quitting MSAS MENU
echo See you next time.
C:\Windows\System32\timeout.exe 5