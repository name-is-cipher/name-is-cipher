# This functions are part of cipherus tool installations
# After installation if you still see this file.
# The package might have been broken. Please contact, the creator.
# Author ->
# Aravind Swami [github: name-is-cipher]
# Twitter: name_is_cipher
# Mail: aravindswami135@gmail.com

function banner_cipherusprime() {

    blue='\033[1;34m'
    light_cyan='\033[1;96m'
    reset='\033[0m'

    clear
    printf "    ${blue}#####################################\n"
    printf "    ${blue}##                                 ##\n"
    printf "    ${blue}##         CipherusPrime           ##\n"
    printf "    ${blue}##                                 ##\n"
    printf "    ${blue}#####################################\n"
    printf "    ${blue}|||||||  ${light_cyan}name-is-cipher  ${blue}|||||||\n"
    printf "    ${blue}-------------------------------------${reset}"
    echo " "
    echo " "

}

function ynprompt() {

    echo " "
    read -p "$1 (y/n): " replay

    while true; do

    if [ "$replay" = "Y" ] || [ "$replay" = "y" ]; then
    replay=1
    exit;
    elif [ "$replay" = "N" ] || [ "$replay" = "n" ]; then
    replay=0
    exit;
    fi
    read -p "$1, only (y/n): " replay
    echo " "
    done

}

function check_tbin() {

    if [ ! -d ~/.termux/bin ]; then
        
        mkdir ~/.termux/bin
        echo " " >> ~/.bashrc
        echo "# This PATH is for Termux superuser bin folder" >> ~/.bashrc
        echo " " >> ~/.bashrc
        echo "export PATH=\$PATH:/data/data/com.termux/files/home/.termux/bin" >> ~/.bashrc

    fi

}

function ibar {

    FILE=$1
    BAR='##############################'
    FILL='------------------------------'
    Lines=$2  # To No. lines in file that need to be present.
    barLen=30 # Bar Lenght of progressbar.
    count=0

    echo " "
    # --- iterate over lines in of passed on file ---
    while IFS=, read -r line; do
    # update progress bar
    sleep 0.1
    count=$(($count + 1))
    percent=$((($count * 100 / $Lines * 100) / 100))
    i=$(($percent * $barLen / 100))
    echo -ne "\r[${BAR:0:$i}${FILL:$i:barLen}] $count/$Lines ($percent %)"
    done < $FILE
    echo " "

    # Integrity checker
    if [ $percent != 100 ]; then
    echo " "
    echo " [!] File is corrupt, Please try to reinstall !!!"
    echo " "
    echo " If you keep seeing this error, contact the Author:-"
    echo " "
    echo " github: name-is-cipher"
    echo " Twitter: name_is_cipher"
    echo " Mail: aravindswami135@gmail.com"
    clean_cipherus
    read
    exit
    fi
    echo " "
    echo " "

}

function clean_cipherus() {

    if [ -f cipherus-libraries.sh ]; then
        rm cipherus-libraries.sh
        rm ~/.wget-hsts
    fi
}

function termux_extra-keys() {

echo " "
echo " [*] Adding Extra Keys to Termux !!!"
echo " "

# Binding extra keys
echo "# Cipher's Termux Extra keys Configuration:" > ~/.termux/termux.properties
echo " " >> ~/.termux/termux.properties
echo "extra-keys = [ \\" >> ~/.termux/termux.properties
echo " ['CTRL','$','|','HOME','UP','END','-','='], \\" >> ~/.termux/termux.properties
echo " ['TAB','ESC','ALT','LEFT','DOWN','RIGHT','/','DEL'] \\" >> ~/.termux/termux.properties
echo "]" >> ~/.termux/termux.properties

ibar ~/.termux/termux.properties 6

echo " "
echo " > Successfully added extra Keys to Termux !!!"
echo "   Restart the termux to see the changes..."
echo " "

}

function termux_sshd() {

echo " "
echo " [*] Installing sshd !!!"
echo " "
apt install openssh
clear
echo " > Set the Passwaord for current user,"
echo "   in order to Login to ssh..."
echo " "
passwd
echo " "
echo " > Successfully installed sshd !!!"
echo " "
echo "   -> start : $ sshd"
echo "   -> stop  : $ pkill sshd"
echo " "

}

