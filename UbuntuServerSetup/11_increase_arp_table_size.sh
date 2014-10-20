#!/bin/bash

sudo cp /etc/sysctl.conf /etc/sysctl.conf.ori

if ! grep -i 'gc_thresh1' /etc/sysctl.conf > /dev/null
then
  sudo sh -c "echo 'net.ipv4.neigh.default.gc_thresh1=512' >> /etc/sysctl.conf"
fi

if ! grep -i 'gc_thresh2' /etc/sysctl.conf > /dev/null
then
  sudo sh -c "echo 'net.ipv4.neigh.default.gc_thresh2=2048' >> /etc/sysctl.conf"
fi

if ! grep -i 'gc_thresh3' /etc/sysctl.conf > /dev/null
then
  sudo sh -c "echo 'net.ipv4.neigh.default.gc_thresh3=4096' >> /etc/sysctl.conf"
fi
