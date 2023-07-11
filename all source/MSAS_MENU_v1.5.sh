#!/bin/bash

msas_ver="v1.5"
title="MSAS MENU By ThexGameLord $msas_ver"

if [ ! -f "MSAS_conf.ini" ]; then
    misconf
fi

while IFS="=" read -r a b; do
    if [[ "$a" == "memuse" ]]; then
        memuse="$b"
    elif [[ "$a" == "color" ]]; then
        color="$b"
    fi
done < "MSAS_conf.ini"

misconf() {
    color="04"
    echo "You dont have a MSAS_conf.ini file [generating one for you now]"
    sleep 5
    color="07"
    echo "[Server Options]" >> MSAS_conf.ini
    echo "memuse=1" >> MSAS_conf.ini
    echo "#if you use 1 the server will use -Xms1G -Xmx1G for 1G of memory" >> MSAS_conf.ini
    echo "#Default is 1" >> MSAS_conf.ini
    echo "[Console Options]" >> MSAS_conf.ini
    echo "color=07" >> MSAS_conf.ini
    echo "#default is 07 (0 is the background , 7 is the foreground)" >> MSAS_conf.ini
    RELOAD
}


mode="con:cols=70 lines=20"
color="$color"

if [ ! -f "MSAS_conf.ini" ]; then
    misconf="true"
fi

echo "MSAS  Copyright (C) 2023  Thexgamelord"
echo "This program comes with ABSOLUTELY NO WARRANTY; for details type '14'."
echo "This is free software, and you are welcome to redistribute it"
echo "under certain conditions; type '14' for details."
sleep 4
clear

MENU() {
    echo ""
    echo "..............................................."
    echo "MSAS MENU $msas_ver By ThexGameLord Errorlevel: $errorlevel"
    echo "..............................................."
    echo ""
    echo "1  - install server (changes name of a .jar file to required name)"
    echo "2  - run server"
    echo "3  - Edit Server properties"
    echo "4  - Edit ops"
    echo "5  - Edit whitelist"
    echo "6  - Edit banned-players"
    echo "7  - Edit banned-ips"
    echo "8  - Edit usercache"
    echo "9  - UPDATE Download latest Menu release"
    echo "10 - Here is your server IP [WARNING: SHOWS REAL IP]"
    echo "11 - DEBUG SERVER (if server crashes instantly)"
    echo "12 - SSH"
    echo "13 - RELOAD (reopens MSAS)"
    echo "14 - Open License page"
    echo "15 - Website"
    echo "16 - EXIT"
    echo ""
    read -p "Type any number then press ENTER: " M
    if [[ -z "$M" ]]; then
        clear
        echo "You need to use one of these options."
        sleep 4
        clear
        MENU
    elif (( M == 1 )); then
        INS
    elif (( M == 2 )); then
        RUNSER
    elif (( M == 3 )); then
        SRVPRP
    elif (( M == 4 )); then
        OPS
    elif (( M == 5 )); then
        WLIST
    elif (( M == 6 )); then
        BP
    elif (( M == 7 )); then
        BIP
    elif (( M == 8 )); then
        USRCCH
    elif (( M == 9 )); then
        UPDATE
    elif (( M == 10 )); then
        SIP
    elif (( M == 11 )); then
        DBGSER
    elif (( M == 12 )); then
        SSH_SER
    elif (( M == 13 )); then
        RELOAD
    elif (( M == 14 )); then
        LICENSE
    elif (( M == 15 )); then
        SITE
    elif (( M == 16 )); then
        EOF
    else
        clear
        echo "Invalid option. Please try again."
        sleep 2
        clear
        MENU
    fi
}

INS() {
    rm -f eula.txt
    echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." >> eula.txt
    echo "#github.com/ThexGameLord/MSAS" >> eula.txt
    echo "#Tue Aug 17 15:37:50 BST 2021" >> eula.txt
    echo "eula=TRUE" >> eula.txt
    echo "#Thank you for downloading MSAS if you purchased this then you got scammed, MSAS is free and will always be. - ThexGameLord" >> eula.txt
    rename 's/\.jar/server.jar/' *.jar > /dev/null 2>&1
    clear
    MENU
}

