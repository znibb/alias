#!/bin/bash
# Display RPi CPU temp

cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "Temp=$((cpu/1000))'C"
