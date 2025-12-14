{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    wofi
    swaylock-effects
    swayidle
    swaybg
    (writeScriptBin "lock-screen" (builtins.readFile ./lock-screen.sh))
    playerctl
    tmux
  ];
}
