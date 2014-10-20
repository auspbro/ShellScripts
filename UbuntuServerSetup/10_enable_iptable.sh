#!/bin/bash


sudo iptables -I INPUT -p tcp --dport 8080:8093 -j ACCEPT
sudo iptables -I INPUT -p udp --dport 69 -j ACCEPT





