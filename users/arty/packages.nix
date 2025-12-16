{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    wofi
    swaylock-effects
    swayidle
    swaybg
    sway-audio-idle-inhibit
    (writeScriptBin "lock-screen" (builtins.readFile ./lock-screen.sh))
    playerctl
    tmux
  ];
}
