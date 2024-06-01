#!/bin/bash

log () {
  local log_name="$1"
  sudo sed -i "/^$log_name/d" /var/log/royasite.log
  echo "$log_name start $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log
}

log "apt-update"
nohup bash <(curl -Ls https://raw.githubusercontent.com/fallahalireza/sh/master/apt-update.sh)>/dev/null 2>&1 &
log "timezone-set"
nohup bash <(curl -Ls https://raw.githubusercontent.com/fallahalireza/sh/master/timezone-set.sh)>/dev/null 2>&1 &
log "dns-set"
nohup bash <(curl -Ls https://raw.githubusercontent.com/fallahalireza/sh/master/dns-set.sh)>/dev/null 2>&1 &
log "install-packages"
nohup bash <(curl -Ls https://raw.githubusercontent.com/fallahalireza/sh/master/install-packages.sh)>/dev/null 2>&1 &
log "download-oneinstack"
nohup bash <(curl -Ls https://raw.githubusercontent.com/fallahalireza/sh/master/download-oneinstack.sh)>/dev/null 2>&1 &
