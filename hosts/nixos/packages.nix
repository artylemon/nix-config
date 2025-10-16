{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim wget python3Full neovim networkmanagerapplet git alacritty btop wofi
    xwallpaper xclip brave xfce.thunar xfce.tumbler gvfs gcc lua lua5_1 nodejs_24
    zip unzip luajitPackages.luarocks_bootstrap bluez blueberry pamixer pavucontrol
    qbittorrent vlc ntfs3g exfat udiskie
  ];
}
