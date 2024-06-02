#!/bin/bash

log_name='dns-set'
log_file='/var/log/royasite.log'

log_success() {
    sudo sed -i "/^$log_name/d" "$log_file"
    echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" | sudo tee -a "$log_file"
}

log_error() {
    local message="$1"
    echo "$log_name error ($message) $(date "+%Y-%m-%d %H:%M:%S")" | sudo tee -a "$log_file"
}

configure_dns() {
    sudo sed -i '/^#DNS=/d' /etc/systemd/resolved.conf
    sudo sed -i '/^DNS=/d' /etc/systemd/resolved.conf
    sudo sed -i '$ a DNS=1.1.1.1 1.0.0.1' /etc/systemd/resolved.conf
    sudo systemctl restart systemd-resolved
}

status=false
systemctl is-active --quiet systemd-resolved && status=true

if [ "$status" = true ]; then
    if configure_dns; then
        log_success
    else
        log_error "configuring DNS"
    fi
else
    if sudo apt install systemd-resolved -y && sudo systemctl enable --now systemd-resolved && configure_dns; then
        log_success
    else
        log_error "installing or enabling systemd-resolved"
    fi
fi
