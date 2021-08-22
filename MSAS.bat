@echo off
title MinecraftServerAutoSetup By ThexGameLord V1.0
del eula.txt
echo #By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).>> eula.txt
echo #Tue Aug 17 15:37:50 BST 2021>> eula.txt
echo eula=TRUE>> eula.txt
cls
echo.			MSAS By ThexGameLord
echo.
echo.			MSAS Menu Coming soon
echo.	   To Check For Updates goto the MSAS Github releases.
echo.		  github.com/ThexGameLord/MSAS/releases
echo.
C:\Windows\System32\timeout.exe 5
title MSAS By ThexGameLord V1.0
cls
echo Loading Please Wait as the server has to check the eula.txt
java -Xms1G -Xmx1G -Dterminal.jline=true -Dterminal.ansi=false -jar server.jar -nogui
pause
