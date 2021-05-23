# The is cipher's Termux configurations:

function check_update() {

if [ ! -d ~/.termux ]; then

    clear
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
    echo " [*] You need to completly restart the termux, "
    echo "     And start the installation again !!!"
    echo " "
    exit;
fi

check_update

if [ ! -f cipherus-libraris.sh ]; then
wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/cipherus-libraries.sh
fi

source cipherus-libraries.sh

###################### main ##########################

# Termux bashrc

banner_cipherusprime

termux_bashrc

check_tbin

sleep 1

# Termux Extra keys

banner_cipherusprime

termux_extra-Keys

sleep 1

# Termux sshd

banner_cipherusprime

termux_sshd

sleep 3


# Termux Ducky

banner_cipherusprime

termux_ducky

sleep 1

# Boot nethunter

banner_cipherusprime

install_boot-nethunter

sleep 1

# Termux superuser

banner_cipherusprime

install_termux-superuser

sleep 1

echo " "
echo " [*] ALL DONE..."
echo " [*] Termux is configured as per cipher's configruation..."
echo " "
echo " [!] Termux needs to be restarted to work properly,"
echo "     Please restart !!!"
echo " "
read

####################### end #########################
