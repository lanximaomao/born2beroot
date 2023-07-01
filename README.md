# <center>Born2beRoot - 42 school project</center>

## Description

For the Born2beRoot project, a server is settled up using the latest stable version of Debian. The server has:

- encrypted partitions using LVM
- SSH service running on port 4242 (with no root login)
- UFW configured to allow only port 4242
- a strong password policy enforced
- a monitoring script displaying information every 10 minutes at server startup.

More specifically, the monitoring script displays the following information:

- The architecture of your operating system and its kernel version.
- The number of physical processors.
- The number of virtual processors.
- The current available RAM on your server and its utilization rate as a percentage.
- The current available memory on your server and its utilization rate as a percentage.
- The current utilization rate of your processors as a percentage.
- The date and time of the last reboot.
- Whether LVM is active or not.
- The number of active connections.
- The number of users using the server.
- The IPv4 address of your server and its MAC (Media Access Control) address.
- The number of commands executed with the sudo program.

<br>

## Language used
[![Language used](https://skills.thijs.gg/icons?i=bash)](https://skills.thijs.gg)

<br>

## External resources

+ [Crontab](https://www.ibm.com/docs/en/aix/7.2?topic=c-crontab-command)
+ [DHCP](https://www.efficientip.com/what-is-dhcp-and-why-is-it-important/)
+ [libpam-pwquality password policy](https://www.ibm.com/docs/en/psfa/7.2.1?topic=reuse-password-content-controls)
