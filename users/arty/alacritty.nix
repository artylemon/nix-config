{ config, pkgs, ... }:
{
  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    general = {
      live_config_reload = true;
      working_directory = "/home/arty/Desktop";
    };

    window = {
      opacity = 0.85; # Slight transparency
    };

    scrolling = {
      history = 10000;
      multiplier = 3;
    };

    font = {
      normal = {
        family = "JetBrainsMono Nerd Font";
        style = "Regular";
      };
      bold = {
        family = "JetBrainsMono Nerd Font";
        style = "Bold";
      };
      italic = {
        family = "JetBrainsMono Nerd Font";
        style = "Italic";
      };
      bold_italic = {
        family = "JetBrainsMono Nerd Font";
        style = "Bold Italic";
      };
      size = 12;
      builtin_box_drawing = true;
    };

    colors = {
      primary = {
        background = "#191724"; # Rosé Pine base
        foreground = "#e0def4"; # Rosé Pine text
      };
      cursor = {
        text = "#e0def4"; # Rosé Pine text
        cursor = "#524f67"; # Rosé Pine pine
      };
      vi_mode_cursor = {
        text = "#e0def4"; # Rosé Pine text
        cursor = "#524f67"; # Rosé Pine pine
      };
      normal = {
        black = "#26233a"; # Rosé Pine surface
        red = "#eb6f92"; # Rosé Pine love
        green = "#9ccfd8"; # Rosé Pine pine
        yellow = "#f6c177"; # Rosé Pine gold
        blue = "#31748f"; # Rosé Pine foam
        magenta = "#c4a7e7"; # Rosé Pine iris
        cyan = "#ebbcba"; # Rosé Pine rose
        white = "#e0def4"; # Rosé Pine text
      };
      bright = {
        black = "#6e6a86"; # Rosé Pine muted
        red = "#eb6f92"; # Rosé Pine love
        green = "#9ccfd8"; # Rosé Pine pine
        yellow = "#f6c177"; # Rosé Pine gold
        blue = "#31748f"; # Rosé Pine foam
        magenta = "#c4a7e7"; # Rosé Pine iris
        cyan = "#ebbcba"; # Rosé Pine rose
        white = "#e0def4"; # Rosé Pine text
      };
    };
  };
}
