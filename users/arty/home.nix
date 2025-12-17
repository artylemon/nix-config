{ config, lib, pkgs, ... }:

{
  imports = [
    ./sway.nix
    ./alacritty.nix
    ./git.nix
    ./ssh.nix
    ./packages.nix
    ./waybar.nix
    ./bash.nix
  ];

  home.username = "arty";
  home.homeDirectory = "/home/arty";
  home.stateVersion = "25.05";

  gtk = {
    enable = true;
    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
  };
}
