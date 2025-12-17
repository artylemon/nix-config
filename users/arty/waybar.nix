{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar-style.css;
    systemd.enable = false;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "clock" ];
        modules-right = [
          "network"
          "pulseaudio"
          "backlight"
          "cpu"
          "memory"
          "battery"
          "sway/language"
          "tray"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };

        "sway/language" = {
          format = "{} ";
          on-click = "swaymsg input type:keyboard xkb_switch_layout next";
        };

        clock = {
          interval = 60;
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "⚠";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "Muted ∅";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" " " ];
          };
          scroll-step = 5;
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        backlight = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        cpu = {
          format = "{usage}% ";
          interval = 10;
        };

        memory = {
          format = "{used:0.1f}G ";
          interval = 30;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        tray = {
          spacing = 10;
        };
      };
    };
  };
}
