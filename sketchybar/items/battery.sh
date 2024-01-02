#!/usr/bin/env sh

sketchybar --add item battery right                     \
           --set battery update_freq=3                  \
                         icon.drawing=off               \
                         script="$PLUGIN_DIR/power.sh"  \
                         background.color=$MIDNIGHT     \
                         background.border_color=$GREEN \
                         background.border_width=1      \
                         background.padding_left=0      \
                                                        \
           --add item power_logo right                  \
           --set power_logo icon.color=$MIDNIGHT        \
                            label.drawing=off           \
                            background.color=$GREEN
