{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar-style.css;
    systemd.enable = true;
    settings = {
      mainBar = {

        layer = "top";
        position = "top";
        height = 28;

        modules-left   = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "clock" ];
        modules-right  = [
          "network"
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
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
          on-click-right = "${pkgs.networkmanagerapplet}/bin/nm-applet";
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
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
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
      };
    };
  };

  systemd.user.services.waybar = lib.mkIf config.programs.waybar.enable {
    Service = {
      Restart = lib.mkForce "always";
      RestartSec = lib.mkForce 2;
    };
  };
}
