#!/bin/bash

colorize_output() {


    while IFS= read -r line; do
     KEY=$(echo "$line" | cut -d'=' -f1)
    VALUE=$(echo "$line" | cut -d'=' -f2-)
    echo -e "\e[${BG_COLORS[$((BG1-1))]};${COLORS[$((TXT1-1))]}m ${KEY}\e[0m = \e[${BG_COLORS[$((BG2-1))]};${COLORS[$((TXT2-1))]}m${VALUE}\e[0m"
done

echo

# Вывод используемой цветовой схемы
echo "Column 1 background = ${column1_background:-default} (${COLOR_NAMES[$((BG1-1))]})"
echo "Column 1 font color = ${column1_font_color:-default} (${COLOR_NAMES[$((TXT1-1))]})"
echo "Column 2 background = ${column2_background:-default} (${COLOR_NAMES[$((BG2-1))]})"
echo "Column 2 font color = ${column2_font_color:-default} (${COLOR_NAMES[$((TXT2-1))]})"
}
