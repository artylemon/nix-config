{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;  # makes waybar restart automatically if it crashes

    settings = [{
      layer = "top";
      position = "top";
      height = 32;

      modules-left   = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "clock" ];                     # ← your #2 requirement
      modules-right  = [
        "network"              # ← your #1 requirement (clickable)
        "pulseaudio"
        "cpu"
        "memory"
        "battery"
        "tray"
      ];

      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        persistent_workspaces = { "1" = []; "2" = []; "3" = []; "4" = []; "5" = []; };
      };

      "sway/mode" = {
        format = "<span style=\"italic\">{}</span>";
      };

      clock = {
        interval = 60;
        format = "{:%H:%M}";      # looks good centered
        format-alt = "{:%Y-%m-%d %H:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      network = {
        format-wifi = "{essid}  {signalStrength}% ";
        format-ethernet = "{ifname} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "⚠";
        tooltip-format = "{ifname} – {ipaddr}/{cidr}";
        # Left click  → show nm-connection-editor
        # Right click → launch the tray applet (best UX)
        on-click = "nm-connection-editor";
        on-click-right = "nm-applet &";
      };

      pulseaudio = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}";
        format-muted = "婢";
        format-icons = {
          default = [ "" "" " "];
          headphone = "";
          headset = "";
        };
        scroll-step = 5;
        on-click = "pavucontrol";
      };

      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };

      memory = {
        format = "{used:0.1f}G ";
      };

      battery = {
        bat = "BAT0";                         # usually BAT0 or BAT1 – check with `upower -e`
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-icons = [ "" "" "" "" "" ];
        tooltip = false;
      };

      tray = {
        spacing = 8;
      };
      style = "${./waybar-style.css}";
    }];
  };
}
