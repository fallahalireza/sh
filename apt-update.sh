#!/bin/bash

log_name='apt-update'
log_file='/var/log/royasite.log'

log_success() {
    sudo sed -i "/^$log_name/d" "$log_file"
    echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" | sudo tee -a "$log_file"
}

log_error() {
    local message="$1"
    echo "$log_name error ($message) $(date "+%Y-%m-%d %H:%M:%S")" | sudo tee -a "$log_file"
}

if sudo apt update -y; then
    log_success
else
    log_error "sudo apt update -y"
fi

