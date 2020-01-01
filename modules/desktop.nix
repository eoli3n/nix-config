{ config, pkgs, ... }:

{
  # Networking connman
  networking.connman.enable = true;
  networking.connman.networkInterfaceBlacklist = [ "vmnet" "vboxnet" "virbr" "ifb" "docker" "veth" "eth" "wlan" "vnet" ];

  # Sound configuration
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Allow unfree 
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  imports =
    [
      # Install DE
      ./includes/sway.nix
      # Install packages
      ./includes/desktop-packages.nix
    ];

  # Install adb
  programs.adb.enable = true;
  services.udev.packages = [ pkgs.android-udev-rules ];
}
