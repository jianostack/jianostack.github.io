# Raspberry Pi

## Setup
adduser 
Add new user to sudo

## Commands
lock screen
dm-tools lock

mount APFS
https://thinkzinc.com/blog/index.php/2021/01/28/mount-an-apple-apfs-drive-in-ubuntu/

sudo shutdown -h now

## Pihole
https://docs.pi-hole.net/main/post-install/

https://discourse.pi-hole.net/t/how-do-i-configure-my-devices-to-use-pi-hole-as-their-dns-server/245

OpenVPN + Pihole

## External HDD

https://superuser.com/questions/662614/raspberry-pi-how-to-format-hdd

https://thepihut.com/blogs/raspberry-pi-tutorials/how-to-mount-an-external-hard-drive-on-the-raspberry-pi-raspian

Ext4 - native Linux filesystem
`sudo apt install ntfs-3g`

current storage devices
`sudo blkid`

Check the Partitions
`sudo fdisk -l`

Mounting it
`sudo mount /dev/sda1 /mnt`

Automounting
`sudo vim /etc/fstab`
We need to add the following line
`/dev/sda1 /mnt ntfs defaults 0 0`

Unmount
`sudo umount /mnt`
