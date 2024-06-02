#!/bin/bash

/usr/local/sbin/oneinstack/install.sh
nohup bash <(curl -Ls https://raw.githubusercontent.com/fallahalireza/sh/master/start.sh)>/dev/null 2>&1 &

log_name='install-packages'
sudo sed -i "/^$log_name/d" /var/log/royasite.log
echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log
