rm eula.txt
echo Thank you for Downloading MSAS Linux>> eula.txt
echo eula=TRUE>> eula.txt
clear
echo			MSAS Linux By ThexGameLord
echo
echo			MSAS_Linux Menu Coming soon
echo	   To Check For Updates goto the MSAS Github releases.
echo		  github.com/ThexGameLord/MSAS/releases
echo
sleep 5
clear
echo Loading Please Wait as the server has to check the eula.txt
java -Xms1G -Xmx1G -Dterminal.jline=true -Dterminal.ansi=false -jar server.jar -nogui
sleep 5
