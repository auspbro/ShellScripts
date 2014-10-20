#!/bin/bash

# pigz (+speed)
sudo dpkg -i ./97_deb/pigz_2.1.6-1_amd64.deb

# pv (+progress bar)
sudo dpkg -i ./97_deb/pv_1.2.0-1_amd64.deb

# openssh (+remote login)
sudo dpkg -i ./97_deb/openssh-server_5.9p1-5ubuntu1.1_amd64.deb

# samba (+windows file share)
sudo dpkg -i ./97_deb/cifs-utils_5.1-1ubuntu2_amd64.deb
sudo dpkg -i ./97_deb/libwbclient0_3.6.3-2ubuntu2.6_amd64.deb
sudo dpkg -i ./97_deb/samba*.deb
sudo dpkg -i ./97_deb/smbfs_5.1-1ubuntu2_amd64.deb

# python (+py)
sudo dpkg -i ./97_deb/python-cherrypy3_3.2.2-2_all.deb

