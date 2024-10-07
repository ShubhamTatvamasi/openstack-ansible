#!/bin/zsh

# Delete route
sudo route -n delete -net 172.29.248.0/22 192.168.1.64

# Add route
sudo route -n add -net 172.29.248.0/22 192.168.1.64

