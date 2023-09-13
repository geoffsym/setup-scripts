# filename: test.sh

# check if the reboot flag file exists.
# We created this file before rebooting.
if [ ! -f /var/run/resume-after-reboot ]; then
    echo "running script for the first time.."

    # run your scripts here

    # Preparation for reboot
    script="bash $filepath"

    # add this script to zsh so it gets triggered immediately after reboot
    # change it to .bashrc if using bash shell
    echo "$script" >>~/.zshrc

    # create a flag file to check if we are resuming from reboot.
    sudo touch /var/run/resume-after-reboot

    echo "rebooting.."
    sudo reboot

else
    echo "resuming script after reboot.."

    # Remove the line that we added in zshrc
    sed -i '/bash/d' ~/.zshrc

    # remove the temporary file that we created to check for reboot
    sudo rm -f /var/run/resume-after-reboot

    # continue with rest of the script
    touch ~/test.txt
fi