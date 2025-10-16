{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez.override { enableExperimental = true; };
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  powerManagement.enable = true;
  services.thermald.enable = true;
  services.tlp.enable = true;
  services.tlp.settings = {
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    START_CHARGE_THRESH_BAT0 = 80;
    STOP_CHARGE_THRESH_BAT0 = 90;
  };
  powerManagement.powertop.enable = true;
}
