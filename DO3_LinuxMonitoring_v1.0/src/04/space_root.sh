#!/bin/bash
get_space_root() {
    echo "SPACE_ROOT = $(df -BKB / | awk 'NR==2 {printf "%.2f MB\n", $2/1000}')"
    echo "SPACE_ROOT_USED = $(df -BKB / | awk 'NR==2 {printf "%.2f MB\n", $3/1000}')"
    echo "SPACE_ROOT_FREE = $(df -BKB / | awk 'NR==2 {printf "%.2f MB\n", $4/1000}')"
}
