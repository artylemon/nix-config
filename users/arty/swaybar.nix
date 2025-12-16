{ config, lib, pkgs, ... }:

{
  programs.i3status = {
    enable = true;
    enableDefault = false;
    general = {
      colors = true;
      color_good = "#9ccfd8";
      color_degraded = "#f6c177";
      color_bad = "#eb6f92";
      interval = 5;
    };
    modules = {
      "wireless _first_" = {
        position = 1;
        settings = {
          format_up = "%essid %quality ";
          format_down = "W: down";
        };
      };
      "ethernet _first_" = {
        position = 2;
        settings = {
          format_up = "%ifname ";
          format_down = "E: down";
        };
      };
      "volume master" = {
        position = 3;
        settings = {
          format = "%volume  ";
          format_muted = "婢";
          device = "default";
          mixer = "Master";
          mixer_idx = 0;
        };
      };
      "cpu_usage" = {
        position = 4;
        settings = {
          format = "%usage ";
        };
      };
      "memory" = {
        position = 5;
        settings = {
          format = "%used ";
          threshold_degraded = "1G";
          format_degraded = "MEMORY < %available";
        };
      };
      "battery all" = {
        position = 6;
        settings = {
          format = "%percentage %status";
          status_chr = "";
          status_bat = "";
          status_unk = "?";
          status_full = "";
        };
      };
      "tztime local" = {
        position = 7;
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
      colors = {
        background = "#191724";
        statusline = "#e0def4";
        separator = "#6e6a86";
        focusedWorkspace = {
          border = "#ebbcba";
          background = "#ebbcba";
          text = "#191724";
        };
        activeWorkspace = {
          border = "#6e6a86";
          background = "#6e6a86";
          text = "#e0def4";
        };
        inactiveWorkspace = {
          border = "#191724";
          background = "#191724";
          text = "#908caa";
        };
        urgentWorkspace = {
          border = "#eb6f92";
          background = "#eb6f92";
          text = "#191724";
        };
        bindingMode = {
          border = "#eb6f92";
          background = "#eb6f92";
          text = "#191724";
        };
      };
    }
  ];
}
