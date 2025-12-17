#!/bin/bash

run_test() {
    local test_name=$1
    local input=$2
    local expected=$3
    
    echo "Запуск теста: $test_name"
    echo "Входные данные: $input"
    
    output=$(./DO $input 2>&1)
    local exit_code=$?
    
    if [ "$output" = "$expected" ]; then
        echo "✅ Тест '$test_name' пройден успешно"
        return 0
    else
        echo "❌ Тест '$test_name' не пройден"
        echo "Ожидаемый результат: '$expected'"
        echo "Полученный результат: '$output'"
        return 1
    fi
}

if [ ! -f "./DO" ]; then
    echo "❌ Приложение не найдено. Убедитесь, что оно собрано."
    exit 1
fi

all_passed=true

echo "=== Блок 1: Тестирование корректных входных данных ==="

run_test "1.1 Тест case 1" "1" "Learning to Linux" || all_passed=false

run_test "1.2 Тест case 2" "2" "Learning to work with Network" || all_passed=false

run_test "1.3 Тест case 3" "3" "Learning to Monitoring" || all_passed=false

run_test "1.4 Тест case 4" "4" "Learning to extra Monitoring" || all_passed=false

run_test "1.5 Тест case 5" "5" "Learning to Docker" || all_passed=false

run_test "1.6 Тест case 6" "6" "Learning to CI/CD" || all_passed=false

echo -e "\n=== Блок 2: Тестирование обработки ошибок ==="

run_test "2.1 Тест без аргументов" "" "Bad number of arguments!" || all_passed=false

run_test "2.2 Тест неверного номера" "7" "Bad number!" || all_passed=false

run_test "2.3 Тест нечислового ввода" "abc" "Bad number!" || all_passed=false

echo -e "\n=== Итоговый результат ==="

if [ "$all_passed" = true ]; then
    echo "✅ Все тесты пройдены успешно!"
    exit 0
else
    echo "❌ Некоторые тесты не пройдены!"
    exit 1
fi 
