#!/bin/bash

script="bash $PWD/$0"

# check if the reboot flag file exists.
# We created this file before rebooting.
if [ ! -f $HOME/.resume-script ]; then

    # install prerequisites
    echo ""
    echo "-----------------------------"
    echo " installing prerequisites... "
    echo "-----------------------------"

    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y build-essential dkms gcc make perl

    # run guest additions script
    echo ""
    echo "-----------------------------------"
    echo " running guest additions script... "
    echo "-----------------------------------"

    cd /media/$USER/VBox_GAs_*
    bash /media/$USER/VBox_GAs_*/autorun.sh

    echo ""
    echo "--------------------------"
    echo " press enter to reboot... "
    echo "--------------------------"
    read REPLY

    # add this script to bashrc so it gets triggered immediately after reboot
    echo "$script" >>$HOME/.bashrc

    # create a flag file to check if we are resuming from reboot.
    touch $HOME/.resume-script

    sudo reboot

else

    echo "resuming script after reboot..."

    # Remove the line that we added in bashrc
    head -n -1 $HOME/.bashrc >$HOME/.bashrc.tmp
    cp $HOME/.bashrc.tmp $HOME/.bashrc
    rm -f $HOME/.bashrc.tmp

    # remove the temporary file that we created to check for reboot
    rm -f $HOME/.resume-script

    # set up shared directory
    # https://www.linuxbabe.com/virtualbox/how-to-enable-file-sharing-between-host-and-virtualbox-guest-os
    echo ""
    echo "--------------------------------"
    echo " setting up shared directory... "
    echo "--------------------------------"

    sudo gpasswd -a $USER vboxsf
fi
