#!/bin/bash

# اجرای دستورات بر روی فایل
nohup sudo sed -i '/^#DNS=/d' /etc/systemd/resolved.conf >/dev/null 2>&1 &
nohup sudo sed -i '/^DNS=/d' /etc/systemd/resolved.conf >/dev/null 2>&1 &
nohup sudo sed -i '$ a DNS=1.1.1.1 1.0.0.1' /etc/systemd/resolved.conf >/dev/null 2>&1 &
sudo systemctl restart systemd-resolved

# گرفتن تاریخ و ساعت فعلی
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# ثبت پیام موفقیت و تاریخ و ساعت در یک فایل
echo "dns-set success $timestamp" >> /var/log/royasite.log
