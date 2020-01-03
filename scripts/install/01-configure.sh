#!/usr/bin/env bash

set -e

print () {
    echo -e "\n\033[1m> $1\033[0m\n"
}

# Set DISK
select ENTRY in $(ls /dev/disk/by-id/);
do
    DISK="/dev/disk/by-id/$ENTRY"
    echo "Installing ZFS on $ENTRY."
    break
done

read -p "> Do you want to swipe all datas on $ENTRY ?" -n 1 -r
echo # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Clear disk
    sgdisk -Z $DISK
fi

# EFI part
print "Creating EFI part"
sgdisk -n1:1M:+512M -t1:EF00 $DISK

# LUKS part
print "Creating LUKS part"
sgdisk -n2:0:0 -t2:8309 $DISK

# Inform kernel
partprobe $DISK

# Format boot part
sleep 1
print "Format EFI part"
mkfs.vfat $DISK-part1

# Luks root
print "Create LUKS"
cryptsetup luksFormat $DISK-part2
print "Open LUKS"
cryptsetup luksOpen $DISK-part2 luksroot
LUKS="/dev/mapper/luksroot"

# Create ZFS pool
print "Create ZFS pool"
zpool create -O mountpoint=none -R /mnt rpool $LUKS

# ZFS filesystems
print "Create ZFS volumes"
zfs create -o mountpoint=none rpool/root
zfs create -o mountpoint=legacy rpool/root/nixos
zfs create -o mountpoint=legacy rpool/home

# Mount filesystems
print "Mount parts"
mount -t zfs rpool/root/nixos /mnt
mkdir /mnt/home
mount -t zfs rpool/home /mnt/home
mkdir /mnt/boot
mount $DISK-part1 /mnt/boot

# Finish
echo "Don't forget to define boot.initrd.luks.devices.device in configuration.nix"
echo -e "\e[32mAll OK"
