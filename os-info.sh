#!/bin/bash

#####################################################
#                                                   #
#  Description : Show basic system information      #
#  Author      : Unixx.io                           #
#  E-mail      : github@unixx.io                    #
#  GitHub      : https://www.github.com/unixxio     #
#  Last Update : November 22, 2021                  #
#                                                   #
#####################################################
clear

# Variables
distro="$(lsb_release -sd | awk '{print tolower ($1)}')"
release="$(lsb_release -sc)"
version="$(lsb_release -sr)"
kernel="$(uname -r)"
uptime="$(uptime -p | cut -d " " -f2-)"
memory="$(free -m | awk 'NR==2{printf "%s / %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')"
disk="$(df -h | awk '$NF=="/"{printf "%d / %dGB (%s)\n", $3,$2,$5}')"
cpu="$(top -bn1 | grep load | awk '{printf "%.2f\n", $(NF-2)}')"
last_reboot="$(last | grep reboot | head -1 | awk '{print $5, $6, $7, $8}')"
my_username="$(whoami)"
user_ip="$(who am i --ips | awk '{print $5}' | sed 's/[()]//g')"
user_hostname="$(host ${user_ip} | awk '{print $5}' | sed 's/.$//')"
network_range="$(hostname -I | rev | cut -d. -f2-4 | rev).0/24"

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Show the current logged in user
echo -e "\nHello ${my_username}, you are logged in from ${user_ip} (${user_hostname}).\n"

# Show system information
echo -e "Distribution : ${distro}"
echo -e "Release      : ${release}"
echo -e "Version      : ${version}"
echo -e "Kernel       : ${kernel}"
echo -e "\nUptime       : ${uptime}"
echo -e "Last Reboot  : ${last_reboot}"
echo -e "\nMemory Usage : ${memory}"
echo -e "Disk Usage   : ${disk}"
echo -e "CPU Load     : ${cpu}\n"

# Finish script
exit 0
