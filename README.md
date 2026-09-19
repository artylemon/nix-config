# nixos-config

NixOS flake configuration for a single laptop, using Home Manager for the
user-level setup. Window manager is Sway (Wayland); display manager is `ly`.

## Structure

```
flake.nix                  Flake entrypoint: nixosConfigurations.nixos
hosts/nixos/                System-level configuration
  configuration.nix         Top-level imports, nix settings, stateVersion
  hardware.nix / hardware-configuration.nix   Hardware-specific config
  boot.nix                  Bootloader
  networking.nix            Network config
  i18n.nix                  Locale, console keymap, X11 keyboard layout (us,ru)
  fonts.nix                 System fonts
  packages.nix              System-wide packages
  services.nix              ly display manager, logind lid/power behavior,
                             sway system package, pipewire, firefox
  users.nix                 User account definitions
  environment.nix           Environment-level settings
users/arty/                 Home Manager configuration for user `arty`
  home.nix                  Entrypoint; imports the modules below, gtk/theme
                             (rose-pine), swayosd systemd user service
  sway.nix                  Sway config: keybindings, input, output, startup
                             apps, swayidle lock/suspend timers
  packages.nix              home.packages, incl. custom scripts wrapped via
                             writeScriptBin (lock-screen, switch-layout)
  lock-screen.sh            swaylock wrapper with rose-pine styling
  switch-layout.sh          Cycles keyboard layout, shows OSD via swayosd
  waybar.nix / waybar-style.css   Status bar
  swayosd-style.css         OSD styling
  alacritty.nix             Terminal emulator config
  git.nix                   Git config
  ssh.nix                   SSH config
  bash.nix                  Shell config
```

## Notable gotchas

- **Sway keybinding flags**: Home Manager's `wayland.windowManager.sway.config.keybindings`
  attrset only emits plain `bindsym <key> <action>` lines — there's no way to
  attach flags (e.g. `--locked`, `--release`) per-binding through that option.
  For bindings that need flags, use `wayland.windowManager.sway.extraConfig`
  (a **sibling** of `config`, not nested inside it) with a raw `bindsym` line.
- **`--locked` bindings**: Sway ignores normal keybindings while a session
  lock (swaylock) is active, unless the binding has the `--locked` flag. The
  `Mod4+space` layout-switch binding uses this so you can fix your keyboard
  layout back to `us` before typing your password on the lock screen, even if
  it was left on a non-US layout (e.g. `ru`) when the screen locked.
- Keyboard layout is `us,ru` everywhere (console, X11/i18n.nix, and sway
  input config) — kept in sync manually across `hosts/nixos/i18n.nix` and
  `users/arty/sway.nix`.

## Applying changes

```
sudo nixos-rebuild switch --flake .#nixos
```

Home Manager is wired in as a NixOS module, so this also applies user-level
(`users/arty/*`) changes — no separate `home-manager switch` needed.
