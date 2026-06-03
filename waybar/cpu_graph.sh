#!/bin/bash

while true; do
  cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
  bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
  index=$(echo "$cpu/12" | bc)

  echo "${bars[$index]} ${cpu}%"
  sleep 1
done
