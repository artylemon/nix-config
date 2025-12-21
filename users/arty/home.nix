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

  systemd.user.services.swayosd = {
    Unit = {
      Description = "SwayOSD Server";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.swayosd}/bin/swayosd-server";
      Restart = "always";
      RestartSec = "1s";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
