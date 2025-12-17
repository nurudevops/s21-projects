#!/bin/bash

colorize_output() {
    local BG_LABEL="$1"
    local TXT_LABEL="$2"
    local BG_VALUE="$3"
    local TXT_VALUE="$4"

    while IFS= read -r line; do
        KEY=$(echo "$line" | cut -d'=' -f1)
        VALUE=$(echo "$line" | cut -d'=' -f2-)
        echo -e "\e[${BG_LABEL};${TXT_LABEL}m${KEY}\e[0m = \e[${BG_VALUE};${TXT_VALUE}m${VALUE}\e[0m"
    done
}
