{ config, lib, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "sway";

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

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;
}
