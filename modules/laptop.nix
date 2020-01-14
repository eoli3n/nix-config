{ config, pkgs, ... }:

{
  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable wifi
  networking.wireless.enable = true;
  networking.wireless.iwd.enable = true;
}
