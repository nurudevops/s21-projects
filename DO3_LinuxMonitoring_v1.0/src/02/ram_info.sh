#!/bin/bash
get_ram_info() {
    echo "RAM_TOTAL = $(free --mega | awk '/Mem:/{print $2/1000}') GB"
    echo "RAM_USED = $(free --mega | awk '/Mem:/{print $3/1000}') GB"
    echo "RAM_FREE = $(free --mega | awk '/Mem:/{print $4/1000}') GB"
}
