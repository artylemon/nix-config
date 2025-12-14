{ config, lib, pkgs, ... }:

{
  imports = [
    ./sway.nix
    ./alacritty.nix
    ./git.nix
    ./ssh.nix
    ./packages.nix
    ./waybar.nix
  ];

  home.username = "arty";
  home.homeDirectory = "/home/arty";
  home.stateVersion = "25.05";
}
