{ config, pkgs, ... }:

{
  # Enable wifi
  services.connman.wifi.backend = "iwd";
}
