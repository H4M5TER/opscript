#!/bin/bash

echo TZ='Asia/Shanghai'; export TZ >> ~/.profile

code=`lsb_release -a | grep -oP 'Codename:\s+\K.+'`
mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $code main restricted universe multiverse >> /etc/apt/sources.list
echo deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $code-updates main restricted universe multiverse >> /etc/apt/sources.list
echo deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $code-backports main restricted universe multiverse >> /etc/apt/sources.list
echo deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $code-security main restricted universe multiverse >> /etc/apt/sources.list
apt update
apt full-upgrade

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs openjdk-8-jre
sudo npm i pm2 -g
sudo pm2 completion install

./launchPM2.sh
