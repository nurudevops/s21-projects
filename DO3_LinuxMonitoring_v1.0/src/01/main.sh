#!/bin/bash

source "$(dirname "$0")/01.sh"

if [[ $# -ne 1 ]]; then
    echo "Ошибка: необходимо передать ровно один параметр."
    exit 1
fi

input="$1"

if ! is_valid_text "$input"; then
    echo "Ошибка: параметр должен быть текстом (без чисел и спецсимволов)."
    exit 1
fi

echo "Вы ввели: $input"
