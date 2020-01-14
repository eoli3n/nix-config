{ config, pkgs, ... }:

{
  # Enable wifi
  #networking.wireless.enable = true;
  networking.wireless.iwd.enable = true;
}
