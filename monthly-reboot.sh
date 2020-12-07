#!/bin/bash

UPTIME=$(echo $(awk '{print $1}' /proc/uptime) / 3600 | bc)
if ((UPTIME > 730)); then
    sudo reboot
fi
