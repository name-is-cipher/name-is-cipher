#! /data/data/com.termux/files/usr/bin/bash

echo 
echo -ne " [!] Cleaning all cipherus Termux configs ./r"
sleep 0.5
echo -ne " [!] Cleaning all cipherus Termux configs ../r"
sleep 0.5
echo -ne " [!] Cleaning all cipherus Termux configs .../r"
echo 

if [ -d ~/.termux/bin ]; then
    rm -rf ~/.termux/bin
fi

if [ -f ~/.bashrc ]; then
    rm ~/.bashrc
fi

if [ -f /data/data/com.termux/files/usr/bin/hid-gadget-test ]; then
    rm /data/data/com.termux/files/usr/bin/hid-gadget-test
fi

wget -q https://github.com/name-is-cipher/name-is-cipher/raw/main/assets/termux.properties.txt
cat termux.properties.txt > ~/.termux/termux.properties
rm termux.properties.txt


if [ -f ~/.wget-hsts ]; then
    rm ~/.wget-hsts
fi

echo " [!] Clean successfull !!!"
