#!/bin/bash

sudo su

export WINIP=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf)
export HTTP_PROXY=http://$WINIP:7890
export HTTPS_PROXY=$HTTP_PROXY

apt update
apt install -y ca-certificates

mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo -e "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释\ndeb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free\n# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free\ndeb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free\n# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free\n\ndeb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free\n# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free\n\ndeb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free\n# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free" > /etc/apt/sources.list
echo -e "\n\n# other\nexport WINIP=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf)\nexport HTTP_PROXY=http://\$WINIP:7890\nexport HTTPS_PROXY=\$HTTP_PROXY\n# VcXsrv\nexport DISPLAY=\$WINIP:0.0" >> /home/debian/.zshrc
apt update
apt full-upgrade -y
apt install -y wget curl axel unzip p7zip
apt install -y screen net-tools nmap htop tmux zsh
apt install -y awesome xrdp tigervnc* openssh-server
apt install -y dbus-x11 # needed for WSL
apt install kde-full

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
apt install -y build-essential python3 git nodejs openjdk-11-jdk

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
