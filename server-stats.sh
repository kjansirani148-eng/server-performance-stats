#!/bin/bash

echo "========================================"
echo "       SERVER PERFORMANCE STATS"
echo "========================================"

echo ""
echo "CPU USAGE"
echo "----------------------------------------"

CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}')
echo "Total CPU Usage: ${CPU_USAGE}%"

echo ""
echo "MEMORY USAGE"
echo "----------------------------------------"

TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')
USED_MEM=$(free -m | awk '/Mem:/ {print $3}')
FREE_MEM=$(free -m | awk '/Mem:/ {print $4}')

MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($USED_MEM/$TOTAL_MEM)*100}")

echo "Total Memory : ${TOTAL_MEM} MB"
echo "Used Memory  : ${USED_MEM} MB"
echo "Free Memory  : ${FREE_MEM} MB"
echo "Memory Usage : ${MEM_PERCENT}%"

echo ""
echo "DISK USAGE"
echo "----------------------------------------"

df -h /

echo ""
echo "TOP 5 PROCESSES BY CPU"
echo "----------------------------------------"

ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo ""
echo "TOP 5 PROCESSES BY MEMORY"
echo "----------------------------------------"

ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo ""
echo "OS VERSION"
echo "----------------------------------------"

grep PRETTY_NAME /etc/os-release

echo ""
echo "SERVER UPTIME"
echo "----------------------------------------"

uptime -p

echo ""
echo "LOGGED-IN USERS"
echo "----------------------------------------"

who

echo ""
echo "========================================"
echo "       END OF REPORT"
echo "========================================"