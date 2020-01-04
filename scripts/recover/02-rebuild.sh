#!/usr/bin/env bash

set -e

print () {
    echo -e "\n\033[1m> $1\033[0m\n"
}

# Update git nix-config
print "Update nix-config"
cd /mnt/etc/nixos
git pull

# Rebuild nix-config
print "Rebuild nix-config"
nixos-enter /mnt
nixos-rebuild boot

# Finish
echo -e "\e[32mAll OK"
