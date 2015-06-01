#!/bin/sh
#
# USAGE: udev-auto-unmount.sh DEVICE
#   DEVICE   is the actual device node at /dev/DEVICE

DEVICE=$1

# DEVICE value can't be empty.
if [ -z "$DEVICE" ]; then
  echo "$0: Error: Unmount failed. Device argument is empty."
  exit 1
fi

# Get the mount path and unmount it.
MOUNTPT=$(mount | grep ${DEVICE} | sed 's/^.* on \//\//' | cut -d' ' -f1)
if [ -e "${MOUNTPT}" ]; then

	# very naive; just run and pray
	umount -l "${MOUNTPT}" && rmdir "${MOUNTPT}" && exit 0

	echo "$0: Error: ${MOUNTPT} failed to unmount."
	exit 1
fi

exit 0
