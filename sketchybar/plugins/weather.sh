#!/usr/bin/env sh

IP=$(curl -s https://ipinfo.io/ip)
LOCATION_JSON=$(curl -s https://ipinfo.io/$IP/json)
LOCATION="$(echo $LOCATION_JSON | jq '.city' | tr -d '"')"
WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION?format=j1")

TEMPERATURE=$(echo $WEATHER_JSON | jq '.current_condition[0].temp_C' | tr -d '"')
WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"' | sed 's/\(.\{25\}\).*/\1.../')
WIND_SPEED=$(( $(echo $WEATHER_JSON | jq '.current_condition[0].windspeedKmph' | tr -d '"') * 10 / 36 ))

sketchybar --set weather label="${TEMPERATURE}°C · ${WEATHER_DESCRIPTION} · ${WIND_SPEED} m/s" 
sketchybar --set temperature icon= 
