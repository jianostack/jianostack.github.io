#! /bin/bash
# azure-cli, nodejs-legacy, npm, zip

echo "sudo apt-get update"
sudo apt-get update

echo "sudo apt-get install nodejs-legacy"
sudo apt-get install -y nodejs-legacy

echo "sudo apt-get install npm"
sudo apt-get install -y npm

echo "sudo npm install azure-cli -g"
sudo npm install -y azure-cli -g

echo "sudo apt-get install zip"
sudo apt-get install -y zip
