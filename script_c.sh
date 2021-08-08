#!/bin/bash
# Script for creating file sysinfo.txt with info about hostname, cpu cores number, total memory and total disk space.

# Just using variable hostname to get HOSTNAME.
#VARIABLES
FILE=sysinfo.txt
HOSTNAME=`hostname`
# For CPU_Cores using filtering /proc/spuinfo with uniq and parsing with awk to get only digital value.
CPU_Cores=$(grep 'cpu cores' /proc/cpuinfo | uniq | awk -F: '{print $2}')
# parsing output fo command free -m and parsing with awk, choosing as fist param "Mem:" and display only value
Total_Memory=$(free -m | awk '$1=="Mem:" {print $2}')
#Parsing with awk output for /proc/partitions for only sda, sdb ... sdz, formating output and second parsing with awk for get only value. 
Total_Disk_Size=$(awk '/sd[a-z]$/{printf "%s %8.2f GiB\n", $NF, $(NF-1) / 1024 / 1024} ' /proc/partitions | awk '$1=="sda" {print $2, $3}')

#Creating file and fill with info.
touch sysinfo.txt
echo `date` > sysinfo.txt
echo "HOSTNAME="$HOSTNAME >> sysinfo.txt
echo "CPU Cores="$CPU_Cores >> sysinfo.txt
echo "Total Memoty="$Total_Memory >> sysinfo.txt
echo "Total Disk Siza="$Total_Disk_Size >> sysinfo.txt
echo "Script job compleated. File $FILE created."

