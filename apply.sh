#!/usr/bin/env bash

#
# Apply bundled environment configurations for Ubuntu 2[2|4].04
#
SCRIPT_PATH="${BASH_SOURCE[0]}" # bash
cd "$SCRIPT_DIR"

echo "Copying Apt sources and updating system packages"
if [ ! -f apt/sources.list.d/.gitkeep ]
then
  for filename in apt/sources.list.d/*
  do
    sudo cp -f "$filename" /etc/apt/sources.list.d 
  done
fi
sudo apt-get update

echo "Installing basic utilities"
sudo apt-get install git vim wget curl telnet

echo "Setting up root environment"
sudo cp -f user/root/.bashrc /root
sudo cp -f user/shared/.bash_aliases /root
sudo cp -f user/shared/.profile /root
sudo cp -f user/shared/.vimrc /root
sudo cp -f user/shared/.gitconfig /root

echo "Setting up user environment"
cp -f user/.bashrc ~
cp -f user/shared/.bash_aliases ~
cp -f user/shared/.profile ~
cp -f user/shared/.vimrc ~
cp -f user/shared/.gitconfig ~
