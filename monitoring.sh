#!/bin/bash
# The architecture of your operating system and its kernel version.
# s for kernal name, r for kernel release and m for printing machine hardware name
# OS=$(hostnamectl | grep "Operating" | cut -b 21-)
# kernal_v=$(hostnamectl | grep "Kernel" | cut -b 21-)
arc=$(uname -a)
# The number of physical processors.
p_cpu=$(lscpu | grep "Socket" | cut -b 34-)
# The number of virtual processors.
v_cpu=$(lscpu | grep "CPU(s):" | head -1 | cut -b 34-)
# The current available RAM on your server and its utilization rate as a percentage.
mem_usage=$(free -m | awk 'NR==2 {printf "%s/%sMB (%.2f%%)", $3,$2, $3*100/$2}')
# The current available memory on your server and its utilization rate as a percentage.
# free_disk=$(df -Bm | grep "^/dev/" | grep -v "/boot" | awk '{fd += $3} END {printf(fd)}')
# total_disk=$(df -Bm | grep "^/dev/" | grep -v "/boot" | awk '{td += $2} END {printf(td)}')
p_disk=$(df -Bm | grep "^/dev/" | grep -v "/boot" | awk '{fd += $3} {td+=$2} END {printf("%d/%dMB (%.2f%%)", fd, td, fd/td*100)}')
# The current utilization rate of your processors as a percentage.
# vmstat | awk 'NR==3'or vmstat | sed -n '3p' both shows the third line from the output
# xargs for removing the space
cpu_load=$(vmstat | awk 'NR==3'|xargs|awk '{printf("%.1f%%", 100-$15)}')
# The date and time of the last reboot.
last_reboot=$(who -b | awk '{printf $3 " " $4}')
# Whether LVM is active or not.
lvm_use=$(lsblk | awk '$6 ~ /lvm/'|wc -l | awk '{if ($1 != "0") {print "Yes"} else {print "NO"}}')
# The number of active connections.
tcp_connect=$(ss -s | awk '/TCP:/ {printf("%d\n", $4)}')
# The number of users using the server.
# cut -d " " -f 1 means to display only the first field of information, which is delimited by a space
# sort -u is to sort only the unique values
user_log=$(who | cut -d " " -f 1 | sort -u | wc -l)
# The IPv4 address of your server and its MAC (Media Access Control) address.
network=$(hostname -I | awk '{print "IP " $1}')
mac_add=$(ip link show | awk '$1 == "link/ether" {print $2}')
# The number of commands executed with the sudo program.
sudo_comm=$(journalctl _COMM=sudo -q | grep COMMAND | wc -l)

wall "		#Architecture: $arc
		#CPU physical: $p_cpu
		#vCPU: $v_cpu
		#Memory Usage: $mem_usage
		#Disk Usage: $p_disk
		#CPU load: $cpu_load
		#Last boot: $last_reboot
		#LVM use: $lvm_use
		#Connection TCP: $tcp_connect ESTABLISHED
		#User log: $user_log
		#Network: $network ($mac_add)
		#Sudo: $sudo_comm cmd
	"
