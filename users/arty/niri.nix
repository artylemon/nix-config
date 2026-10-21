{ config, lib, pkgs, ... }:

{
  xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;

  # fuzzel is niri's default-config app launcher bind (Mod+D); keep it
  # installed so that stock keybinding actually works.
  home.packages = [ pkgs.fuzzel ];
}
