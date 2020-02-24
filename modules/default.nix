{ config, pkgs, ... }:

{
  # Install fonts
  fonts.fonts = with pkgs; [
    hack-font
    font-awesome
  ];

  # Font and keymap
  console = {
    font = "Hack";
    keyMap = "fr";
  };

  # Locale and timezone
  i18n.defaultLocale = "fr_FR.UTF-8";
  time.timeZone = "Europe/Paris";

  # User account
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "adb-users" "audio" "libvirtd" "docker" ];
  };

  # Auto upgrades
  system.autoUpgrade.enable = true;

  # Remove old generations
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 8d";

  imports = [
    ./includes/cli.nix   
  ];
}
