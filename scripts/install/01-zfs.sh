#!/usr/bin/env bash

set -e

# Set DISK
select ENTRY in $(ls /dev/disk/by-id/);
do
    DISK="/dev/disk/by-id/$ENTRY"
    echo "Installing ZFS on $ENTRY."
    break
done

read -p "Do you want to swipe all datas on $ENTRY ?" -n 1 -r
echo # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Clear disk
    sgdisk -Z $DISK
fi

# Boot part
sgdisk -a1 -n2:34:2047 -t2:EF02 $DISK
# EFI part
sgdisk -n3:1M:+512M -t3:EF00 $DISK
# ZFS part
sgdisk -n1:0:0 -t1:BF01 $DISK

# Inform kernel
partprobe $DISK

# Create ZFS pool
zpool create -O mountpoint=none -R /mnt rpool $DISK-part1

# ZFS filesystems
zfs create -o mountpoint=none rpool/root
zfs create -o mountpoint=legacy rpool/root/nixos
zfs create -o mountpoint=legacy rpool/home

# Finish
echo -e "All OK \e[32mGreen"
