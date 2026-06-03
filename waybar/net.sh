#!/bin/bash

interface=$(ip route | grep default | awk '{print $5}')

rx_prev=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx_prev=$(cat /sys/class/net/$interface/statistics/tx_bytes)

while true; do
  sleep 1

  rx_now=$(cat /sys/class/net/$interface/statistics/rx_bytes)
  tx_now=$(cat /sys/class/net/$interface/statistics/tx_bytes)

  rx_rate=$(( (rx_now - rx_prev) / 1024 ))
  tx_rate=$(( (tx_now - tx_prev) / 1024 ))

  echo "⬇ ${rx_rate}KB ⬆ ${tx_rate}KB"

  rx_prev=$rx_now
  tx_prev=$tx_now
done
