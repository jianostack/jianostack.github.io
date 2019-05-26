server {

  server_name example.com;
  root /home/ubuntu/example;
  index index.php;  

  access_log off;
  error_log  /var/log/nginx/example.com-error.log error;

  error_page 404 /index.php;

  location ~ \.php$ {
      fastcgi_split_path_info ^(.+\.php)(/.+)$;
      fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
      fastcgi_index index.php;
      include fastcgi_params;
  }

  location ~ /\.(?!well-known).* {
      deny all;
  }

  add_header X-Frame-Options "SAMEORIGIN";
  add_header X-XSS-Protection "1; mode=block";
  add_header X-Content-Type-Options "nosniff";

}