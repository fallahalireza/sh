#!/bin/bash

sudo apt install wget screen tar -y

log_name='install-packages'
sudo sed -i "/^$log_name/d" /var/log/royasite.log
echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log
