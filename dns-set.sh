#!/bin/bash

nohup sudo sed -i '/^#DNS=/d' /etc/systemd/resolved.conf >/dev/null 2>&1 &
nohup sudo sed -i '/^DNS=/d' /etc/systemd/resolved.conf >/dev/null 2>&1 &
nohup sudo sed -i '$ a DNS=1.1.1.1 1.0.0.1' /etc/systemd/resolved.conf >/dev/null 2>&1 &
sudo systemctl restart systemd-resolved

name='dns-set'
sudo sed -i "/^$name/d" /var/log/royasite.log
echo "$name success $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log
