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
  # Image
    gnome-photos
    imagemagick
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
  # Dev
    pastel
    vscodium
  # Work
    podman
    rdesktop
    texlive.combined.scheme-small
    vagrant
    virt-manager
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
