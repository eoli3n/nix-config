#!/usr/bin/env bash

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

# Mount ZFS pool
print "Mount ZFS pool"
zpool import -a
zfs load-key -a

# Mount filesystems
print "Mount parts"
mount -t zfs zroot/root/nixos /mnt
mount -t zfs zroot/home /mnt/home
mount $EFI /mnt/boot

# Finish
echo -e "\e[32mAll OK"
