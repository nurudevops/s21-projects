#!/bin/bash

# Проверка аргумента
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>/"
    exit 1
fi

DIR="$1"

# Проверка существования директории
if [ ! -d "$DIR" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Проверка, что путь оканчивается на '/'
if [[ "$DIR" != */ ]]; then
    echo "Error: Path must end with '/'."
    exit 1
fi

START_TIME=$(date +%s.%N) # Засекаем время начала выполнения
# Общее число папок (включая вложенные)
TOTAL_FOLDERS=$(find "$DIR" -type d | wc -l)

# Топ-5 папок по размеру
TOP_FOLDERS=$(du -ah "$DIR" 2>/dev/null | sort -rh | head -5 | awk '{print NR " - " $2 ", " $1}')

# Общее число файлов
TOTAL_FILES=$(find "$DIR" -type f | wc -l)

# Число файлов разных типов
CONF_FILES=$(find "$DIR" -type f -name "*.conf" | wc -l)
TEXT_FILES=$(find "$DIR" -type f -exec file --mime-type {} + | grep 'text/plain' | wc -l)
EXEC_FILES=$(find "$DIR" -type f -executable | wc -l)
LOG_FILES=$(find "$DIR" -type f -name "*.log" | wc -l)
ARCHIVE_FILES=$(find "$DIR" -type f -name "*.tar" -o -name "*.gz" -o -name "*.zip" -o -name "*.rar" | wc -l)
SYMLINKS=$(find "$DIR" -type l | wc -l)

# Топ-10 файлов по размеру (с типом файла)
TOP_FILES=$(find "$DIR" -type f -exec du -ah {} + 2>/dev/null | sort -rh | head -10 | awk '{print NR " - " $2 ", " $1 ", " substr($2, length($2)-2, 3)}')

# Топ-10 исполняемых файлов по размеру с MD5
TOP_EXEC=$(find "$DIR" -type f -executable -exec du -ah {} + 2>/dev/null | sort -rh | head -10 | while read -r size path; do
    HASH=$(md5sum "$path" | awk '{print $1}')
    echo "$size $path $HASH"
done | awk '{print NR " - " $2 ", " $1 ", " $3}')

# Вычисление времени выполнения
END_TIME=$(date +%s.%N)
EXECUTION_TIME=$(awk "BEGIN {print  $END_TIME - $START_TIME}")
ROUNDED_TIME=$(printf "%.1f" "$EXECUTION_TIME")
# Вывод информации
echo "Total number of folders (including all nested ones) = $TOTAL_FOLDERS"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$TOP_FOLDERS"
echo "Total number of files = $TOTAL_FILES"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $CONF_FILES"
echo "Text files = $TEXT_FILES"
echo "Executable files = $EXEC_FILES"
echo "Log files (with the extension .log) = $LOG_FILES"
echo "Archive files = $ARCHIVE_FILES"
echo "Symbolic links = $SYMLINKS"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$TOP_FILES"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$TOP_EXEC"
echo "Script execution time (in seconds) = $ROUNDED_TIME"
