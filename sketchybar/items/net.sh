#!/usr/bin/env sh

sketchybar --add item net right                      \
           --set net script="$PLUGIN_DIR/net.sh"     \
                     icon.drawing=off                \
                     background.color=$MIDNIGHT      \
                     background.border_color=$MAROON \
                     background.border_width=1       \
                     background.padding_left=0       \
                                                     \
           --add item net_logo right                 \
           --set net_logo icon=                     \
                     icon.color=$MIDNIGHT            \
                     label.drawing=off               \
                     background.color=$MAROON
