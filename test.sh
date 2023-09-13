# filename: test.sh

# check if the reboot flag file exists.
# We created this file before rebooting.
if [ ! -f ~/.resume-script ]; then
    echo "running script for the first time.."

    # run your scripts here

    # Preparation for reboot
    script="bash $PWD/$0"

    # add this script to zsh so it gets triggered immediately after reboot
    echo "$script" >>~/.bashrc

    # create a flag file to check if we are resuming from reboot.
    sudo touch ~/.resume-script

    echo "rebooting.."
    sudo reboot

else
    echo "resuming script after reboot.."

    # Remove the line that we added in bashrc
    sed -i '/bash/d' ~/.bashrc

    # remove the temporary file that we created to check for reboot
    sudo rm -f ~/.resume-script

    # continue with rest of the script
    touch ~/test.txt
fi
