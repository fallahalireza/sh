#!/bin/bash

log_start () {
    local log_name="$1"
    sudo sed -i "/^$log_name start/d" /var/log/royasite.log
    echo "$log_name start $(date "+%Y-%m-%d %H:%M:%S")" | sudo tee -a /var/log/royasite.log
}

execute_script () {
    local script_name="$1"
    log_start "$script_name"
    bash <(curl -Ls "https://raw.githubusercontent.com/fallahalireza/sh/master/$script_name.sh")
}

execute_script "apt-update"
execute_script "timezone-set"
execute_script "dns-set"
execute_script "install-packages"
execute_script "download-oneinstack"