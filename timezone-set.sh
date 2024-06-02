#!/bin/bash

log_name='timezone-set'
log_file='/var/log/royasite.log'

log_success() {
    sudo sed -i "/^$log_name/d" "$log_file"
    echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" | sudo tee -a "$log_file"
}

log_error() {
    local message="$1"
    echo "$log_name error ($message) $(date "+%Y-%m-%d %H:%M:%S")" | sudo tee -a "$log_file"
}

if echo "Asia/Tehran" | sudo tee /etc/timezone && \
   sudo timedatectl set-timezone Asia/Tehran && \
   sudo timedatectl set-ntp true; then
    log_success
else
    log_error "setting timezone or enabling NTP"
fi
