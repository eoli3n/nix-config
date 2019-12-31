{ config, pkgs, ... }:

{
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  imports =
    [
      ./sway.nix
    ];
}
