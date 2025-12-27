#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <url> <browser_name> <browser_version>"
    exit 1
fi

url=$1
browser_name=$2
browser_version=$3

if ! [[ "$url" =~ ^https?://[a-zA-Z0-9.-]+:[0-9]+ ]]; then
    echo "Error: Invalid URL format"
    exit 1
fi

echo "Запуск теста на Selenium Grid..."
echo "URL: $url"
echo "Browser: $browser_name"
echo "Version: $browser_version"

echo "Результаты выполнения тестов:"