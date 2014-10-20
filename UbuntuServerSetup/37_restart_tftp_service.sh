#!/bin/bash

sudo service tftpd-hpa restart
sudo service xinetd restart

netstat -l -u | grep tftp

