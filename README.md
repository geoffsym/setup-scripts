# setup-scripts

Some setup scripts for my Ubuntu virtualbox dev environment.

## Install instructions

1. Make a new VirtualBox VM
   - skip unattended install
   - 16384 MB of RAM, 4 CPUs
   - set `shared` folder to auto-mount
   - minimal installation
2. `sudo apt install git -y`
3. `git clone https://github.com/geoffsym/setup-scripts.git`
4. Insert Guest Additions CD image
5. `bash virtualbox.sh` to install guest additions and set permissions for shared storage
6. `bash setup.sh` to install dev tools and restore backups
7. `bash update.sh` for good measure
8. Other setup steps
   - Devices > Shared Clipboard > Bidirectional
   - log in to Firefox
   - log in to Visual Studio Code
