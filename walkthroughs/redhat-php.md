`yum install libxml2-devel`

`wget -0 php-NN.tar.gz php-source-from-download-mirror`

`gunzip php-NN.tar.gz`

`tar -xf php-NN.tar`

`cd ../php-NN`

`./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-zlib --with-curl`

`make`

`make install`

`cp php.ini-development /usr/local/lib/php.ini`

`vim /usr/local/apache2/conf/httpd.conf`

and add:

```
LoadModule php7_module modules/libphp7.so

<FilesMatch \.php$>
    SetHandler application/x-httpd-php
</FilesMatch>

```

## References

http://php.net/manual/en/install.unix.apache2.php

https://wpguru.co.uk/2016/11/how-to-install-php-from-source-on-centos/

https://dev.mysql.com/doc/apis-php/en/apis-php-mysqlnd.install.html

https://stackoverflow.com/questions/42970888/about-php-configure-with-zlib-dir-and-with-zlib-dir-dir
