#!/bin/bash

CYAN='\033[0;36m'
RED='\033[0;31m'
NOCOLOR='\033[0m'

echo -e "${CYAN}RASPBERRY PI SETUP"
echo "---------------------------"

echo "Give the Raspberry Pi a unique hostname:"
read hostname
sed -i "s/raspberrypi/$hostname/" /etc/hostname
sed -i "s/raspberrypi/$hostname/" /etc/hosts
echo "[STATUS] Hostname updated"
echo -e "${RED}REMEMBER TO PRINT A STICKER WITH THE FOLLOWING INFORMATION:"
modelname=$(cat /proc/device-tree/model)
echo "$modelname"
echo "username: pi"
echo "password: <password>"
echo -e "hostname $hostname"
sleep 4

echo -e "${CYAN}[STATUS] Looking for updates..${NOCOLOR}"
sudo apt-get update -y
echo -e "${CYAN}[STATUS] Starting to update..${NOCOLOR}"
sudo apt upgrade -y
echo -e "${CYAN}[STATUS] Update finished"

echo "[STATUS] Setting up automatic updates.."
sudo crontab -l > newCron
echo "0 3 * * * sudo apt update &" >> newCron
echo "0 4 * * * sudo apt upgrade -y &" >> newCron
echo "0 5 * * * sudo reboot &" >> newCron
sudo crontab newCron
sudo rm newCron
echo "[STATUS] Automatic updates setup"

echo e- "[STATUS] Installing an xrdp-server for Remote Desktop access..${NOCOLOR}"
sudo apt-get install xrdp -y
echo -e "${CYAN}[STATUS] xrdp server installed"

cd /home/pi
echo "[STATUS] Raspberry Pi setup ready"
