#!/bin/bash

echo "Asia/Tehran" | sudo tee /etc/timezone
sudo timedatectl set-timezone Asia/Tehran
sudo timedatectl set-ntp true

log_name='timezone-set'
sudo sed -i "/^$log_name/d" /var/log/royasite.log
echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log