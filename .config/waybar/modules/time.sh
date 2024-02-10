#!/bin/bash
timez=$(date +%R)
time=$(date +%H:%M:%S)
utc=$(date -u +%H:%M:%S)
echo -e "{\"text\":\"$timez\", \"tooltip\": \"$time | UTC: $utc\"}"
