#!/usr/bin/env bash

SLEEP_TIME=1

while true; do
  LOAD="$(cat /tmp/cpu-load)"
  # LOAD=90
  # echo "$LOAD"
  if [ "$LOAD" -lt 5 ]; then
    # echo "./runcat/idle.png"
    # echo -ne ""\\r
    echo ""
    sleep 0.69
  else
    SLEEP_TIME="$(bc <<< "scale=2;0.5 / ($LOAD / 10)" )"

    echo ""
    # echo -ne ""\\r
    # echo "./runcat/sprite-0.png"
    sleep "$SLEEP_TIME"
    echo ""
    # echo -ne ""\\r
    # echo "./runcat/sprite-1.png"
    sleep "$SLEEP_TIME"
    echo ""
    # echo -ne ""\\r
    # echo "./runcat/sprite-2.png"
    sleep "$SLEEP_TIME"
    echo ""
    # echo -ne ""\\r
    # echo "./runcat/sprite-3.png"
    sleep "$SLEEP_TIME"
    echo ""
    # echo -ne ""\\r
    # echo "./runcat/sprite-4.png"
    sleep "$SLEEP_TIME"
  fi
  # sleep 1
done
