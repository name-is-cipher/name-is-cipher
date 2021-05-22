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

}

function banner_cipherus-termux() {

  blue='\033[1;34m'
  light_cyan='\033[1;96m'
  reset='\033[0m'

    clear
    printf "  ${blue}#####################################\n"
    printf "  ${blue}##                                 ##\n"
    printf "  ${blue}##         Cipher's Termux         ##\n"
    printf "  ${blue}##             configs             ##\n"
    printf "  ${blue}##                                 ##\n"
    printf "  ${blue}#####################################${reset}\n\n"
      echo "  ${blue}||||||||||  ${light_cyan}name-is-cipher  ${blue}||||||||||"
            echo "---------------------------------------------"
            echo "  "
            echo "  "
    
}

check_update

if [ ! -f cipherus-libraris.sh ]; then
wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/cipherus-libraries.sh
fi

source cipherus-libraries.sh

banner_cipherus-termux

######### Termux Superuser ##########

install_termux-Superuser

################################



###### Termux Extra keys #######


#################################

echo " "
echo " ||||||||||||||||||||||||||||||||||||||||||||"
echo " "
echo " "


###### Adding aliases #######

echo " [*] Adding aliase to Termux !!!"
echo " "
echo "ls -AlF" >> ~/.termux/bin/lsa
progress
echo " "
echo " > Successfully added aliases to Termux !!!"
echo " "
#################################

echo " "
echo " ||||||||||||||||||||||||||||||||||||||||||||"
echo " "


############# hid-gadget-test ############

echo " [*] Installing hid gadget test !!!"
echo " "
wget https://github.com/name-is-cipher/name-is-cipher/raw/main/hid-gadget-test
mv  hid-gadget-test ~/.termux/bin/
chmod +x ~/.termux/bin/*
echo " "
echo " > Successfully installed hid-gadget-test !!!"
echo " "
#################################

echo " "
echo " ||||||||||||||||||||||||||||||||||||||||||||"
echo " "

###### END of installation #######

echo " "
echo " [*] ALL DONE..."
echo " [*] Termux is configured as per cipher's configruation..."
echo " "
echo " > Termux needs to be restarted to work properly,"
echo "     Please restart !"
echo " "
#################################

