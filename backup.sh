#!/bin/bash

echo ""
echo "---------------"
echo " backing up... "
echo "---------------"

dconf dump / >/media/sf_shared/dconf-settings.ini
cp $HOME/.gitconfig /media/sf_shared/.gitconfig
