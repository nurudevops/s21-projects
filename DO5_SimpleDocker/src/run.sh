#!/bin/bash

# Запускаем FastCGI-сервер в фоне
spawn-fcgi -p 8080 ./mini_server 

# Запускаем NGINX в foreground режиме
nginx -g 'daemon off;'
