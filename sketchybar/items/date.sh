#!/usr/bin/env sh

sketchybar --add item date right                        \
           --set date update_freq=1000                  \
                      icon.drawing=off                  \
                      script="$PLUGIN_DIR/date.sh"      \
                      background.color=$MIDNIGHT        \
                      background.border_color=$SAPPHIRE \
                      background.border_width=1         \
                      background.padding_left=0         \
                                                        \
           --add item clock_logo right                  \
           --set clock_logo icon=                      \
                            icon.color=$MIDNIGHT        \
                            label.drawing=off           \
                            background.color=$SAPPHIRE    
