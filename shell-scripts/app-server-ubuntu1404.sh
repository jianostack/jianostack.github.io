#! /bin/bash
# App server Ubuntu 14.04 
# timezone, apache, php5.6 with libraries, git, unzip, htop, composer, certbot and server hardening.
#
# public key is not available: NO_PUBKEY
# https://askubuntu.com/questions/308760/w-gpg-error-http-ppa-launchpad-net-precise-release-the-following-signatures
#
# removing PPAs
# https://askubuntu.com/questions/307/how-can-ppas-be-removed
#
# hardening
# https://www.tecmint.com/apache-security-tips/
# https://geekflare.com/10-best-practices-to-secure-and-harden-your-apache-web-server/


echo '* Hello human'
echo '* I will install apache, php5.6 with libraries, git, unzip, htop, composer, certbot and server hardening'
echo '*'
echo '* BEFORE YOU START!'
echo '* Add ppa key'
echo '* https://askubuntu.com/questions/308760/w-gpg-error-http-ppa-launchpad-net-precise-release-the-following-signatures'
echo 'Do you want to break y/n?'
read INPUT_STRING
case $INPUT_STRING in
  n)
          echo "* continuing"
          ;;
  y)
          echo "bye!"
          break
          ;;
  *)
          echo "Sorry, I don't understand. I'm going to continue anyway."
          ;;
esac
echo

echo ' * sudo timedatectl set-timezone Asia/Singapore'
sudo timedatectl set-timezone Asia/Singapore
sudo service rsyslog restart

echo ' * sudo apt-get install -y python-software-properties'
sudo apt-get install -y python-software-properties
sudo apt-get update

echo ' * sudo apt-get install -y apache2'
sudo apt-get install -y apache2
echo ' * sudo a2enmod rewrite'
sudo a2enmod rewrite
sudo service apache2 restart

echo ' * sudo add-apt-repository ppa:ondrej/php'
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

printf "
 * libapache2-mod-php5.6
 * php5.6
 * php5.6-mysql 
 * php5.6-curl 
 * php5.6-json
 * php5.6-gd
 * php5.6-mbstring
 * php5.6-xml 
 * php5.6-zip
 "
sudo apt-get install -y php5.6 libapache2-mod-php5.6 php5.6-mysql php5.6-curl php5.6-json php5.6-gd php5.6-mbstring php5.6-xml php5.6-zip

echo ' * sudo apt-get install -y git'
sudo apt-get install -y git

echo ' * sudo apt-get install -y unzip'
sudo apt-get install -y unzip

echo ' * install composer'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

echo ' * Install certbot'
echo ' * Who are you?'
read whoami
wget https://dl.eff.org/certbot-auto
chmod a+x /home/$whoami/certbot-auto
chown root /home/$whoami/certbot-auto
sudo mv /home/$whoami/certbot-auto /opt/certbot-auto
cat <<EOF >> /home/$whoami/.bash_profile
alias certbot-auto='/opt/certbot-auto'
EOF
echo '* source .bash_profile'
source /home/$whoami/.bash_profile
sudo a2enmod ssl
sudo service apache2 restart
echo '* installing certbot-auto'
certbot-auto

echo ' * Server hardening'
cat <<EOF >>/etc/apache2/apache2.conf
ServerSignature Off
ServerTokens Prod
TraceEnable off
EOF
sudo service apache2 restart

echo '
██████╗  ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔═══██╗████╗  ██║██╔════╝
██║  ██║██║   ██║██╔██╗ ██║█████╗  
██║  ██║██║   ██║██║╚██╗██║██╔══╝  
██████╔╝╚██████╔╝██║ ╚████║███████╗
╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝
'
echo ' * What you need to do:'
echo ' '
echo ' 1. Create a crontab for certbot'
echo 'open crontab -e'
echo '0 0 * * * /opt/certbot-auto renew --quiet --no-self-upgrade'
echo ''
echo 'and'
echo './certbot-auto'