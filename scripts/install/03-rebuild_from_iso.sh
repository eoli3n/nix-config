#!/usr/bin/env bash

set -e

print () {
    echo -e "\n\033[1m> $1\033[0m\n"
}

# Set DISK
select ENTRY in $(ls /dev/disk/by-id/);
do
    DISK="/dev/disk/by-id/$ENTRY"
    echo "Mounting ZFS from $ENTRY."
    break
done

# Partitions
EFI=$DISK-part1

# Create ZFS pool
print "Mount ZFS pool"
zpool import -a
zfs load-key -a

# Mount filesystems
print "Mount root part"
mount -t zfs zroot/root/nixos /mnt
print "Mount parts"
mount -t zfs zroot/home /mnt/home
mount $EFI /mnt/boot

# Update git nix-config
print "Update nix-config"
cd /mnt/etc/nixos
git pull

# Rebuild nix-config
print "Rebuild nix-config"
nixos-rebuild switch

# Finish
echo -e "\e[32mAll OK"
