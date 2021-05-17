function print_banner() {
    clear
    printf "${blue}#####################################\n"
    printf "${blue}##                                 ##\n"
    printf "${blue}##         Cipher's Termux         ##\n"
    printf "${blue}##             configs             ##\n"
    printf "${blue}##                                 ##\n"
    printf "${blue}########## name-is-cipher ###########${reset}\n\n"
}

function progress {
BAR='##############################'
FILL='------------------------------'
totalstrokes=100  # num. lines in file
barLen=30
# --- iterate over lines in csv file ---
count=0
while [[ $count -lt $totalstrokes ]]; do
    # update progress bar
    sleep 0.08
    count=$(($count + 1))
    percent=$((($count * 100 / $totalstrokes * 100) / 100))
    i=$(($percent * $barLen / 100))
    echo -ne "\r[${BAR:0:$i}${FILL:$i:barLen}] $count/$totalstrokes ($percent%)"
done
echo " "
}

print_banner

######### Termux Superuser ##########

echo "Installing Termux superuser ..."
echo " "
# Appending path in bashrc
echo " " >> $HOME/.bashrc
echo "# This PATH is for Termux superuser bin folder" >> $HOME/.bashrc
echo "export PATH=$PATH:/data/data/com.termux/files/home/.termux/bin" >> $HOME/.bashrc
mkdir $HOME/.termux/bin
# Making xsu
echo "# This file starts termux in su with all termux binaries enabled" >> $HOME/.termux/bin/xsu
echo " " >> $HOME/.termux/bin/xsu
echo "su -c 'export PATH=\$PATH:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/usr/bin/applets:/data/data/com.termux/files/home/.termux/bin; exec su'" >> $HOME/.termux/bin/xsu
echo " " >> $HOME/.termux/bin/xsu
echo "# Author: Aravind Swami [github: name-is-cipher]" >> $HOME/.termux/bin/xsu
echo "# Twitter: name_is_cipher" >> $HOME/.termux/bin/xsu
echo "# Mail: aravindswami135@gmail.com" >> $HOME/.termux/bin/xsu
chmod +x $HOME/.termux/bin/xsu
progress
echo " "
echo "Installation successful !!!"
echo " "
echo "> Run 'xsu' anywhere to start Termux Superuser."
echo " "
################################


echo " --------------------------"
echo " "

###### Termux Extra keys #######

echo "Adding Extra Keys to Termux !!!"
echo " " >> .termux/termux.properties
echo "extra-keys = [ \ " >> .termux/termux.properties
echo " ['CTRL','$','|','HOME','UP','END','-','='], \ " >> .termux/termux.properties
echo " ['TAB','ESC','ALT','LEFT','DOWN','RIGHT','/','DEL'] \ " >> .termux/termux.properties
echo "]" >> .termux/termux.properties
progress
echo " "
#################################

echo "----------------------------"
echo " "

###### Adding aliases #######

echo "Adding aliase to Termux !!!"
progress
echo "ls -AlF" >> ~/.termux/bin/lsa
chmod +x ~/.termux/bin/*
echo " "
#################################


###### END of installation #######

echo " "
echo " [*] Termux needs to be restarted to work properly,"
echo "     Please restart !"
echo " "
#################################

