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
    printf "    ${blue}|||||||||| name-is-cipher  ||||||||||${reset}\n\n"
          echo "----------------------------------------------"
    echo "  "

}

function update_termux() {
    
    apt update
    clear
    echo "if prompted hit -> y"
    sleep 2
    apt upgrade -y

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
        rm .wget-hsts
    fi
}

function termux_extra-keys() {

echo " "
echo " [*] Adding Extra Keys to Termux !!!"
echo " "

# Binding extra keys
echo " " >> ~/.termux/termux.properties
echo "# Cipher's Termux Extra keys Configuration:" >> ~/.termux/termux.properties
echo " " >> ~/.termux/termux.properties
echo "extra-keys = [ \\" >> ~/.termux/termux.properties
echo " ['CTRL','$','|','HOME','UP','END','-','='], \\" >> ~/.termux/termux.properties
echo " ['TAB','ESC','ALT','LEFT','DOWN','RIGHT','/','DEL'] \\" >> ~/.termux/termux.properties
echo "]" >> ~/.termux/termux.properties
echo " " >> ~/.termux/termux.properties

ibar ~/.termux/termux.properties 96

echo " "
echo " > Successfully added extra Keys to Termux !!!"
echo "   Restart the termux to see the changes..."
echo " "

}

function termux-sshd() {

echo " "
echo " [*] Installing sshd to Termux !!!"
echo " "
apt install openssh
clear
echo " > Set the Passwaord for user,"
echo "   in order to Login to ssh..."
echo " "
passwd
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

wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/binaries/hid-gadget-test
chmod +x hid-gadget-test
mv  hid-gadget-test /data/data/com.termux/files/usr/bin
clear
echo " "
echo " > Successfully installed Ducky !!!"
echo " "


}