{ config, pkgs, lib, ... }:

{
  programs.wlogout = {
    enable = true;
    style = builtins.readFile ./wlogout-style.css;
    layout = [
      { label = "lock"; action = "lock-screen"; text = "Lock"; keybind = "l"; }
      { label = "logout"; action = "swaymsg exit"; text = "Logout"; keybind = "e"; }
      { label = "suspend"; action = "systemctl suspend"; text = "Suspend"; keybind = "s"; }
      { label = "reboot"; action = "systemctl reboot"; text = "Reboot"; keybind = "r"; }
      { label = "shutdown"; action = "systemctl poweroff"; text = "Shutdown"; keybind = "p"; }
    ];
  };
}
