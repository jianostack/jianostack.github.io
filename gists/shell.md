## find file in linux

`find / -name httpd.conf 2>/dev/null`

## Unattended-upgrades Ubuntu

Choose internet site and enter the email you want to send with:

`sudo apt install unattended-upgrades apt-listchanges bsd-mailx`

Enable:

`sudo dpkg-reconfigure -plow unattended-upgrades`

Edit the config file:

`sudo vim /etc/apt/apt.conf.d/50unattended-upgrades`

```
Unattended-Upgrade::Mail "mail@example.com";
Unattended-Upgrade::MailOnlyOnError "true";
Unattended-Upgrade::Automatic-Reboot "true"; 
Unattended-Upgrade::Automatic-Reboot-Time "05:00"; 
```

Dry run:

`sudo unattended-upgrades --dry-run`

## Kernel Live Patching on Amazon Linux 2 

See live-patching-amazon-linux.md 

## No more filezilla
sftp

## Hostname
sudo hostnamectl set-hostname NEW_HOSTNAME

## Switch user
sudo su

## Use user
sudo -u username

## Add user
sudo adduser

## Del user
sudo deluser

## Reset user pw
sudo passwd

## Find apt-get processes
ps aux | grep apt

## Kill process
kill processnumber

kill -9 processnumber

## network monitor
nettop -nc

## repeat command every 2secs
watch -n 2 df -h

## iterm tmux
tmux -CC

## List files and their sizeasdfa
du -sh *

## Processes
htop

## compress
tar -zcvf archive_name.tar.gz folder_to_compress

## extract
tar -zxvf archive_name.tar.gz

## php info
php -i

## list mysql connections
ps aux | grep mysql

## rpm list installed package
rpm -qlp telnet-server-1.2-137.1.i586.rpm

## rpmbuild from tarballs
rpmbuild -tb httpd-2.4.x.tar.bz2

## rsync source to destination
rsync -arzP /source/directory user@host:/target/directory

## check open ports
nmap localhost

## open port
nc -l 443

## What ports are open and who is accessing
sudo ufw status

## add ip to firewall port
sudo ufw allow from 15.15.15.51 to any port 22

## open firewall ports
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT

## free port and kill process
sudo fuser -k Port_Number/tcp

## who is apache user and group
ps aux | egrep '(apache|httpd)'
apache2ctl -t -D DUMP_RUN_CFG

## host A record
host -a example.com

## system info
`lscpu`

## Check Operating System (OS)
`hostnamectl`

## rebuild spotlight index
sudo mdutil -E /

## zip encrypt
zip -er name.zip directory/*

## GREP (Globally search a Regular Expression and Print)
`grep search-a-term-or-a-file-name /in/this/directory`
`grep backupd /var/log/syslog`
`grep backupd /var/log/system.log`

## Find IP address
ifconfig

## find pecl inside current dir
ls -l | grep pecl

## copy from server
scp

## temperature
cat /sys/class/thermal/thermal_zone*/temp

## nodejs logging
node bin/www > my_app_log.log 2> my_app_err.log

## name servers lookup
nslookup google.com

## sym link
ln -s /full/source/path/wp-content /full/link/path/wordpress

## age of system
tune2fs -l /dev/sda1 | grep created

## process id of
pidof name-of-process

## DNS information groper
```
dig
```

## Run commands in the background
```
your_command > /dev/null 2>&1 &
jobs -l
```

## HDD disk space
```
df -h
```

## Linux header 
How to clear apt cache in /usr/src
```
sudo apt-get autoremove
```

## cron job logs
```
Ubuntu: `grep CRON /var/log/syslog`
```

## what is using my port - mac
```
lsof -i tcp:22000 
```

## What a token references, you can use the type
```
type php
```

## What operating system
```
uname -a
```
