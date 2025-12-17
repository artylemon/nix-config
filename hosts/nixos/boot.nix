{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # "mem_sleep_default=deep" forces Suspend-to-RAM instead of s2idle, fixing wake issues
  boot.kernelParams = [ "nowatchdog" "mem_sleep_default=deep" ];
  boot.blacklistedKernelModules = [ "iTCO_wdt" ];
}
