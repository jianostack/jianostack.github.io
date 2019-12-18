sudo apt update

# apache
sudo apt install apache2
sudo a2enmod rewrite
sudo service apache2 restart

## nginx
sudo apt install nginx

## packages
sudo apt install -y git zip unzip composer php php-cli php-fpm php-mysql php-json php-opcache php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip

# apache - server hardening
cat <<EOF >>/etc/apache2/apache2.conf
ServerSignature Off
ServerTokens Prod
TraceEnable off
EOF
sudo service apache2 restart
