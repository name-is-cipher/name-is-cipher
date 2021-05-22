# This add extra Row of keys to Termux
# Needs Resatart of Termux !!!

function check_update() {
if [ ! -d ~/.termux ]; then

    echo " "
    echo " [!] Your are on older version of Termux !!!"
    echo "     Updating Termux...."
    sleep 4
    apt update
    clear
    echo " [!] if 'y/n' prompted any, hit -> y"
    sleep 5
    apt upgrade -y
    apt install wget -y
    clear
    echo " "
    echo " [*] You need completly restart the termux, "
    echo "     And start the installation again !!!"
    echo " "
    exit;
fi

}

function termux_extra-keys() {

echo " [*] Adding Extra Keys to Termux !!!"
echo " "
echo " " >> .termux/termux.properties
echo "extra-keys = [ \\" >> .termux/termux.properties
echo " ['CTRL','$','|','HOME','UP','END','-','='], \\" >> .termux/termux.properties
echo " ['TAB','ESC','ALT','LEFT','DOWN','RIGHT','/','DEL'] \\" >> .termux/termux.properties
echo "]" >> .termux/termux.properties
echo " " >> .termux/termux.properties
ibar ~/.termux/termux.properties 8
echo " "
echo " > Successfully added extra Keys to Termux !!!"
echo " "

}

check_update

if [ ! -f cipherus-libraris.sh ]; then
wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/cipherus-libraries.sh
fi

source cipherus-libraries.sh

check_tbin

termux_extra-keys
