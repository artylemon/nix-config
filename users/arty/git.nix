{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "artylemon";
    userEmail = "artemtiunelis@gmail.com";
  };
}
