#!/bin/bash

echo ""
echo "--------------------------"
echo " updating apt packages... "
echo "--------------------------"

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo ""
echo "------------------------------"
echo " updating asdf and plugins... "
echo "------------------------------"

asdf update
asdf plugin update --all

echo ""
echo "------------------"
echo " updating java... "
echo "------------------"

asdf install java latest:adoptopenjdk-20
asdf global java latest:adoptopenjdk-20

echo ""
echo "--------------------"
echo " updating python... "
echo "--------------------"

asdf install python latest
asdf global python latest

echo ""
echo "--------------------"
echo " updating node... "
echo "--------------------"

asdf install nodejs latest
asdf global nodejs latest
asdf reshim nodejs

echo ""
echo "--------------------"
echo " updating SQLite... "
echo "--------------------"

asdf install sqlite latest
asdf global sqlite latest

echo ""
echo "----------------------"
echo " updating postgres... "
echo "----------------------"

asdf install postgres latest
asdf global postgres latest

echo ""
echo "------------------------------"
echo " installing tools and misc... "
echo "------------------------------"

asdf install poetry latest
asdf global poetry latest
asdf direnv setup --shell bash --version latest
npm update --global
sudo snap refresh

echo ""
echo "--------------------------"
echo " press enter to reboot... "
echo "--------------------------"
read REPLY

sudo reboot
