# setup-scripts

Some setup scripts for my virtualbox dev environment.

## Install instructions

1. make a new VirtualBox VM
    - skip unattended install
    - set shared folder to auto-mount
2. `sudo apt install git`
3. clone this repo
4. Insert Guest Additions CD image
5. `bash virtualbox.sh` to install guest additions and set permissions for shared storage
6. `bash setup.sh` to install dev tools
7. `bash update.sh` for good measure
