
#The architecture of your operating system and its kernel version.
# s for kernal name, r for kernel release and m for printing machine hardware name
uname -srm
#• The number of physical processors.
lscpu | grep "Socket"
#• The number of virtual processors.
lscpu | grep "CPU(s):" | head -1
#• The current available RAM on your server and its utilization rate as a percentage.
free -h
cat /proc/meminfo | grep "MemTotal"
cat /proc/meminfo | grep "MemFree"
#• The current available memory on your server and its utilization rate as a percentage.

#• The current utilization rate of your processors as a percentage.
#• The date and time of the last reboot.
#• Whether LVM is active or not.
#• The number of active connections.
#• The number of users using the server.
#• The IPv4 address of your server and its MAC (Media Access Control) address.
hostname -I
#• The number of commands executed with the sudo program.

wall "	#Architecture: $arc
		#CPU physical: $cpu_p
		#vCPU: $vcpu
		#Memory Usage:
		#Disk Usage:
		#CPU load:
		#Last boot:
		#LVM use:
		#Connection TCP:
		#User log:
		#Network:
		#Sudo:
	"
