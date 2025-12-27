#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

number=$1

if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Argument must be a positive integer"
    exit 1
fi

middle=$((number / 2))

mult=1
for ((i=1; i<=middle; i++)); do
    mult=$((mult * i))
done

sum=0
if [ $((number % 2)) -eq 1 ]; then
    for ((i=middle+2; i<=number; i++)); do
        sum=$((sum + i))
    done
else
    for ((i=middle+1; i<=number; i++)); do
        sum=$((sum + i))
    done
fi

echo "mult: $mult"
echo "sum: $sum"