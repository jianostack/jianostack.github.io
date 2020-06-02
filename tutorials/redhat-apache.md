# redhat 7 apache upgrade

`sudo yum install epel-release -y`

`sudo yum install autoconf expat-devel libtool libnghttp2-devel pcre-devel -y`

```
curl -O -L https://github.com/apache/httpd/archive/2.4.33.tar.gz
curl -O -L https://github.com/apache/apr/archive/1.6.3.tar.gz
curl -O -L https://github.com/apache/apr-util/archive/1.6.1.tar.gz
```

```
tar -zxvf 2.4.33.tar.gz
tar -zxvf 1.6.3.tar.gz
tar -zxvf 1.6.1.tar.gz
```

```
cp -r apr-1.6.3 httpd-2.4.33/srclib/apr
cp -r apr-util-1.6.1 httpd-2.4.33/srclib/apr-util
```

`cd httpd-2.4.33`

`./buildconf`

`./configure --enable-ssl --enable-so --enable-http2 --with-mpm=event --with-included-apr --with-ssl=/usr/local/openssl --prefix=/usr/local/apache2`

## OpenSSL

If you get an error regarding Openssl version too low then here we go.

`cd /usr/local/src`

`sudo su`

`yum install wget`

`wget https://www.openssl.org/source/openssl-1.1.0h.tar.gz`

`tar -zxf openssl-1.1.0h.tar.gz`

`cd openssl-1.0.2a`

`./config`

`make`

`make test`

`make install`

`mv /usr/bin/openssl /root/`

`ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl`

`openssl version`

*** error while loading shared libraries: libcrypto.so.1.1 ***

```
cp /usr/local/lib64/libcrypto.so.1.1 /usr/lib64
cp /usr/local/lib64/libcrypto.a /usr/lib64
cp /usr/local/lib64/libssl.so /usr/lib64
```

```
cd /usr/lib64
ln -s libcrypto.so.1.1 libcrypto.so
ln -s libssl.so.1.1 libssl.so
```

`vim .bashrc`

and add an alias for openssl:

```
alias='/usr/local/bin/openssl'
```

`sudo ldconfig`

`openssl version`

## Back to apache

`cd ~/httpd-2.4.33`

`make`

`sudo make install`

```
cd ..
rm -rf 1.6.3.tar.gz 1.6.1.tar.gz 2.4.33.tar.gz apr-1.6.3 apr-util-1.6.1 httpd-2.4.33
```

`sudo vi /etc/profile.d/httpd.sh`

and paste there following contents:

```
pathmunge /usr/local/apache2/bin
```

`sudo vi /etc/systemd/system/httpd.service`

and paste there following contents:

```
[Unit]
Description=The Apache HTTP Server
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/apache2/bin/apachectl -k start
ExecReload=/usr/local/apache2/bin/apachectl -k graceful
ExecStop=/usr/local/apache2/bin/apachectl -k graceful-stop
PIDFile=/usr/local/apache2/logs/httpd.pid
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

`sudo systemctl daemon-reload`

`sudo systemctl start httpd`

`sudo systemctl enable httpd`

`chkconfig httpd on`

## References

https://blacksaildivision.com/how-to-install-apache-httpd-on-centos

https://syslint.com/blog/tutorial/how-to-upgrade-openssl-on-centos-7-or-rhel-7/

https://serverfault.com/questions/818445/error-while-loading-shared-libraries-libcrypto-so-1-1
