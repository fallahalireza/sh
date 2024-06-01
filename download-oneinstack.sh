#!/bin/bash

sudo wget -P /usr/local/sbin http://mirrors.linuxeye.com/oneinstack-full.tar.gz
sudo tar -xzf /usr/local/sbin/oneinstack-full.tar.gz -C /usr/local/sbin
sudo rm /usr/local/sbin/oneinstack-full.tar.gz


log_name='download-oneinstack'
sudo sed -i "/^$log_name/d" /var/log/royasite.log
echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log
