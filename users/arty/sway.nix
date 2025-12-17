{ config, lib, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    package = pkgs.sway;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      bars = [];
      menu = "wofi --show drun";
      keybindings = let
        mod = "Mod4";
      in {
        "${mod}+Return" = "exec alacritty";
        "${mod}+Escape" = "exec lock-screen";
        "${mod}+b" = "exec brave";
        "${mod}+d" = "exec wofi --show drun";
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+w" = "kill";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+Alt+h" = "move workspace to output left";
        "${mod}+Alt+j" = "move workspace to output down";
        "${mod}+Alt+k" = "move workspace to output up";
        "${mod}+Alt+l" = "move workspace to output right";
        "${mod}+Alt+Left" = "move workspace to output left";
        "${mod}+Alt+Down" = "move workspace to output down";
        "${mod}+Alt+Up" = "move workspace to output up";
        "${mod}+Alt+Right" = "move workspace to output right";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        # Function keys
        "XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";
        "XF86AudioLowerVolume" = "exec swayosd-client --output-volume lower";
        "XF86AudioRaiseVolume" = "exec swayosd-client --output-volume raise";
        "XF86MonBrightnessDown" = "exec swayosd-client --brightness lower";
        "XF86MonBrightnessUp" = "exec swayosd-client --brightness raise";
        "XF86RFKill" = "exec nmcli radio wifi toggle";
        "XF86ScreenSaver" = "exec lock-screen";

        # Media Keys
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";

        # Screenshots
        "Print" = "exec grim - | wl-copy";
        "Shift+Print" = "exec grim -g \"$(slurp)\" - | wl-copy";

        # Scratchpad
        "${mod}+minus" = "scratchpad show";
        "${mod}+Shift+minus" = "move scratchpad";

        # Notifications
        "${mod}+n" = "exec makoctl dismiss";
        "${mod}+Shift+n" = "exec makoctl dismiss -a";

        # Language Switch
        "${mod}+space" = "exec switch-layout";
      };

      input = {
        "type:keyboard" = {
          xkb_layout = "us,ru";
          # xkb_options = "grp:win_space_toggle"; # Handled by keybinding now
        };
        "type:touchpad" = {
          natural_scroll = "enabled";
          tap = "enabled";
          scroll_factor = "0.5";
        };
      };

      output = {
        "*" = {};
      };

      startup = [
        { command = "swaybg -i /home/arty/walls/Cat_at_Play.png -m fill"; }
        { command = "waybar"; }
        { command = "swayosd-server"; }
        { command = "mako"; }
        { command = "nm-applet --indicator"; }
        { command = "sway-audio-idle-inhibit"; }
        {
          command = ''
          swayidle -w \
            timeout 300 'lock-screen' \
            timeout 600 'swaymsg "output * dpms off"' \
            resume 'swaymsg "output * dpms on"' \
            before-sleep 'lock-screen' \
            timeout 900 'systemctl suspend'
          '';
          always = true;
        }
      ];

      window = {
        border = 1;
        titlebar = false;
      };
      floating = {
        border = 1;
        titlebar = false;
      };
    };
  };
}
