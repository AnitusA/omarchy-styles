#!/bin/bash

usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

index=$(printf "%.0f" $(echo "$usage / 12.5" | bc -l))
echo "${bars[$index]}"
