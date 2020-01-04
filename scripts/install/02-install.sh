#!/usr/bin/env bash

set -e

print () {
    echo -e "\n\033[1m> $1\033[0m\n"
}

# Initialize Nixos configuration
#nixos-generate-config --root /mnt
rm -Rf /mnt/etc/nixos 2>/dev/null
git clone https://github.com/eoli3n/nix-config /mnt/etc/nixos

# Generate configuration-hardware.nix
print "Generate hardware configuration"
nixos-generate-config --dir /tmp


# Select host configuration
print "Select host to setup :"
WORKDIR="/mnt/etc/nixos/hosts/" ; cd $WORKDIR
select HOST in $(ls);
do
    ln -s hosts/$HOST/configuration.nix ../

    # Up hardware configuration on github
    print "Up generated hardware-configuration.nix on github"
    cp /tmp/hardware-configuration.nix /mnt/etc/nixos/hosts/$HOST/
    git add hosts/$HOST
    git commit -am "Updated $HOST hardware-configuration.nix"
    git push
    break
done

# Set unstable channel
nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nix-channel --update

# Install
nixos-install

# Finish
echo -e "\e[32mAll OK"
