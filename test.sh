#after reboot
echo "echo \"Post-reboot content goes here\"
 
#remove this from running at startup
rm ~/.config/autostart/myScript.desktop
rm /home/$SUDO_USER/myScript.sh" >>/home/$SUDO_USER/myScript.sh

#make file executable
chmod +x ~/myScript.sh

#set new script to run after reboot
cd .config/
mkdir -p "autostart/"
cd ..
echo "[Desktop Entry]
Type=Application
Exec=x-terminal-emulator -e sudo /home/$SUDO_USER/myScript.sh
Name=Testing" >>~/.config/autostart/myScript.desktop

#before reboot
echo "Pre-reboot commands go here"
sleep 30

reboot -f
