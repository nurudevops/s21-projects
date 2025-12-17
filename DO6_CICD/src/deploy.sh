#!/bin/bash

DEPLOY_HOST="10.201.174.113"
DEPLOY_USER="nuru"
SUDO_PASS="nuru"

if ! ssh -o StrictHostKeyChecking=no "$DEPLOY_USER@$DEPLOY_HOST" "echo 'Проверка соединения успешна'"; then
    echo " Ошибка: Не удалось подключиться к $DEPLOY_HOST"
    exit 1
fi

echo " Подготовка к копированию..."
if ! ssh -o StrictHostKeyChecking=no "$DEPLOY_USER@$DEPLOY_HOST" "mkdir -p ~/temp_deploy"; then
    echo " Ошибка: Не удалось создать временную директорию"
    exit 1
fi

echo " Копирование файлов на $DEPLOY_HOST..."
if ! scp -o StrictHostKeyChecking=no ./DO "$DEPLOY_USER@$DEPLOY_HOST:~/temp_deploy/"; then
    echo " Ошибка: Не удалось скопировать файлы"
    exit 1
fi

echo " Установка файла в /usr/local/bin..."
if ! ssh -o StrictHostKeyChecking=no "$DEPLOY_USER@$DEPLOY_HOST" "echo '$SUDO_PASS' | sudo -S mv ~/temp_deploy/DO /usr/local/bin/ && echo '$SUDO_PASS' | sudo -S chmod +x /usr/local/bin/DO && rm -rf ~/temp_deploy"; then
    echo " Ошибка: Не удалось установить файл"
    exit 1
fi

echo "✅ Проверка установки..."
if ! ssh -o StrictHostKeyChecking=no "$DEPLOY_USER@$DEPLOY_HOST" "test -x /usr/local/bin/DO"; then
    echo " Ошибка: Файл не найден или не имеет прав на выполнение"
    exit 1
fi

echo "✅ Деплой успешно завершен!"
exit 0
