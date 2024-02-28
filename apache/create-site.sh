#! /bin/bash
# Ubuntu project setup

add_a_user() 
{
adduser $user

}

create_project()
{
mkdir $project_path
chown $user:www-data $project_path
chmod g+wrx $project_path
mkdir $project_path/www
chown -R $user:www-data $project_path/www
chmod -R g+wrx $project_path/www
}

add_a_site() 
{
cat <<EOF >/etc/apache2/sites-available/$project_name\.conf
<VirtualHost *:80>
  ServerName $userURL
  ServerAdmin $contact
  DocumentRoot $project_path/www

  ErrorLog \${APACHE_LOG_DIR}/$project_name-error.log
  CustomLog \${APACHE_LOG_DIR}/$project_name-access.log combined

  <Directory $project_path/www>
    AllowOverride All
    Require all granted
    Options -Indexes
  </Directory>

  setEnv DBHOST host
  setEnv DBNAME databasename
  setEnv DBUSER user
  setEnv DBPASS password  
</VirtualHost>
EOF

echo 'a2ensite'
a2dissite $project_name.conf
a2ensite $project_name.conf
echo 'apache2 restart'
service apache2 restart
}

create_a_key()
{
sudo -u $user ssh-keygen -t rsa -b 4096 -C "$contact"
eval "$(ssh-agent -s)"
ssh-add -k /home/$user/.ssh/id_rsa
git_user
}

create_wwwdata_key()
{
chown -R root:www-data /var/www
chmod -R g+wrx /var/www
sudo -u www-data ssh-keygen -t rsa -b 4096 -C "$contact"
eval "$(ssh-agent -s)"
ssh-add -k /var/www/.ssh/id_rsa
}

git_user()
{
echo 'Give this key access to the repo: '
echo ' ';
cat /home/$user/.ssh/id_rsa.pub
echo ' ';
echo ' ';
echo ' ';
echo ' ';
echo "Get ready to git clone!"
echo "What is the git url?"
read git_ssh_url
rm -r $project_path/www
sudo -u $user git clone $git_ssh_url $project_path/www
}

git_apache()
{

echo 'Give this key access to the repo: '
cat /var/www/.ssh/id_rsa.pub

echo "Get ready to git clone!"
echo "What is the git url?"
read git_ssh_url
rm -r $project_path/www
sudo -u www-data git clone $git_ssh_url $project_path/www
chown -R $user:www-data $project_path/www

}




# init
echo ' '
echo '/**'
echo ' * Get ready for your awesome project setup!'
echo ' *'
echo ' * What you need:'
echo ' * - sudo powers'
echo ' * - a domain name that is pointing to the server'
echo ' * - apache'
echo ' * - php'
echo " * - apache group is www-data"
echo ' '
echo ' * '
echo ' * What I do:'
echo ' * - add a new user'
echo ' * - add a new site'
echo ' * - create keys'
echo ' * - git clone'
echo ' */'
echo ' '

echo "Project name?"
read project_name
echo "Staging or production? s/p"
    read sp
    case $sp in
        [Ss]* ) environment=stg break;;
        [Pp]* ) environment=pro break;;
        * ) echo "Please answer s or p.";;
    esac


echo 'Who are you?'
read user
echo 'What is your email?'
read contact
echo "What is the URL?"
read userURL

echo "Create a new user?"
    read yn
    case $yn in
        [Yy]* ) add_a_user break;;
        [Nn]* ) create_project break;;
        * ) echo "Please answer y or n.";;
    esac

project_path="/home/$user/$project_name/$environment"
add_a_site


echo 'Do you need to create a new SSH key for www-data?'
read sshkey
case "$sshkey" in
  [yY]* ) create_wwwdata_key break;;
  [nN]* ) break;;
  * ) echo "wrong input. sudo deluser and sudo rm -rf homedir";;
esac

echo 'Is (U)ser or (A)pache controlling git?'
read gituser
case "$gituser" in
  [uU]* ) create_a_key break;;
  [aA]* ) git_apache break;;
  * ) echo "wrong input. sudo deluser and sudo rm -rf homedir";;
esac

echo 'done'
