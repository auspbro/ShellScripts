#!/bin/bash

if [ ! -e /etc/default/tftpd-hpa.bak ]; then 
  sudo cp /etc/default/tftpd-hpa /etc/default/tftpd-hpa.bak
fi

sudo cp -r ./99_ori_tftp_files/* /





