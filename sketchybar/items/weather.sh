#!/usr/bin/env sh

sketchybar --add item weather q                          \
           --set weather update_freq=600                 \
                         script="$PLUGIN_DIR/weather.sh" \
                         icon.drawing=off                \
                         background.color=$MIDNIGHT      \
                         background.border_color=$TEAL   \
                         background.border_width=1       \
                         background.padding_left=0          
                                                          
sketchybar --add item temperature q                      \
           --set temperature icon.color=$MIDNIGHT        \
                             label.drawing=off           \
                             background.color=$TEAL      \
                             icon.padding_left=8         \
                             icon.padding_right=6               
