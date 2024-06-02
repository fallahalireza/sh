#!/bin/bash

log_name='download-oneinstack'
log_file='/var/log/royasite.log'

log_success() {
    sudo sed -i "/^$log_name/d" "$log_file"
    echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" | sudo tee -a "$log_file"
}

log_error() {
    local message="$1"
    echo "$log_name error ($message) $(date "+%Y-%m-%d %H:%M:%S")" | sudo tee -a "$log_file"
}

if wget http://mirrors.linuxeye.com/oneinstack-full.tar.gz; then
    if tar xzf oneinstack-full.tar.gz; then
        if sudo rm oneinstack-full.tar.gz; then
            log_success
        else
            log_error "sudo rm oneinstack-full.tar.gz"
        fi
    else
        log_error "tar xzf oneinstack-full.tar.gz"
    fi
else
    log_error "wget http://mirrors.linuxeye.com/oneinstack-full.tar.gz"
fi
