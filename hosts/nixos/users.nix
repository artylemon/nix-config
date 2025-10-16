{ config, lib, pkgs, ... }:

{
  users.users.arty = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "disk" ];
    packages = with pkgs; [ tree discord ];
  };
}
