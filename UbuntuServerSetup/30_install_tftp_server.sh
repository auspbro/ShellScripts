#!/bin/bash

mkdir ~/tftpboot
sudo chmod -R 777 ~/tftpboot

# tftpd-hpa
sudo dpkg -i ./97_deb/tftpd-hpa_5.2-1ubuntu1_amd64.deb

# tftp
sudo dpkg -i ./97_deb/tftp_0.17-18ubuntu2_amd64.deb

# xinetd
sudo dpkg -i ./97_deb/xinetd_2.3.14-7ubuntu4_amd64.deb
