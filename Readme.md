# Auto-mount and unmount usb disks based on disk labels

These scripts are basically ripped from several answers
on StackOverflow. The information was spread over several
answers, and some were a bit outdated, so I tried to 
compile all the information and put it here.

The scripts have been found to be working on Ubuntu 10.10 and 12.04.2 LTS
If they do not work for you, try to see if there are tips
in the original SO discussion (see below).
You can then pass me that info, and maybe I will integrate
it into a specific patch.

All scripts are to be put in /usr/local/sbin
The udev rules are to be put in /etc/udev/rules.d/

For reference, all info was ripped from here:
http://superuser.com/questions/53978/ubuntu-automatically-mount-external-drives-to-media-label-on-boot-without-a-u?lq=1

# Requirements
* NTFS will only be mounted as read-only if you don't have ntfs-3g installed.

# The End
Don't use UDEV to automount.

Mounting NTFS partition through udev gave the following error:   
```
chmod: cannot access ‘YOU_DEVICE_LABEL/’: Transport endpoint is not connected
```
However, if you mount using the same command as in udev rules, it is working fine.


While trying to fix this issue, I stumble upon this comment:

>You are not supposed to use udev rules to do things as complex as automounting devices. In case of ntfs-3g, the mount process has to be running the whole time while the device is mounted. udev however will kill this process after some time and that's why you get this error message.


https://bbs.archlinux.org/viewtopic.php?pid=1247212#p1247212
