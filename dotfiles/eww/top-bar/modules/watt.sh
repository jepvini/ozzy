#!/usr/bin/env bash

while true; do
  bat1=$(bc <<< "scale = 10;(($(cat /sys/class/power_supply/BAT1/current_now)) / 1000000) * (($(cat /sys/class/power_supply/BAT1/voltage_now)) / 1000000)")

  printf "%.2f\n" "$bat1"

  sleep 1
done
