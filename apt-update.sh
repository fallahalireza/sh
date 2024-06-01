#!/bin/bash

sudo apt update -y

log_name='apt-update'
sudo sed -i "/^$log_name/d" /var/log/royasite.log
echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log
