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
    file
    curl
    wget
    jq
    most
    fzf
    rsync
    git
    neovim
    screen
    htop
    tree
    ansible
    ranger
    pastel
  ];
}
