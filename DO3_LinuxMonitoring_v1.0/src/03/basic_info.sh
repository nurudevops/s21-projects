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
    echo "OS = $(cat /etc/issue | cut -d'\' -f1)"
}
