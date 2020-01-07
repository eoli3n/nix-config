{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  # Basic
    firefox-bin
    google-chrome
    libreoffice
    evince
  # Music
    pavucontrol
    spotify
    playerctl
    audacity
  # Video
    mpv
  # Photos
    gnome-photos
    koloupaint
  # Games
    minecraft
    hedgewars
    #mindustry #nopackage
  # Network
    transmission
    connman-gtk
    weechat
    #tiny #nopackage
  # Work
    podman
    rdesktop
    texlive.combined.scheme-small
    vagrant
    virt-manager
    vscodium
    x2goclient
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
