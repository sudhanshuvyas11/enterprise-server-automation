#!/bin/bash

# ==========================================
# Script: Enterprise System Health Monitor
# Description: Logs CPU, RAM, and Disk Usage
# Author: [Aapka Naam Yahan Likhein]
# ==========================================

# Set Variables
LOG_FILE="/opt/server-suite/logs/system_health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Start Logging
echo "==========================================" >> $LOG_FILE
echo "System Audit Time: $TIMESTAMP" >> $LOG_FILE

# 1. Check RAM Usage 
echo "[MEMORY USAGE]" >> $LOG_FILE
free -h | awk 'NR==2{print "Total: " $2 ", Used: " $3 ", Free: " $4}' >> $LOG_FILE

# 2. Check Root Disk Space 
echo "[DISK USAGE]" >> $LOG_FILE
df -h / | awk 'NR==2{print "Total: " $2 ", Used: " $3 " (" $5 "), Free: " $4}' >> $LOG_FILE

# 3. Check CPU Load 
echo "[CPU LOAD]" >> $LOG_FILE
uptime | awk -F'load average:' '{ print "Load Average (1m, 5m, 15m):" $2 }' >> $LOG_FILE

echo "Audit Complete." >> $LOG_FILE
echo "==========================================" >> $LOG_FILE
