# bitnami-apps-vhosts.conf

sudo vim /opt/bitnami/apache2/conf/bitnami/bitnami-apps-vhosts.conf

# php-fpm.conf
sudo vim /opt/bitnami/php/etc/php-fpm.conf

# restart mysql
sudo /opt/bitnami/ctlscript.sh start 

sudo /opt/bitnami/ctlscript.sh start mysql 

sudo /opt/bitnami/ctlscript.sh restart mysql 

sudo /opt/bitnami/mysql/bin/mysqladmin -p -u root password 

# status
sudo /opt/bitnami/ctlscript.sh status 

# restart services
$ sudo /opt/bitnami/ctlscript.sh restart apache 

$ sudo /opt/bitnami/ctlscript.sh restart php-fpm 

$ sudo /opt/bitnami/ctlscript.sh restart mysql 