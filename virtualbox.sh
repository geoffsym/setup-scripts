#!/bin/bash

# check if the reboot flag file exists.
# We created this file before rebooting.
if [ ! -f ~/.resume-script ]; then
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
    . /media/$USER/VBox_GAs_*/autorun.sh

    # add this script to bashrc so it gets triggered immediately after reboot
    echo "bash $PWD/$0" >>~/.bashrc

    # create a flag file to check if we are resuming from reboot.
    sudo touch ~/.resume-script

    echo ""
    echo "--------------"
    echo " rebooting... "
    echo "--------------"

    sleep 5
    reboot

else
    echo "resuming script after reboot.."

    # Remove the line that we added in zshrc
    sed -i '/bash/d' ~/.bashrc

    # remove the temporary file that we created to check for reboot
    sudo rm -f ~/.resume-script

    # continue with rest of the script

    # set up shared directory
    # https://www.linuxbabe.com/virtualbox/how-to-enable-file-sharing-between-host-and-virtualbox-guest-os
    echo ""
    echo "--------------------------------"
    echo " setting up shared directory... "
    echo "--------------------------------"

    echo "sudo gpasswd -a $USER vboxsf" | sh
    ln -s /media/sf_shared $HOME/shared

    echo ""
    echo "--------------------"
    echo " rebooting again... "
    echo "--------------------"

    sleep 5
    reboot
fi
