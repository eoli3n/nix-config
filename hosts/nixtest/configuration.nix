{ config, pkgs, ... }:

{
  # Do not change
  system.stateVersion = "19.09";

  imports =
    [
      ./hardware-configuration.nix
      ../../modules/default.nix
      ../../modules/desktop.nix
      #../../modules/laptop.nix
    ];

  # SSD
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  # Intel microcode
  hardware.cpu.intel.updateMicrocode = true;

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixtest";
  networking.useDHCP = false;

  # ZFS
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "2108ddb7";
  services.zfs.autoScrub.enable = true;
  boot.zfs.requestEncryptionCredentials = true;

  # Enable qemu copy/paste
  services.spice-vdagentd.enable = true;

  # https://github.com/NixOS/nix/issues/421
  boot.kernel.sysctl."vm.overcommit_memory" = "1";

  # Enable sshd
  services.sshd.enable = true;
  services.openssh.permitRootLogin = "yes";
  users.users.root.openssh.authorizedKeys.keyFiles = [ ../../keys/id_rsa.pub ] ;
}

