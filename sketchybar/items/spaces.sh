#!/usr/bin/env sh

SPACE_ICONS=("1" "2" "3" "4" "1" "2" "3" "4")
SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                               \
             --set space.$sid associated_space=$sid                         \
                              icon=${SPACE_ICONS[i]}                        \
                              icon.padding_left=22                          \
                              icon.padding_right=22                         \
                              icon.color=$ROSEWATER                         \
                              label.padding_right=33                        \
                              icon.highlight_color=$RED                     \
                              background.padding_left=-8                    \
                              background.padding_right=-8                   \
                              background.color=$MIDNIGHT                    \
                              background.drawing=on                         \
                              label.font="sketchybar-app-font:Bold:16.0"    \
                              label.background.height=26                    \
                              label.background.drawing=on                   \
                              label.background.color=$MIDNIGHT              \
                              label.background.corner_radius=9              \
                              label.drawing=off                             \
                              script="$PLUGIN_DIR/space.sh"                 \
                              click_script="$SPACE_CLICK_SCRIPT"
done
