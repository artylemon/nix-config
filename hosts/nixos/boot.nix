{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Fix for stuck shutdown/reboot (watchdog not stopping)
  boot.kernelParams = [ "nowatchdog" ];
  boot.blacklistedKernelModules = [ "iTCO_wdt" ];
}
