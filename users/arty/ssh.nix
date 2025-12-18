{ config, lib, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
      };
      "bradgateserver" = {
        hostname = "192.168.1.101";
        user = "arty";
        port = 2222;
        identityFile = "~/.ssh/id_ed25519_server";
      };
    };
  };
}
