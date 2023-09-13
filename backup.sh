#!/bin/bash

echo ""
echo "---------------"
echo " backing up... "
echo "---------------"

dconf dump / > dconf-settings.ini
cp $HOME/.gitconfig .