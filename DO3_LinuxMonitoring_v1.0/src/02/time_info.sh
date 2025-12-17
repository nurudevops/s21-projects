#!/bin/bash
get_date() {
    echo "DATE = $(date '+%d %b %Y %H:%M:%S')"
}

get_uptime() {
    echo "UPTIME = $(uptime -p)"
}

get_uptime_sec() {
    echo "UPTIME_SEC = $(awk '{print ($1)}' /proc/uptime)"
}
