#!/bin/bash

# Путь к файлу логов
LOG_FILE="logs/Yersultan_Ussenkan_system_report.log"

{
    echo "=================================================="
    echo "SYSTEM REPORT"
    echo "Student: Ussenkan Yersultan"
    echo "Date and Time: $(date)"
    echo "Current Username: $(whoami)"
    echo "--------------------------------------------------"
    echo "Operating System & Kernel:"
    uname -a
    echo "--------------------------------------------------"
    echo "CPU Information:"
    sysctl -n machdep.cpu.brand_string
    echo "--------------------------------------------------"
    echo "Memory Information:"
    vm_stat
    echo "--------------------------------------------------"
    echo "Disk Usage:"
    df -h
    echo "=================================================="
    echo ""
} >> "$LOG_FILE"

cat "$LOG_FILE"