{ config, lib, pkgs, ... }:

{
  programs.i3status = {
    enable = true;
    enableDefault = false;
    general = {
      colors = true;
      interval = 5;
    };
    modules = {
      "wireless _first_" = {
        position = 1;
        settings = {
          format_up = "  %essid";
          format_down = "  down";
        };
      };
      "ethernet _first_" = {
        position = 2;
        settings = {
          format_up = " %ifname";
          format_down = " down";
        };
      };
      "tztime local" = {
        position = 3;
        settings = {
          format = "%H:%M";
        };
      };
    };
  };

  wayland.windowManager.sway.config.bars = [
    {
      statusCommand = "${pkgs.i3status}/bin/i3status";
      fonts = {
        names = [ "JetBrainsMono Nerd Font" ];
        size = 13.0;
      };
      position = "top";
      trayOutput = "*";
    }
  ];
}
