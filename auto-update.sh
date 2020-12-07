#!/bin/bash

LOGFILE=/usr/bin/auto-update.log
CURRENT_TIME=$( date +%s )

function perform_update {
  sudo apt-get update -y
  sudo apt upgrade -y
  sudo echo "$CURRENT_TIME" >> "$LOGFILE"
}

if test -f "$LOGFILE"; then
    echo "Logfile exists"
    PREVIOUS_UPDATE=$(head -n 1 $LOGFILE)
    if (((PREVIOUS_UPDATE + 604800) > CURRENT_TIME)); then
      sudo rm "$LOGFILE"
      perform_update
    fi
else
  perform_update
fi
