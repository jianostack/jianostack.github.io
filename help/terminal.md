## find file in linux

`find / -name "*.pem"`

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

## Kernel Live Patching on Debian Amazon Linux 2 

If you're on AWS you should use SSM Patch Manager!

```
sudo yum install -y yum-plugin-kernel-livepatch
sudo yum kernel-livepatch enable -y
sudo systemctl enable kpatch.service
sudo amazon-linux-extras enable livepatch
yum check-update kernel
yum updateinfo list
sudo yum update --security
kpatch list
yum kernel-livepatch supported
```

3 months reboot
```
sudo yum install -y kernel
sudo reboot
yum kernel-livepatch supported
```

https://aws.amazon.com/amazon-linux-2/faqs/

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

## Add sudo user admin
```
adduser name
passwd name
usermod -aG wheel name
id name
```
## add a existing user to existing group
```
usermod -a -G group user
```

## Del user
sudo deluser

## Reset user pw
sudo passwd

## Find apt-get processes
ps aux | grep apt

## Kill process
kill processnumber

## network monitor
nettop -nc

## repeat command every 2secs
watch -n 2 df -h

## iterm tmux
tmux -CC

## Processes
`top`
pause top
`ctrl+S`

## compress
`tar -zcvf archive_name.tar.gz folder_to_compress`

## extract
`tar -zxvf archive_name.tar.gz`

## extract tar uncompressed
`tar -xf archive.tar`

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

## host DNS
host -a example.com

## system info
`lscpu`

## Check Operating System (OS)
`hostnamectl`

## rebuild spotlight index
sudo mdutil -E /

### zip encrypt
zip -er name.zip directory/*

### grep a file
```
grep backupd /var/log/system.log
```

### grep a directory
```
grep -r "hello" .
```

## Find local IP address
```
ifconfig eth0
ipconfig getifaddr en0
ip a
```

## Find WAN IP address
`curl ipinfo.io`


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

Background jobs or detach process from foreground
`your_command &`

List jobs
`jobs`

Kill job
`kill %1`

## HDD disk space
`df -h`
`du -sh *`

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

## shebang
At the start of a shell script tell it where the shell environment lives. Partically important in containers.

```
#!/bin/bash
```

## Check localhost
```
curl -X GET localhost:8080
```

## Generate random 16 bit string
```
openssl rand -hex 16 
```

## Detach Screen
https://askubuntu.com/questions/124897/how-do-i-detach-a-screen-session-from-a-terminal

## traceroute
```
traceroute -I -e yourdomain.com
```

## last logged in users
`last`

## list file paths
`find /path/to/directory -type f`


## logs
`tail -f error.log`

## Processes on the system
`ps -A`

# CURL 
Your next REST api tool

### timeout
curl -m 

### Post request
curl -X POST

### Get request
curl -X GET

### data
curl -d

### username
curl -u

### header
curl -H

### view response
curl -i

### Verbose
curl -v 

### Follow redirects location
curl -L

### Proxy
curl --proxy proxy_url 'url'

### SSL details
curl -Iv https://example.com -L

## ignore cert
curl -vk https://cdn -H 'Host:example.com'

## which binary
To search the location of a binary
`which aws`

## MACOS check timezone
`sudo systemsetup -gettimezone`

## MACOS hidden files
`cmd+shift+.`

## MACOS clear DNS cache 
```
sudo killall -HUP mDNSResponder
```

## MACOS paths
`/etc/paths.d`

