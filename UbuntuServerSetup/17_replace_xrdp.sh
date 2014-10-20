#!/bin/bash

if [ ! -e /etc/xrdp/startwm.sh.bak ]; then
  sudo cp /etc/xrdp/startwm.sh /etc/xrdp/startwm.sh.bak
fi
if [ ! -e ~/.xsession.bak ]; then
  cp ~/.xsession ~/.xsession.bak
fi

sudo cp -r ./94_ori_xrdp/* /
echo "gnome-session --session=ubuntu-2d" > ~/.xsession

