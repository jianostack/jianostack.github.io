#! /bin/bash
#
# remove bind-address 127.0.0.1 in /etc/mysql/my.cnf


printf "\n\n\n sudo timedatectl set-timezone Asia/Singapore \n\n\n"
sudo timedatectl set-timezone Asia/Singapore
sudo service rsyslog restart

printf "\n\n\n sudo apt-get install -y mysql-server \n\n\n"
sudo apt-get install -y mysql-server

printf "\n\n\n sudo service mysql restart \n\n\n "
sudo service mysql restart