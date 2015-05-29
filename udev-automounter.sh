#!/bin/sh
#
# USAGE: usb-automounter.sh DEVICE 
#   DEVICE   is the actual device node at /dev/DEVICE

/usr/local/sbin/udev-auto-mount.sh ${1} 2>&1 | tee -a /var/log/udev-automounter.log &
