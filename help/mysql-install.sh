# MySQL install 

sudo apt install -y mysql-server

# The auth_socket plugin authenticates users that connect from the localhost through the Unix socket file. This means that you can’t authenticate as root by providing a password.
# https://linuxize.com/post/how-to-install-mysql-on-ubuntu-18-04/
sudo mysql_secure_installation

sudo mysql

# remove bind-address 127.0.0.1 
sudo vim /etc/mysql/my.cnf
