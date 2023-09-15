# setup-scripts

Some setup scripts for my Ubuntu virtualbox dev environment.

## Install instructions

1. make a new VirtualBox VM
    - skip unattended install
    - set `shared` folder to auto-mount
2. `sudo apt install git -y`
3. `git clone https://github.com/geoffsym/setup-scripts.git`
4. Insert Guest Additions CD image
5. `bash virtualbox.sh` to install guest additions and set permissions for shared storage
6. `bash setup.sh` to install dev tools
7. `bash update.sh` for good measure
