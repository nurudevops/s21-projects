#!/bin/bash
source ./print_info.sh
source ./colors.sh
CONFIG_FILE="color.conf"

# Цвета по умолчанию
DEFAULT_BG1=3
DEFAULT_TXT1=1
DEFAULT_BG2=2
DEFAULT_TXT2=3

# Функция загрузки параметров из файла
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    fi
}

# Загрузка конфигурации
load_config

    BG1=${column1_background:-$DEFAULT_BG1}
    TXT1=${column1_font_color:-$DEFAULT_TXT1}
    BG2=${column2_background:-$DEFAULT_BG2}
    TXT2=${column2_font_color:-$DEFAULT_TXT2}
# Определяем цвета ANSI
COLORS=( "97" "91" "92" "94" "95" "30" )       # 1-white, 2-red, 3-green, 4-blue, 5-purple, 6-black
BG_COLORS=( "107" "101" "102" "104" "105" "40" ) # Фоновые цвета
COLOR_NAMES=( "white" "red" "green" "blue" "purple" "black" )

# Проверка, чтобы фон и текст не совпадали
if [ "$BG1" -eq "$TXT1" ]; then
    echo "Ошибка: Цвет фона и текста в первой колонке совпадают! Исправьте в config.conf"
    exit 1
fi

if [ "$BG2" -eq "$TXT2" ]; then
    echo "Ошибка: Цвет фона и текста во второй колонке совпадают! Исправьте в config.conf"
    exit 1
fi

# Вывод информации с окраской
print_info | colorize_output
