#!/bin/bash

echo "============================================================"
echo "System Monitoring Report - $(date)"
echo "============================================================"

# ---------------- CPU USAGE ----------------
echo ""
echo "Total CPU Usage:"

CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $4}' | awk '{print $1}')
CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)

echo "   CPU Used: ${CPU_USAGE}%"

# ---------------- MEMORY USAGE ----------------
echo ""
echo "Memory Usage:"

read TOTAL USED FREE <<< $(free -m | awk '/^Mem:/ {print $2, $3, $4}')
MEM_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($USED/$TOTAL)*100}")
FREE_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($FREE/$TOTAL)*100}")

echo "   Total: ${TOTAL} MB"
echo "   Used:  ${USED} MB (${MEM_PERCENT}%)"
echo "   Free:  ${FREE} MB (${FREE_PERCENT}%)"

# ---------------- DISK USAGE ----------------
echo ""
echo "🔹 Disk Usage (/ partition):"

read DISK_TOTAL DISK_USED DISK_FREE DISK_PERCENT <<< $(df -h / | awk 'NR==2 {print $2, $3, $4, $5}')

echo "   Total: ${DISK_TOTAL}"
echo "   Used:  ${DISK_USED} (${DISK_PERCENT})"
echo "   Free:  ${DISK_FREE}"

# ---------------- TOP 5 PROCESSES BY CPU ----------------
echo ""
echo "Top 5 Processes by CPU Usage:"
printf "%-8s %-25s %-10s\n" "PID" "COMMAND" "CPU %"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# ---------------- TOP 5 PROCESSES BY MEMORY ----------------
echo ""
echo "Top 5 Processes by Memory Usage:"
printf "%-8s %-25s %-10s\n" "PID" "COMMAND" "MEM %"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo ""
echo "============================================================"

