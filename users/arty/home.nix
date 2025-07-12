{ config, pkgs, ... }:

{
  home.username = "arty";
  home.homeDirectory = "/home/arty";
  home.stateVersion = "25.05";
  programs.ssh = {
    enable = true;
  };
}
