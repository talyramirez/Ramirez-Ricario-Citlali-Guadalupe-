#! /bint/bash

declare -a urls=( "https://www.redhat.com" "https://www.oracle.com" "https://www.ibm.com")

file=urls2.log

while true; do
  printf "$(date)\n" > "$file" 
for url in "${urls[@]}"; do
          status=$(curl -m 10 -s -I $url | head -n 1 | awk '{print $2}')
          printf "$url,$status\n" >> "$file"
done
column -s, -t "$file" 
#rm -f "$file"
sleep 10
done
