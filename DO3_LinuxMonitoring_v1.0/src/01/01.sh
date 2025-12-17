#!/bin/bash

is_valid_text() {
    local input="$1"

    if [[ "$input" =~ ^[a-zA-Z]+$ ]]; then
        return 0
    else
        return 1
    fi
}
