{ inputs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        # Closest built-in dark theme to the rose-pine look used elsewhere;
        # noctalia doesn't ship rose-pine itself.
        builtin = "Catppuccin";
      };
      wallpaper = {
        enabled = true;
        default.path = "/home/arty/walls/Cat_at_Play.png";
      };
      bar.main = {
        auto_hide = true;
        smart_auto_hide = true;
        reserve_space = false;
        thickness = 24;
      };
    };
  };
}
