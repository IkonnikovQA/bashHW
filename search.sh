#!/bin/bash

file_path=""
search_string=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --file)
            file_path="$2"
            shift 2
            ;;
        --search)
            search_string="$2"
            shift 2
            ;;
        *)
            echo "Неизвестный параметр: $1"
            exit 1
            ;;
    esac
done

if [ -z "$file_path" ] || [ -z "$search_string" ]; then
    echo "Использование: $0 --file <путь к файлу> --search <строка для поиска>"
    exit 1
fi

if [ ! -f "$file_path" ]; then
    echo "Файл не существует: $file_path"
    exit 1
fi

absolute_path=$(realpath "$file_path")

count=$(grep -o "$search_string" "$file_path" | wc -l)

if [ "$count" -eq 0 ]; then
    echo "Не найдено ни одного совпадения в файле $absolute_path"
else
    echo "$count"
fi