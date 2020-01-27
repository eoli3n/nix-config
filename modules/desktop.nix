{ config, pkgs, ... }:

{
  # Networking connman
  services.connman.enable = true;
  services.connman.networkInterfaceBlacklist = [ "vmnet" "vboxnet" "virbr" "ifb" "docker" "veth" "eth" "wlan" "vnet" ];
  services.connman.extraConfig = "AllowHostnameUpdates=false\nPreferredTechnologies=ethernet,wifi";
  services.connman.wifi.backend = "iwd";

  # Sound configuration
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  # Allow unfree 
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.firefox.enableAdobeFlash = true;

  # Enable flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  imports =
    [
      # Install DE
      ./includes/sway.nix
      # Install packages
      ./includes/desktop-packages.nix
      # Install openvpn configuration
      ./includes/openvpn.nix
      # Install podman configuration
      ./includes/podman.nix
    ];

  # Install adb
  programs.adb.enable = true;
  services.udev.packages = [ pkgs.android-udev-rules ];
}
