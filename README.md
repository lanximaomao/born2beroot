# born2beroot

Installation - Sudo
  install: $ apt install sudo
  login as root: $ su -
  change sudo config: $ sudo visudo
  
Installation - UFW 
  install: $ sudo apt install ufw
  verify whether it is successfully installed: $ dpkg -l | grep ufw
  enable: $ sudo ufw enable
  disable: $ sudo ufw disable
  reset: $ sudo ufw reset
  allow incoming connections using certain port: $ sudo ufw allow 4242
  deny incoming connections using certain port: $ sudo ufw deny 4242
  check ufw status: $ sudo ufw status

Installation - install vim and SSH
  install vim: $ sudo apt install vim
  ssh: $ sudo apt install openssh-server
  check ssh server status: $ sudo systemctl status ssh
  restart: $ service ssh restart
  change ssh configuration: $ sudo vim /etc/ssh/sshd_config
  -- sudo ufw status numbered
  -- sudo ufw delete 2
  
User management - Password policy
  setting up a strong password policy: $ sudo vi /etc/login.defs
  setting up password strength: $ sudo apt install libpam-pwquality
  verify libpam is successfully installed: $ dpkg -l | grep libpam-pwquality
  configuration: $ sudo vi /etc/pam.d/common-password

User management - creating new user and user group
  create a new user: $ sudo adduser lsun
  check if a user is successfully created: $ getent passwd lsun
  create a new usergroup called user42: $ sudo addgroup user42
  add the user lsun into a usergroup user42: $ sudo adduser lsun user42
  add a user into sudo group: $ adduser <username> sudo
  check if user in sudo group: $ getent group sudo
  Verify newly-created user's password expiry information: $ sudo chage -l <username>

Setup a cron job
  config cron as root: $ sudo crontab -u root -e
  schedule a shell script to run every 10 minutes: */10 * * * * sh /path/to/script
  check root's scheduled cron jobs: $ sudo crontab -u root -l

Change in files - sudo visudo 

Defaults        env_reset
Defaults        mail_badpass
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
Defaults        passwd_tries=3
Defaults        badpass_message="Bad passowrd, please try again!"
Defaults        iolog_dir="/var/log/sudo/"
Defaults        log_input,log_output
Defaults        requiretty

Change in files - vim /etc/ssh/sshd_config
Port 4242 
PermitRootLgin no

Change in files - vim /etc/ssh/ssh_config
Port 4242 

Change in files - sudo vi /etc/login.defs
PASS_MAX_DAYS 30
PASS_MIN_DAYS 2
PASS_WARN_AGE 7

Change in files - sudo vi /etc/pam.d/common-password
password        requisite                       pam_pwquality.so retry=3 minlen=10 ucredit=-1 lcredit=-1 dcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root

Evaluation:
| 1) lsblk                              1 <- Check partitions
| 2) sudo aa-status                     2 <- AppArmor status
| 3) getent group sudo                  3 <- sudo group users
| 4) getent group user42                4 <- user42 group users
| 5) sudo service ssh status            5 <- ssh status, yep
| 6) sudo ufw status                    6 <- ufw status
| 7) ssh username@ipadress -p 4242      7 <- connect to VM from your host (physical) machine via SSH
| 8) vim /etc/sudoers.d/<filename>      8 <- yes, sudo config file. You can $ ls /etc/sudoers.d first
| 9) vim /etc/login.defs                9 <- password expire policy
| 10) vim /etc/pam.d/common-password   10 <- password policy
| 11) sudo crontab -l                  11 <- cron schedule

How to check a hostname:  
$ hostnamectl --static set-hostname new_hostname 
or
$ sudo vim /etc/hostname 
or
$ sudo vim /etc/hosts)
                                                                        
change here: /etc/network/interfaces to remove the #.                                                            

                                            
Other useful commands:
Sudo dhclient -r
Sudo dhclient
Ip a
shasum Debian.vdi
changing password: passwd

Study resources:
crontab: https://www.ibm.com/docs/en/aix/7.2?topic=c-crontab-command
DHCP - dynamic host configuration protocol: https://www.efficientip.com/what-is-dhcp-and-why-is-it-important/
use libpam-pwquality for enforcing password policy: https://www.ibm.com/docs/en/psfa/7.2.1?topic=reuse-password-content-controls
                                             
                                   
