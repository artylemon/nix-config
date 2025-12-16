{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake .";
      nrb = "sudo nixos-rebuild boot --flake .";
      nrt = "sudo nixos-rebuild test --flake .";
      hm = "home-manager switch --flake .";
      ll = "ls -l";
      la = "ls -la";
    };
  };
}
