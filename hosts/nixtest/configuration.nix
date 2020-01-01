{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/default.nix
      ../../modules/desktop.nix
      #../../modules/laptop.nix
      #../../modules/server.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixtest";
  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;
  networking.hostId = "2108ddb7";
  boot.supportedFilesystems = [ "zfs" ];

  system.stateVersion = "19.09";

  # Enable qemu copy/paste
  services.spice-vdagentd.enable = true;

  # https://github.com/NixOS/nix/issues/421
  boot.kernel.sysctl."vm.overcommit_memory" = "1";
}

