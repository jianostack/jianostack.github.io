## Create SSL cert
Output pem only

sudo certbot certonly \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --agree-tos \
    --manual \
    --preferred-challenges dns \
    -d example.com \
    -d www.example.com

https://dev.to/hamishclulee/wildcard-subdomains-on-digitalocean-using-express-and-nginx-with-let-s-encrypt-for-ssl-415b

## PEM to cert 
sudo openssl crl2pkcs7 -nocrl -certfile fullchain.pem | openssl pkcs7 -print_certs -out cert.crt

## PEM to key
sudo openssl pkey -in fullchain.pem -out server.key


