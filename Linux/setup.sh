#!/bin/bash

sudo su

apt update
apt install -y ca-certificates python3
pip3 install apt-mirror-updater
apt-mirror-updater -b # 找到最佳源
apt-mirror-updater -c # 换上最佳源
apt update
apt install -y git build-essential
apt install -y wget curl axel
apt install -y mc screen htop tmux
apt upgrade
apt autoremove
apt clean
apt autoclean
reboot
