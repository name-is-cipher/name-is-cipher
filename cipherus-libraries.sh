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
    printf "    ${blue}#####################################${reset}\n\n"
    printf "    ${blue}|||||||||| name-is-cipher  ||||||||||\n"
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

function check_tbin() {

    if [ ! -d ~/.termux/bin ] then
        
        mkdir ~/.termux/bin
        echo " " >> ~/.bashrc
        echo "# This PATH is for Termux superuser bin folder" >> ~/.bashrc
        echo " " >> ~/.bashrc
        echo "export PATH=\$PATH:/data/data/com.termux/files/home/.termux/bin" >> ~/.bashrc

    fi

}

function ibar {

    FILE=$1
    BAR='########################################'
    FILL='----------------------------------------'
    Lines=$2  # To No. lines in file that need to be present.
    barLen=40 # Bar Lenght of progressbar.
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
    if [ $percent != 100 ] 
    then
    echo " "
    echo " [!] File is corrupt, Please try to reinstall !!!"
    echo " "
    echo " If you keep seeing this error, contact the Author:-"
    echo " "
    echo " github: name-is-cipher"
    echo " Twitter: name_is_cipher"
    echo " Mail: aravindswami135@gmail.com"
    fi
    echo " "
    echo " "

}
