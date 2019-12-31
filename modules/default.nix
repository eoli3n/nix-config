{ config, pkgs, ... }:

{
  i18n = {
    consoleFont = "Hack";
    consoleKeyMap = "fr";
    defaultLocale = "fr_FR.UTF-8";
  };

  time.timeZone = "Europe/Paris";

  # User account
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  imports = [
    ./cli.nix   
  ];
}