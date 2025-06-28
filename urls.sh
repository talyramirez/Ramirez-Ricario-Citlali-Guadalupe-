#!/bin/bash

#
declare -a urls=("https://www.google.com" "https://www.github.com" "https://www.microsoft.com")

#
file=$(mktemp)
printf "%s\n" "$(date)" > "$file"

#
for url in "${urls[@]}"; do
    status=$(curl -m 10 -s -o /dev/null -w "%{http_code}" "$url")
    printf "%s,%s\n" "$url" "$status" >> "$file"
done

#
column -s , -t "$file"


rm -f "$file"
