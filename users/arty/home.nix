{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./ssh.nix
    ./sway.nix
    ./packages.nix
  ];

  home.username = "arty";
  home.homeDirectory = "/home/arty";
  home.stateVersion = "25.05";
}
