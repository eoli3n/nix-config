{ config, pkgs, ... }:

{
  # Enable fish.
  programs.fish.enable = true;

  # Enable libvirt
  boot.kernelModules = [ "kvm-intel" ];
  virtualisation.libvirtd.enable = true;

  # Enable docker and podman
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
    tree
    htop
    nmap
    nethogs
    netcat-gnu
    tcpdump
    whois
    ansible
    lf
    ncdu
    asciinema
    speedtest-cli
    docker-compose
    rclone
    neofetch
    unzip
    ix
    stress
    bind
    cifs-utils
  ];
}
