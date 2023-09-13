# setup-scripts

Some setup scripts for my virtualbox dev environment.

## Install instructions

1. `sh backup.sh` in old system.
2. make a new VirtualBox VM
    - skip unattended install
    - set shared folder to auto-mount
    - turn on bi-derectional clipboard
3. `sudo apt install git`
4. clone this repo
5. Insert Guest Additions CD image
6. `sh virtualbox.sh`
7. `sh setup.sh`, which automatically runs `update.sh` at the end
8. `sh version.sh`
