#!/bin/bash

# Define layout codes in the order you declared them
layouts=(us es de)

# Get the active layout index
index=$(swaymsg -t get_inputs | jq '.[] | select(.type=="keyboard") | .xkb_active_layout_index' | head -n 1)

# Print the layout code
echo "${layouts[$index]}"
