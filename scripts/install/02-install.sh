#!/usr/bin/env bash

set -e

# Initialize Nixos configuration
#nixos-generate-config --root /mnt
rm -Rf /mnt/etc/nixos 2>/dev/null
git clone https://github.com/eoli3n/nix-config /mnt/etc/nixos

# Select host configuration
echo "Select host to setup :"
WORKDIR="/mnt/etc/nixos/hosts/" ; cd $WORKDIR
select HOST in $(ls);
do
    ln -s $HOST/configuration.nix ../
    ln -s $HOST/hardware-configuration.nix ../
    break
done

nixos-install

# Finish
echo -e "All OK \e[32mGreen"
