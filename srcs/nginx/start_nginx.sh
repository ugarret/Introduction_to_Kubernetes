#!/bin/sh
ssh-keygen -A
adduser -D ugarret
echo "ugarret:ugarret" | chpasswd
/usr/bin/supervisord -c /etc/supervisord.conf