#!/bin/bash

if [ ! -e /etc/default/isc-dhcp-server.bak ]; then 
  sudo cp /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.bak
fi
if [ ! -e /etc/dhcp/dhcpd.conf.bak ]; then 
  sudo cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bak
fi

sudo cp -r ./98_ori_dhcp_files/* /
