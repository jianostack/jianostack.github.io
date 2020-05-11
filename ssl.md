# CSR PEM KEY 
https://serverfault.com/questions/9708/what-is-a-pem-file-and-how-does-it-differ-from-other-openssl-generated-key-file

# PEM to CRT
openssl x509 -outform der -in your-cert.pem -out your-cert.crt
