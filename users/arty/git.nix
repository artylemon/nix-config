{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "artylemon";
      email = "artemtiunelis@gmail.com";
    };
  };
}
