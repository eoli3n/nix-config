{ config, pkgs, ... }:

{
  # Sound configuration
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Install adb
  programs.adb.enable = true;

  imports =
    [
      ./includes/sway.nix
    ];

  # Install desktop packages
  environment.systemPackages = with pkgs; [
  # Basic
    firefox-bin
    google-chrome
    libreoffice
  # Music
    spotify
    playerctl
    audacity
  # Video
    mpv
  # Games
    minecraft
    #mindustry #nopackage
  # Network
    transmission
    connman
    connman-gtk
    weechat
    #tiny #nopackage
  # Work
    podman
    vscodium
    x2goclient
    vagrant
    virt-manager
  # Term
    termite
    asciinema
  # GTK
    variety
    lxappearance
    equilux-theme
    paper-icon-theme
  # Phone
    adb-sync
  ];

}
