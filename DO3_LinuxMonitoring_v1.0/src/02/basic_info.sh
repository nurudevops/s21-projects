#!/bin/bash

get_hostname() {
    echo "HOSTNAME = $(hostname)"
}

get_timezone() {
    echo "TIMEZONE = $(timedatectl | grep "Time zone" | awk '{print $3 $4}' | tr -d '(),')"
}

get_user() {
    echo "USER = $(whoami)"
}

get_os() {
    echo "OS = $(cat /etc/issue)"
}

# get_date() {
#     echo "DATE = $(date '+%d %b %Y %H:%M:%S')"
# }

# get_uptime() {
#     echo "UPTIME = $(uptime -p)"
# }

# get_uptime_sec() {
#     echo "UPTIME_SEC = $(awk '{print ($1)}' /proc/uptime)"
# }

# get_ip() {
#     echo "IP = $(ip a | grep "inet " | awk '{print $2}' | head -n 1)"
# }

# get_mask() {
#     echo "MASK = $(/sbin/ifconfig | grep "netmask " | awk '{print $4}' | head -n 1)"
# }

# get_gateway() {
#     echo "GATEWAY = $(ip -4 r | grep default | awk '{print $3}')"
# }

# get_ram_info() {
#     echo "RAM_TOTAL = $(free --mega | awk '/Mem:/{print $2/1000}') GB"
#     echo "RAM_USED = $(free --mega | awk '/Mem:/{print $3/1000}') GB"
#     echo "RAM_FREE = $(free --mega | awk '/Mem:/{print $4/1000}') GB"
# }

# get_space_root() {
#     echo "SPACE_ROOT = $(df -BKB / | awk 'NR==2 {printf "%.2f MB\n", $2/1000}')"
#     echo "SPACE_ROOT_USED = $(df -BKB / | awk 'NR==2 {printf "%.2f MB\n", $3/1000}')"
#     echo "SPACE_ROOT_FREE = $(df -BKB / | awk 'NR==2 {printf "%.2f MB\n", $4/1000}')"
# }