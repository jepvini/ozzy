#!/usr/bin/env bash

while true; do
  val=$(top -bn 2 -d 0.5 | grep '^%Cpu' | tail -n 1 | gawk '{print int($2+$4+$6)}')
  echo "$val" > /tmp/cpu-load
  sleep 1
done
