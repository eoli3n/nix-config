{ config, pkgs, ... }:

{
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  imports =
    [
      ./sway.nix
    ];

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Install desktop packages
  environment.systemPackages = with pkgs; [
    firefox-bin
    spotify
    playerctl
    lxappearance
    connman
    connman-gtk
    termite
    #variety #unstable package
    weechat
    equilux-theme
    paper-icon-theme
  ];

}
