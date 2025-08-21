#!/usr/bin/env sh

LABEL=$(system_profiler SPAirPortDataType -detailLevel basic | awk '/Current Network/ {getline;$1=$1;print $0 | "tr -d ':'";exit}')

sketchybar --set $NAME label=$LABEL
