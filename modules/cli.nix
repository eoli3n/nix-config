{ config, pkgs, ... }:

{
  # Enable fish.
  programs.fish.enable = true;

  # Root shell
  users.extraUsers.root.shell = pkgs.fish;
  users.extraUsers.user.shell = pkgs.fish;

  # Install cli packages
  environment.systemPackages = with pkgs; [
    bc
    curl
    file
    fzf
    wget
    jq
    most
    rsync
  ];
}
