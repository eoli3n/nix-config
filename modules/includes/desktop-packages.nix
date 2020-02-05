{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  # Basic
    firefox-bin
    google-chrome
    libreoffice
    evince
    xfce.thunar
  # Music
    pavucontrol
    spotify
    playerctl
    audacity
  # Video
    mpv
  # Image
    feh
    gnome-photos
    imagemagick
    kolourpaint
  # Games
    minecraft
    hedgewars
    mindustry
  # Network
    transmission
    webtorrent_desktop
    connman-gtk
    weechat
    #tiny
  # Dev
    pastel
    vscodium
  # Work
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
    appimage-run
  # GTK
    variety
    lxappearance
    equilux-theme
    paper-icon-theme
  # Phone
    adb-sync
  ];
}
