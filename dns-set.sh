#!/bin/bash

status=false
systemctl is-active --quiet systemd-resolved && status=true
if [ "$status" = true ]; then
  sudo sed -i '/^#DNS=/d' /etc/systemd/resolved.conf
  sudo sed -i '/^DNS=/d' /etc/systemd/resolved.conf
  sudo sed -i '$ a DNS=1.1.1.1 1.0.0.1' /etc/systemd/resolved.conf
  sudo systemctl restart systemd-resolved
else
  sudo apt install systemd-resolved -y
  sudo systemctl enable --now systemd-resolved
  sudo sed -i '/^#DNS=/d' /etc/systemd/resolved.conf
  sudo sed -i '/^DNS=/d' /etc/systemd/resolved.conf
  sudo sed -i '$ a DNS=1.1.1.1 1.0.0.1' /etc/systemd/resolved.conf
  sudo systemctl restart systemd-resolved
fi

log_name='dns-set'
sudo sed -i "/^$log_name/d" /var/log/royasite.log
echo "$log_name success $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log

