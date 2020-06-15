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

  # Intel microcode
  hardware.cpu.intel.updateMicrocode = true;

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "work";
  networking.useDHCP = false;

  # ZFS
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "2020abab";
  services.zfs.autoScrub.enable = true;
  boot.zfs.requestEncryptionCredentials = true;

  # Printers
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];
  environment.systemPackages = with pkgs; [ cups-toshiba-estudio ];
}

