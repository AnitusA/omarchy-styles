#!/bin/bash

while true; do
  used=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100.0}')
  echo "🧠 ${used}%"
  sleep 2
done
