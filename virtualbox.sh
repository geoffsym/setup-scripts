#!/bin/bash

# check if the reboot flag file exists.
# We created this file before rebooting.
if [ ! -f /var/run/resume-script ]; then
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
    sh /media/$USER/VBox_GAs_*/autorun.sh

    # Preparation for reboot
    script="sh $0"

    # add this script to zsh so it gets triggered immediately after reboot
    # change it to .bashrc if using bash shell
    echo "$script" >>~/.zshrc

    # create a flag file to check if we are resuming from reboot.
    sudo touch /var/run/resume-script

    echo ""
    echo "--------------"
    echo " rebooting... "
    echo "--------------"

    reboot

else
    echo "resuming script after reboot.."

    # Remove the line that we added in zshrc
    sed -i '/sh/d' ~/.zshrc

    # remove the temporary file that we created to check for reboot
    sudo rm -f /var/run/resume-script

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

    reboot
fi
