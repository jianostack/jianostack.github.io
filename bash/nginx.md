## Per site

```
server {
        server_name example.com;
        root /home/ubuntu/example;
        index index.php;  

        location = /favicon.ico {
                log_not_found off;
                access_log off;
        }

        location = /robots.txt {
                allow all;
                log_not_found off;
                access_log off;
        }

        location / {
                # This is cool because no php is touched for static content.
                # include the "?$args" part so non-default permalinks doesn't break when using query string
                try_files $uri $uri/ /index.php?$args;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/run/php/php7.2-fpm.sock;
        }

        location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
                expires max;
                log_not_found off;
        }

        error_log  /var/log/nginx/example.com-error.log error;

        # Deny all attempts to access hidden files such as .htaccess, .htpasswd, .DS_Store (Mac).
        # Keep logging the requests to parse later (or to pass to firewall utilities such as fail2ban)
        location ~ /\. {
                deny all;
        }

        # Deny access to any files with a .php extension in the uploads directory
        # Works in sub-directory installs and also in multisite network
        # Keep logging the requests to parse later (or to pass to firewall utilities such as fail2ban)
        location ~* /(?:uploads|files)/.*\.php$ {
                deny all;
        }
}
```
