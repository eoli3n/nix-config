### Installation
Boot NixOS iso
Install git and clone project
```
sudo loadkeys fr
sudo su -
nix-channel --update
nix-env -iA nixos.git
git clone https://github.com/eoli3n/nix-config
```
Install zfs
```
/root/nix-config/scripts/install/01-zfs.sh
```
