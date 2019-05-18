sudo apt update

sudo timedatectl set-timezone Asia/Singapore
sudo service rsyslog restart

sudo apt install nginx

sudo apt install -y apache2
sudo a2enmod rewrite
sudo service apache2 restart

sudo apt install -y php 
sudo apt install -y php-cli php-fpm php-mysql php-json php-opcache php-mbstring php-xml php-gd php-curl
sudo apt install -y git
sudo apt-get install -y unzip

# Server hardening
cat <<EOF >>/etc/apache2/apache2.conf
ServerSignature Off
ServerTokens Prod
TraceEnable off
EOF
sudo service apache2 restart

