#!/bin/bash

# install prerequisites
echo ""
echo "-----------------------------"
echo " installing prerequisites... "
echo "-----------------------------"

sudo apt update
sudo apt install build-essentials dkms gcc make perl

# run guest additions script
echo ""
echo "-----------------------------------"
echo " running guest additions script... "
echo "-----------------------------------"

cd /media/$USER/VBox_GAs_*
sh /media/$USER/VBox_GAs_*/autorun.sh

# set up shared directory
# https://www.linuxbabe.com/virtualbox/how-to-enable-file-sharing-between-host-and-virtualbox-guest-os
echo ""
echo "--------------------------------"
echo " setting up shared directory... "
echo "--------------------------------"

sudo gpasswd -a $USER vboxsf
ln -s /media/sf_shared $HOME/shared
