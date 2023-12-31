#!/bin/bash

echo ""
echo "-------------"
echo " updating... "
echo "-------------"

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
asdf update
asdf plugin update --all
npm update --global
sudo snap refresh

echo ""
echo "--------------------------"
echo " press enter to reboot... "
echo "--------------------------"
read REPLY

sudo reboot