RUNSER() {
    clear
    echo "Running please wait"
    java -Xms"${memuse}G" -Xmx"${memuse}G" -Dterminal.jline=true -Dterminal.ansi=false -jar server.jar -nogui
    clear
    echo "Restarting please wait or [CTRL + C] to stop the loop"
    sleep 5
    RUNSER
}

SRVPRP() {
    nano server.properties
    clear
    MENU
}

OPS() {
    nano ops.json
    clear
    MENU
}

WLIST() {
    nano whitelist.json
    clear
    MENU
}

BP() {
    nano banned-players.json
    clear
    MENU
}

BIP() {
    nano banned-ips.json
    clear
    MENU
}

USRCCH() {
    nano usercache.json
    clear
    MENU
}

UPDATE() {
    echo "NOT AVAILABLE DUE TO UPDATE DELETING Other versions of MSAS"
    sleep 2
    clear
    MENU
}

SIP() {
    clear
    pubip="$(curl -s http://ipecho.net/plain)"
    clear
    _IPaddr="$(ip addr show | awk '/inet /{print $2}' | sed 's/\/.*//')"
    echo "Private IP is: $_IPaddr"
    echo "Public IP is: $pubip"
    echo ""
    read -p "Press [Enter] if you are ready to go back to menu"
    clear
    MENU
}

DBGSER() {
    clear
    echo "Running Debug Mode please wait"
    java -Xms"${memuse}G" -Xmx"${memuse}G" -Dterminal.jline=true -Dterminal.ansi=false -jar server.jar -nogui
    read -p "Press [Enter] to continue"
    clear
    MENU
}

SSH_SER() {
    clear
    if [ ! -f "SSH_SERVER.ini" ]; then
        SSH_SERVER_ini_Write
    fi
    serverIPAddress=$(grep -i "serverIPAddress" SSH_SERVER.ini | cut -d'=' -f2)
    USER=$(grep -i "USER" SSH_SERVER.ini | cut -d'=' -f2)
    PASS=$(grep -i "PASS" SSH_SERVER.ini | cut -d'=' -f2)
    echo "Server IP: $serverIPAddress [Connecting]"
    sleep 2
    clear
    color="07"
    ssh "$USER"@"$serverIPAddress"
    sleep 2
    title="$title"
    color="$color"
    MENU
}

SSH_SERVER_ini_Write() {
    clear
    echo ""
    echo "Enter your Server IP address and press enter to continue."
    echo ""
    echo "example IP: 127.0.0.1 or 192.168.1.255"
    echo ""
    echo "Note: You can edit these settings after setting it here."
    echo "By opening the FTP.ini file with notepad.exe"
    echo ""
    read -p "Server IP address: " serverIPAddress
    clear
    echo "Enter your Server Username and press enter to continue."
    read -p "SSH USER: " USER
    if [[ -z "$serverIPAddress" ]]; then
        echo "The IP address cannot be blank."
        clear
        SSH_SERVER_ini_Write
    fi
    {
        echo "[Quick SSH settings]"
        echo "serverIPAddress=$serverIPAddress"
        echo "USER=$USER"
        echo "#This file was generated by setting up your SSH info in MSAS using option 12"
    } > SSH_SERVER.ini
    SSH_SER
}

RELOAD() {
    nohup ./MSAS_MENU_"$msas_ver".sh > /dev/null 2>&1 &
    exit
}

LICENSE() {
    xdg-open "https://msas-txgl.pages.dev/LICENSE"
    clear
    MENU
}

SITE() {
    xdg-open "https://msas-txgl.pages.dev/"
    clear
    MENU
}

EOF() {
    title="Quitting MSAS MENU"
    clear
    echo "See you next time."
    sleep 5
    exit
}

title="$title"
clear
MENU
