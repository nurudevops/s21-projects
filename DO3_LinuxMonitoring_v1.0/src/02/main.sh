#!/bin/bash

source ./basic_info.sh

source ./time_info.sh
source ./network_info.sh
source ./ram_info.sh
source ./space_root.sh
source ./save_info.sh

print_info() {
    get_hostname 
    get_timezone 
    get_user 
    get_os 
    get_date 
    get_uptime 
    get_uptime_sec 
    get_ip 
    get_mask 
    get_gateway 
    get_ram_info
    get_space_root
}


print_info
save_info