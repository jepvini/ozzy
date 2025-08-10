#!/usr/bin/env bash

while true; do
  SCALING_GOVERNOR="$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"
  ENERGY_PERFORMANCE_PREFERENCE="$(cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference)"
  # GOV="$(tuned-adm active | awk '{print $4}')"

  if [ "$SCALING_GOVERNOR" = "powersave" ] && [ "$ENERGY_PERFORMANCE_PREFERENCE" = "power" ]; then
    echo ""
    # elif [ "$GOV" = "balanced" ]; then
    # echo ""
  elif [ "$SCALING_GOVERNOR" = "performance" ] && [ "$ENERGY_PERFORMANCE_PREFERENCE" = "performance" ]; then
    echo ""
  else
    echo ""
  fi

  sleep 1
done
