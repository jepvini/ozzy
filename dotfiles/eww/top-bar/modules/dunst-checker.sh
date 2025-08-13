#!/usr/bin/env bash

while true; do
  PAUSED="$(dunstctl is-paused)"

  if [ "$PAUSED" = "true" ]; then
    echo ""
  elif [ "$PAUSED" = "false" ]; then
    echo ""
  else
    echo "ERR"
  fi

  sleep 1
done
