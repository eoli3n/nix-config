{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  # Basic
    firefox-bin
    google-chrome
    libreoffice
    evince
    nautilus
  # Music
    pavucontrol
    spotify
    playerctl
    audacity
  # Video
    mpv
  # Photos
    gnome-photos
  # Games
    minecraft
    #mindustry #nopackage
  # Network
    transmission
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
  # Tool
    borgbackup
  # GTK
    variety
    lxappearance
    equilux-theme
    paper-icon-theme
  # Phone
    adb-sync
  ];
}
