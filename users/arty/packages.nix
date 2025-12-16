{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    wofi
    swaylock-effects
    swayidle
    swaybg
    sway-audio-idle-inhibit
    grim
    slurp
    wl-clipboard
    mako
    (writeScriptBin "lock-screen" (builtins.readFile ./lock-screen.sh))
    playerctl
    tmux
  ];
}
