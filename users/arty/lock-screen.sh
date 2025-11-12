# users/arty/lock-screen.sh
#!/usr/bin/env bash

swaylock-effects \
  --image "$WALLPAPER" \
  --effect-blur 7x5 \
  --effect-vignette 0.5:0.5 \
  --clock \
  --indicator \
  --indicator-radius 120 \
  --indicator-thickness 8 \
  --ring-color 524f67 \
  --key-hl-color eb6f92 \
  --inside-color 191724 \
  --text-color e0def4 \
  --line-color 00000000 \
  --ring-ver-color 9ccfd8 \
  --ring-wrong-color eb6f92 \
  --ring-clear-color 26233a \
  --fade-in 0.3 \
  --grace 2 \
  --daemonize
