#!/bin/bash

files=()
extension=""
replacement=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --file)
            files+=("$2")
            shift 2
            ;;
        --extension)
            extension="$2"
            shift 2
            ;;
        --replacement)
            replacement="$2"
            shift 2
            ;;
        *)
            echo "Неизвестный параметр: $1" >&2
            exit 1
            ;;
    esac
done

if [[ -z "$extension" ]] || [[ -z "$replacement" ]]; then
    echo "Ошибка: Необходимо указать --extension и --replacement" >&2
    exit 1
fi

for file in "${files[@]}"; do
    dir=$(dirname "$file")
    filename=$(basename "$file")

    if [[ "$filename" == *."$extension" ]]; then
        new_filename="${filename%.$extension}.$replacement"
        new_filepath="$dir/$new_filename"

        echo "$new_filepath"
    else
        echo "$file"
    fi
done