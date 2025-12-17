#!/bin/bash
get_ip() {
    echo "IP = $(ip a | grep "inet " | awk '{print $2}' | head -n 1)"
}

get_mask() {
    echo "MASK = $(/sbin/ifconfig | grep "netmask " | awk '{print $4}' | head -n 1)"
}

get_gateway() {
    echo "GATEWAY = $(ip -4 r | grep default | awk '{print $3}')"
}
