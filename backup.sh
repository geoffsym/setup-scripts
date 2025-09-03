#!/bin/bash

echo ""
echo "---------------"
echo " backing up... "
echo "---------------"

dconf dump / >/media/sf_shared/dconf-settings.ini
cp $HOME/.bashrc /media/sf_shared/.bashrc
cp $HOME/.gitconfig /media/sf_shared/.gitconfig
cp -r $HOME/repos /media/sf_shared/repos
