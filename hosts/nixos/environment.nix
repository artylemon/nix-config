{ config, lib, pkgs, ... }:

{
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";

    WALLPAPER = "${config.home.homeDirectory}/walls/Cat_at_Play.png";
  };

  environment.etc."xdg/user-dirs.dirs".text = ''
    XDG_DOWNLOAD_DIR="$HOME/Downloads"
    XDG_DESKTOP_DIR="$HOME/Desktop"
    XDG_DOCUMENTS_DIR="$HOME/Documents"
    XDG_MUSIC_DIR="$HOME/Music"
    XDG_PICTURES_DIR="$HOME/Pictures"
    XDG_VIDEOS_DIR="$HOME/Videos"
  '';
}
