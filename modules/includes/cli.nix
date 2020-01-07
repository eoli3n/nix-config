{ config, pkgs, ... }:

{
  # Enable fish.
  programs.fish.enable = true;

  # Enable libvirt
  virtualisation.libvirtd.enable = true;

  # Enable docker
  virtualisation.docker.enable = true;

  # Root shell
  users.extraUsers.root.shell = pkgs.fish;
  users.extraUsers.user.shell = pkgs.fish;

  # Start SSH agent
  programs.ssh.startAgent = true;

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
    speedtest-cli
  ];
}
