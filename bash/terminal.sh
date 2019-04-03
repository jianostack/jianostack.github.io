#terminal cheat sheet

#switch user
sudo su

#use user
sudo -u

#newuser
sudo adduser

#deluser
sudo deluser

#reset user pw
sudo passwd

#find apt-get processes
ps aux | grep apt

#kill process
kill processnumber
#or
kill -9 processnumber

#network monitor
nettop -nc

#repeat command every 2secs
watch -n 2 df -h

#iterm tmux
tmux -CC

# disk space
df -h

# List files and their sizeasdfa
du -sh *

# Processes
htop

# compress
tar -zcvf archive_name.tar.gz folder_to_compress

# extract
tar -zxvf archive_name.tar.gz

#php info
php -i

#list mysql connections
ps aux | grep mysql

#rpm list installed package
rpm -qlp telnet-server-1.2-137.1.i586.rpm

#rpmbuild from tarballs
rpmbuild -tb httpd-2.4.x.tar.bz2

#rsync symlinks
rsync -avzP

#rsync source to destination
rsync -arzP /source/directory user@host:/target/directory

#check open ports
nmap localhost

#open port
nc -l 443

# free port and kill process
sudo fuser -k Port_Number/tcp

#open firewall ports
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT

#who is apache user and group
ps aux | egrep '(apache|httpd)'
apache2ctl -t -D DUMP_RUN_CFG

# upgrade
# https://askubuntu.com/questions/194/how-can-i-install-just-security-updates-from-the-command-line
sudo unattended-upgrades -d
sudo reboot

# host A record
host -a example.com

# system info
# https://www.cyberciti.biz/faq/linux-command-to-find-the-system-configuration-and-hardware-information/
lscpu

#rebuild spotlight index
sudo mdutil -E /

# zip encrypt
zip -er name.zip directory/*

# GREP (Globally search a Regular Expression and Print)
grep search-a-term-or-a-file-name /in/this/directory
grep backupd /var/log/syslog
grep backupd /var/log/system.log

# Find IP address
ifconfig

# What ports are open and who is accessing
sudo ufw status

# add ip to firewall
sudo ufw allow from 15.15.15.51 to any port 22

# find pecl inside current dir
ls -l | grep pecl

#copy from server
scp

# temperature
# milidegrees celcius
cat /sys/class/thermal/thermal_zone*/temp
