#!/usr/bin/env sh

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"
POPUP_SCRIPT="sketchybar -m --set spotify.anchor popup.drawing=toggle"

sketchybar --add       event           spotify_change $SPOTIFY_EVENT        \
           --add       item            spotify.anchor left                  \
           --set       spotify.anchor  icon=                               \
                                       label.drawing=off                    \
                                       icon.color=$MIDNIGHT                 \
                                       background.color=$PINK               \
                                       background.padding_left=26           \
                                       click_script="$POPUP_SCRIPT"         \
                                       popup.horizontal=on                  \
                                       popup.align=left                     \
                                       popup.height=140                     \
                                       popup.background.border_color=$PINK  \
                                                                            \
           --subscribe spotify.anchor  mouse.entered mouse.exited           \
                                       mouse.exited.global                  \
                                                                            \
           --add       item            spotify.cover popup.spotify.anchor   \
           --set       spotify.cover   script="$PLUGIN_DIR/spotify.sh"      \
                                       label.drawing=off                    \
                                       icon.drawing=off                     \
                                       background.padding_left=20           \
                                       background.padding_right=15          \
                                       background.image.scale=0.17          \
                                       background.image.drawing=on          \
                                       background.drawing=on                \
                                                                            \
           --add       item            spotify.title popup.spotify.anchor   \
           --set       spotify.title   icon.drawing=off                     \
                                       background.padding_left=0            \
                                       background.padding_right=0           \
                                       width=0                              \
                                       label.font="$FONT:Bold:14.0"         \
                                       label.max_chars=23                   \
                                       scroll_texts=on                      \
                                       y_offset=45                          \
                                                                            \
           --add       item            spotify.artist popup.spotify.anchor  \
           --set       spotify.artist  icon.drawing=off                     \
                                       y_offset=25                          \
                                       background.padding_left=0            \
                                       background.padding_right=0           \
                                       label.max_chars=27                   \
                                       scroll_texts=on                      \
                                       width=0                              \
                                                                            \
           --add       item            spotify.album popup.spotify.anchor   \
           --set       spotify.album   icon.drawing=off                     \
                                       background.padding_left=0            \
                                       background.padding_right=0           \
                                       label.max_chars=27                   \
                                       scroll_texts=on                      \
                                       y_offset=8                           \
                                       width=0                              \
                                                                            \
           --add       slider          spotify.state popup.spotify.anchor   \
           --set       spotify.state   icon.drawing=on                      \
                                       icon.font="$FONT:Light Italic:10.0"  \
                                       icon.width=35                        \
                                       icon="00:00"                         \
                                       label.drawing=on                     \
                                       label.font="$FONT:Light Italic:10.0" \
                                       label.width=35                       \
                                       label="00:00"                        \
                                       padding_left=0                       \
                                       padding_right=0                      \
                                       y_offset=-17                         \
                                       width=0                              \
                                       slider.background.height=6           \
                                       slider.background.corner_radius=1    \
                                       slider.background.color=$BLACK       \
                                       slider.highlight_color=$PINK         \
                                       slider.percentage=40                 \
                                       slider.width=140                     \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       update_freq=1                        \
                                       updates=when_shown                   \
           --subscribe spotify.state   mouse.clicked                        \
                                                                            \
           --add       item            spotify.shuffle popup.spotify.anchor \
           --set       spotify.shuffle icon=􀊝                              \
                                       icon.padding_left=5                  \
                                       icon.padding_right=5                 \
                                       icon.color=$ROSEWATER                \
                                       icon.highlight_color=$PINK           \
                                       label.drawing=off                    \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       y_offset=-42                         \
           --subscribe spotify.shuffle mouse.clicked                        \
                                                                            \
           --add       item            spotify.back popup.spotify.anchor    \
           --set       spotify.back    icon=􀊎                              \
                                       icon.padding_left=5                  \
                                       icon.padding_right=5                 \
                                       icon.color=$ROSEWATER                \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       label.drawing=off                    \
                                       y_offset=-42                         \
           --subscribe spotify.back    mouse.clicked                        \
                                                                            \
	       --add       item            spotify.play popup.spotify.anchor    \
           --set       spotify.play    icon=􀊄                              \
                                       background.height=40                 \
	                                   background.corner_radius=20          \
                                       width=40                             \
                                       align=center                         \
                                       background.color=$MIDNIGHT           \
                                       background.border_color=$ROSEWATER   \
                                       background.border_width=0            \
                                       background.drawing=on                \
                                       icon.padding_left=4                  \
                                       icon.padding_right=5                 \
                                       icon.color=$ROSEWATER                \
                                       updates=on                           \
                                       label.drawing=off                    \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       y_offset=-42                         \
           --subscribe spotify.play    mouse.clicked spotify_change         \
                                                                            \
           --add       item            spotify.next popup.spotify.anchor    \
           --set       spotify.next    icon=􀊐                              \
                                       icon.padding_left=5                  \
                                       icon.padding_right=10                \
                                       icon.color=$ROSEWATER                \
                                       label.drawing=off                    \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       y_offset=-42                         \
           --subscribe spotify.next    mouse.clicked                        \
                                                                            \
           --add       item            spotify.repeat popup.spotify.anchor  \
           --set       spotify.repeat  icon=􀊞                              \
                                       icon.highlight_color=$PINK           \
                                       icon.padding_left=5                  \
                                       icon.padding_right=10                \
                                       icon.color=$ROSEWATER                \
                                       label.drawing=off                    \
                                       script="$PLUGIN_DIR/spotify.sh"      \
                                       y_offset=-42                         \
           --subscribe spotify.repeat  mouse.clicked                        \
                                                                            \
           --add       item            spotify.spacer popup.spotify.anchor  \
           --set       spotify.spacer  width=5                              \
                                                                            \
           --add       bracket         spotify spotify.shuffle              \
                                               spotify.back                 \
                                               spotify.play                 \
                                               spotify.next                 \
                                               spotify.repeat               \
           --set       spotify         background.color=$BLACK              \
                                       background.corner_radius=11          \
                                       background.drawing=on                \
                                       y_offset=-42                         \
                                       drawing=off                          \
                                                                            \
           --add       item            spot left                            \
           --set       spot            update_freq=1                        \
                                       icon.drawing=off                     \
                                       updates=on                           \
                                       script="$PLUGIN_DIR/spotifyIndicator.sh" \
                                       label.max_chars=50                   \
                                       label.scroll_duration=300            \
                                       scroll_texts=on                      \
                                       background.color=$MIDNIGHT           \
                                       background.border_color=$PINK        \
                                       background.border_width=1            \
                                       background.padding_left=0


