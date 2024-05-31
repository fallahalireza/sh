#!/bin/bash

# تنظیم منطقه زمانی به Asia/Tehran
echo "Asia/Tehran" | sudo tee /etc/timezone

# تنظیم منطقه زمانی سیستم
sudo timedatectl set-timezone Asia/Tehran

# به‌روزرسانی ساعت از طریق اینترنت
sudo timedatectl set-ntp true

echo "dns-set success $(date "+%Y-%m-%d %H:%M:%S")" >> /var/log/royasite.log