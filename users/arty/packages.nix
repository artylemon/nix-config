{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    wofi
    swaylock-effects
    swayidle
    swaybg
  ];
}
