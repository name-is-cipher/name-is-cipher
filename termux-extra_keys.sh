# This add extra Row of keys to Termux
# Needs Resatart of Termux !!!

if [ ! -f cipherus-libraris.sh ]; then
wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/cipherus-libraries.sh
fi
source cipherus-libraries.sh

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

if [ ! -d ~/.termux] 
then
    echo " "
    echo " [!] Your are on older version of Termux !!!"
    ynprompt "    it needs to update, Do you want to update"
    if [ replay == 1 ]; then
    update_termux
    clear
    echo " [*] You need completly restart the termux for installation !!!"
    elif [ replay == 0 ] then
    clean_cipherus;
    exit;
fi

check_tbin

termux_extra-keys
