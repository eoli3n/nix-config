### Installation
Boot NixOS iso
Install git and clone project
```
sudo loadkeys fr
sudo -i
nix-channel --update
nix-env -iA nixos.git
git clone https://github.com/eoli3n/nix-config
```
Configure ZFS with builtin encryption and install
```
/root/nix-config/scripts/install/01-configure.sh
/root/nix-config/scripts/install/02-install.sh
```
