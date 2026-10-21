{ config, lib, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "niri";

  services.logind.settings = {
    Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "lock";
      HandlePowerKey = "suspend";
    };
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock swaybg swayidle mako grim slurp wl-clipboard xdg-desktop-portal-wlr
    ];
  };

  # Alternative session: niri + noctalia shell (see users/arty/niri.nix and
  # users/arty/noctalia.nix). Pulls in xdg-desktop-portal-gnome, gnome-keyring
  # and its own session file; selectable from the ly login screen.
  programs.niri.enable = true;
  services.upower.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;
}
