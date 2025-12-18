#!/bin/sh
# Switch to the next layout
swaymsg input type:keyboard xkb_switch_layout next

# Get the current layout name
# We filter for keyboards and grab the first one that has a layout name
LAYOUT=$(swaymsg -t get_inputs | jq -r '.[] | select(.type=="keyboard") | .xkb_active_layout_name' | grep -v "null" | head -n1)

# Show the OSD
# If layout is empty (shouldn't happen), default to "Unknown"
if [ -z "$LAYOUT" ]; then
  LAYOUT="Unknown"
fi

swayosd-client --custom-message "$LAYOUT" --custom-icon input-keyboard-symbolic
