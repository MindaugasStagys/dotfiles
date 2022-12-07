#!/usr/bin/env sh

sketchybar --add item time right                      \
           --set time update_freq=1                   \
                      icon.drawing=off                \
                      script="$PLUGIN_DIR/time.sh"    \
                      background.color=$MIDNIGHT      \
                      background.border_color=$YELLOW \
                      background.border_width=1       \
                      background.padding_left=0       \
                                                      \
           --add item time_logo right                 \
           --set time_logo icon=                     \
                           label.drawing=off          \
                           icon.color=$MIDNIGHT       \
                           label.drawing=off          \
                           background.color=$YELLOW

