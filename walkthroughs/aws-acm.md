# ACM PCA (Amazon cert manager private cert authority)

Create a CA 

Request a new private certificate. This will give you PEM, private key and cert chain.

Use the following to decrypt the private key:
`openssl rsa -in private_key.txt -out server.key`

The Certficate.txt can be renamed to server.pem or server.crt

https://serverfault.com/questions/9708/what-is-a-pem-file-and-how-does-it-differ-from-other-openssl-generated-key-file
