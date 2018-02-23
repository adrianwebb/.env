#/bin/bash

#
# Apply bundled environment configurations for Ubuntu 16.04
#
SCRIPT_DIR="$(cd "$(dirname "$([ `readlink "$0"` ] && echo "`readlink "$0"`" || echo "$0")")"; pwd -P)"
cd "$SCRIPT_DIR"

echo "Copying Apt sources and updating system packages"
sudo cp -f apt/sources.list /etc/apt

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
