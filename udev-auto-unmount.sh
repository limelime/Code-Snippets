#!/bin/sh
#
# USAGE: udev-auto-unmount.sh DEVICE
#   DEVICE   is the actual device node at /dev/DEVICE

DEVICE=$1

# check input
if [ -z "$DEVICE" ]; then
	exit 1
fi

#test that the device is already mounted
MOUNTPT=`mount | grep ${DEVICE} | cut -d ' ' -f 3`
if [ -n "$device_is_mounted" ]; then
	echo "$0: Error: the device is not already mounted."
	exit 1
fi

# test mountpoint - it should exist
if [ -e "${MOUNTPT}" ]; then

	# very naive; just run and pray
	umount -l "${MOUNTPT}" && rmdir "${MOUNTPT}" && exit 0

	echo "$0: Error: ${MOUNTPT} failed to unmount."
	exit 1
fi

echo "$0: Error: ${MOUNTPT} does not exist."
exit 1