function termux_ducky() {

echo " "
echo " [*] Installing Ducky !!!"
echo " "

wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/assets/hid-gadget-test
wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/assets/ducky.txt
mv ducky.txt ducky
chmod +x hid-gadget-test
chmod +x ducky
mv hid-gadget-test /data/data/com.termux/files/usr/bin
mv ducky ~/.termux/bin

ibar ~/.termux/bin/ducky 411

echo " "
echo " [*] Successfully installed Ducky !!!"
echo " "


}

function termux_bashrc() {

echo " [*] Configuring bashrc ..."
echo " "
wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/assets/bashrc.txt
mv bashrc.txt ~/.bashrc

ibar ~/.termux/bin/ducky 32

echo " [*] Successfully Configured bashrc"
echo " "

}

function install_boot-nethunter() {

    echo " [*] Installing Boot Nethunter ..."
    echo " "

    # Making boot-kali
    echo "#! /data/data/com.termux/files/usr/bin/bash" > ~/.termux/bin/boot-kali
    echo "# This scrpit boots nethunter in termux" >> ~/.termux/bin/boot-kali
    echo >> ~/.termux/bin/boot-kali
    echo "su -c '" >> ~/.termux/bin/boot-kali
    echo "nethunter_env=\$PATH:/system/sbin" >> ~/.termux/bin/boot-kali
    echo "nethunter_env=\$nethunter_env:/product/bin" >> ~/.termux/bin/boot-kali
    echo "nethunter_env=\$nethunter_env:/apex/com.android.runtime/bin" >> ~/.termux/bin/boot-kali
    echo "nethunter_env=\$nethunter_env:/odm/bin" >> ~/.termux/bin/boot-kali
    echo "nethunter_env=\$nethunter_env:/vendor/bin" >> ~/.termux/bin/boot-kali
    echo "nethunter_env=\$nethunter_env:/vendor/xbin" >> ~/.termux/bin/boot-kali
    echo "nethunter_env=\$nethunter_env:/data/data/com.offsec.nethunter/files/scripts" >> ~/.termux/bin/boot-kali
    echo "nethunter_env=\$nethunter_env:/data/data/com.offsec.nethunter/files/scripts/bin" >> ~/.termux/bin/boot-kali
    echo "export PATH=\$nethunter_env; exec bootkali'" >> ~/.termux/bin/boot-kali
    echo >> ~/.termux/bin/boot-kali
    echo "# Author: Aravind Swami [github: name-is-cipher]" >> ~/.termux/bin/boot-kali
    echo "# Mail: aravindswami135@gmail.com" >> ~/.termux/bin/boot-kali

    chmod +x ~/.termux/bin/boot-kali
    ibar ~/.termux/bin/boot-kali 16
    echo " "
    echo " [*] Installation successful !!!"
    echo " "
    echo "> Run 'boot-kali' anywhere to start Kali Chroot."
    echo " "

}

function install_termux-superuser() {

    echo " [*] Installing Termux superuser ..."
    echo " "

    # Making xsu
    echo "#! /data/data/com.termux/files/usr/bin/bash" > ~/.termux/bin/xsu
    echo "# This file starts termux in su with all termux binaries enabled" >> ~/.termux/bin/xsu
    echo >> ~/.termux/bin/xsu
    echo "su -c '" >> ~/.termux/bin/xsu
    echo "xsu_env=\$PATH:/data/data/com.termux/files/usr/bin" >> ~/.termux/bin/xsu
    echo "xsu_env=\$xsu_env:/data/data/com.termux/files/usr/bin/applets" >> ~/.termux/bin/xsu
    echo "xsu_env=\$xsu_env:/data/data/com.termux/files/home/.termux/bin" >> ~/.termux/bin/xsu
    echo "export PATH=\$xsu_env; exec su'" >> ~/.termux/bin/xsu
    echo >> ~/.termux/bin/xsu
    echo "# Author: Aravind Swami [github: name-is-cipher]" >> ~/.termux/bin/xsu
    echo "# Twitter: name_is_cipher" >> ~/.termux/bin/xsu
    echo "# Mail: aravindswami135@gmail.com" >> ~/.termux/bin/xsu

    chmod +x ~/.termux/bin/xsu
    ibar ~/.termux/bin/xsu 12

    echo " "
    echo " [*] Installation successful !!!"
    echo " "
    echo "> Run 'xsu' anywhere to start Termux Superuser."
    echo " "

}