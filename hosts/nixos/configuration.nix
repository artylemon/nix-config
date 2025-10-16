{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./i18n.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
    ./users.nix
    ./environment.nix
  ];

  system.stateVersion = "25.05";
}
