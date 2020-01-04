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
    wipefs -af $DISK
    sgdisk -Zo $DISK
fi

# EFI part
print "Creating EFI part"
sgdisk -n1:1M:+512M -t1:EF00 $DISK
EFI=$DISK-part1

# ZFS part
print "Creating ZFS part"
sgdisk -n2:0:0 -t2:bf01 $DISK
ZFS=$DISK-part2

# Inform kernel
partprobe $DISK

# Format boot part
sleep 1
print "Format EFI part"
mkfs.vfat $EFI

# Create ZFS pool
print "Create ZFS pool"
zpool create -f -o ashift=12 -R /mnt -O mountpoint=none -O encryption=aes-256-gcm -O keyformat=passphrase zroot $ZFS

# ZFS filesystems
print "Create ZFS volumes"
zfs create -o mountpoint=none zroot/root
zfs create -o mountpoint=legacy zroot/root/nixos
zfs create -o mountpoint=legacy zroot/home

# Mount filesystems
print "Mount parts"
mount -t zfs zroot/root/nixos /mnt
mkdir /mnt/home
mount -t zfs zroot/home /mnt/home
mkdir /mnt/boot
mount $EFI /mnt/boot

# Finish
print "Don't forget to define boot.initrd.luks.devices.device in configuration.nix"
echo -e "\e[32mAll OK"
