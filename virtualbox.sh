#!/bin/bash

# copy settings
echo ""
echo "---------------------"
echo " copying settings... "
echo "---------------------"

dconf load / < dconf-settings.ini
cp .gitconfig $HOME

# set up shared directory
# https://www.linuxbabe.com/virtualbox/how-to-enable-file-sharing-between-host-and-virtualbox-guest-os
echo ""
echo "--------------------------------"
echo " setting up shared directory... "
echo "--------------------------------"

sudo gpasswd -a $USER vboxsf
ln -s /media/sf_shared $HOME/shared

# run guest additions script
echo ""
echo "-----------------------------------"
echo " running guest additions script... "
echo "-----------------------------------"

sh /media/$USER/VBox_GAs_*/autorun.sh

echo ""
echo "--------------"
echo " rebooting... "
echo "--------------"

reboot