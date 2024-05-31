#!/bin/bash

# تنظیم منطقه زمانی به Asia/Tehran
echo "Asia/Tehran" | sudo tee /etc/timezone

# تنظیم منطقه زمانی سیستم
sudo timedatectl set-timezone Asia/Tehran

# به‌روزرسانی ساعت از طریق اینترنت
sudo timedatectl set-ntp true

name='timezone-tehran'
sudo sed -i "/^$name/d" /var/log/royasite.log
echo "$name success $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log