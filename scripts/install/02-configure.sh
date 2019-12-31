#!/usr/bin/env bash

set -e

# Mount filesystems
mount -t zfs rpool/root/nixos /mnt
mkdir /mnt/home
mount -t zfs rpool/home /mnt/home

# Format EFI part
mkfs.vfat $DISK-part3
mkdir /mnt/boot
mount $DISK-part3 /mnt/boot

# Generate nixos configuration
nixos-generate-config --root /mnt

# Finish
echo -e "All OK \e[32mGreen"
