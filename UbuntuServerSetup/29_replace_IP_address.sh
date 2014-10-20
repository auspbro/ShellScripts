#!/bin/bash

if [ ! -e /etc/network/interfaces.bak ]; then
  sudo cp /etc/network/interfaces /etc/network/interfaces.bak
fi

sudo ifconfig eth0 18.18.0.68
sudo ifconfig eth1 10.10.0.68
sudo ifconfig eth3 172.26.6.151
sudo ifconfig eth4 11.0.0.68
sudo ifconfig eth5 11.0.0.68

sudo cp -r ./96_ori_ip_files/* /
