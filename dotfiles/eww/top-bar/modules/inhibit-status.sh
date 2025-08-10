#!/usr/bin/env bash

while true; do
  swaymsg -t get_tree -r | grep -q "inhibit_idle.*true" && \
    echo "" || echo ""

  sleep 1
done
