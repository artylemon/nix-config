{ config, pkgs, ... }:

{
  #imports = [
  #  ./alacritty.nix
  #  ./waybar.nix
  #];

  home.packages = with pkgs; [
    brave
    wofi
  ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      # Configure Bradgate ubuntu server
      "bradgateserver" = {
        hostname = "192.168.1.101";
        user = "arty";
        port = 2222;
        identityFile = "~/.ssh/id_ed25519_server";
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.grk = true;
    package = pkgs.sway;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "wofi --show drun";
      keybindings = let
        mod = "Mod4";
      in {
        "${mod}+Return"="exec alacritty";
        "${mod}+b"="exec brave";
        "${mod}+d"="exec wofi --show drun";
        "${mod}+h"="focus left";
        "${mod}+j"="focus down";
        "${mod}+k"="focus up";
        "${mod}+l"="focus right";
        "${mod}+w"="kill";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        # Move whole workspace to other output
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
      };

      # Touchpad configuration
      input = {
        "type:touchpad" = {
          natural_scroll = "enabled";
          tap = "enabled"; # Optional: Tap-to-click
          scroll_factor = "0.5"; # Optional: Adjust scroll speed
        };
      };

      output = {
        "*" = {
        };
      };

      bars = [
        {command="waybar";}
      ];

      startup = [
        {command="swaybg -i /home/arty/walls/Cat_at_Play.png -m fill";}
        {command="mako";}
        {command="nm-applet";}
      ];
      # Disable window decorations
      window = {
        border = 1; # No border (removes title bars)
        titlebar = false; # Explicitly disable title bars
      };
      floating = {
        border = 1; # No border for floating windows
        titlebar = false; # No title bars for floating windows
      };
    };
  };
  home.username = "arty";
  home.homeDirectory = "/home/arty";
  home.stateVersion = "25.05";
}
