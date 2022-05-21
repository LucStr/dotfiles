#!/bin/bash

BRIGHT=$(echo "$(xrandr --current --verbose | grep --line-buffered 'Bright' | head -n 1 | awk -F'[[:space:]]' '{print $3}') + $1" | bc -l)

OUT=$(xrandr --current | grep ' connected' | head -n 1 | awk '{print $1}')

echo $BRIGHT $OUT

if (( $(echo "$BRIGHT > 1.2 || $BRIGHT < 0.2" |bc -l) )); then
  exit 1 
fi

xrandr --output $OUT --brightness $BRIGHT
