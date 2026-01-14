#!/usr/bin/env sh

LABEL=$(networksetup -listpreferredwirelessnetworks en0 | sed -n '2p' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

sketchybar --set $NAME label=$LABEL
