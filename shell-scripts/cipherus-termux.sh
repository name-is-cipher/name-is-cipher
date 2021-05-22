
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'

function print_banner() {
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

read


print_banner

######### Termux Superuser ##########



echo " "
################################

echo " "
echo " ||||||||||||||||||||||||||||||||||||||||||"
echo " "
echo " "

###### Termux Extra keys #######

echo " [*] Adding Extra Keys to Termux !!!"
echo " "
echo " " >> .termux/termux.properties
echo "extra-keys = [ \\" >> .termux/termux.properties
echo " ['CTRL','$','|','HOME','UP','END','-','='], \\" >> .termux/termux.properties
echo " ['TAB','ESC','ALT','LEFT','DOWN','RIGHT','/','DEL'] \\" >> .termux/termux.properties
echo "]" >> .termux/termux.properties
echo " " >> .termux/termux.properties
progress
echo " "
echo " > Successfully added extra Keys to Termux !!!"
echo " "
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

