#!/usr/bin/env bash

SERVER_IP=192.168.1.11

if [[ $1 = --check ]]; then
  if [ "$(curl -s --connect-timeout 1 --request GET "$SERVER_IP/api/v1/ping")" = "pong" ]; then
    echo "alive"
  else
    echo "dead"
  fi
  exit
elif [[ $1 = --toggle ]]; then
  curl -s --request GET "$SERVER_IP/api/v1/commands/?cmd=toggle"
  exit
elif [[ $1 = --prev ]]; then
  curl -s --request GET "$SERVER_IP/api/v1/commands/?cmd=prev"
  exit
elif [[ $1 = --next ]]; then
  curl -s --request GET "$SERVER_IP/api/v1/commands/?cmd=next"
  exit
fi

CURL=$(curl -s  --connect-timeout 5 --request GET  "$SERVER_IP/api/v1/getState")
TITLE=$(jq ".title" <<< "$CURL" | sed "s/\"//g")
ARTIST=$(jq ".artist" <<< "$CURL" | sed "s/\"//g")



OUT="$TITLE - $ARTIST"
printf "%.45s\n" "$OUT"
