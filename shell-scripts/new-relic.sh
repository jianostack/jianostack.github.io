#! /bin/bash
# Install new relic agent on ubuntu

echo "\n\n\n newrelic source list \n\n\n"
sudo sh -c 'echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list'

echo "\n\n\n newrelic wget source \n\n\n"
wget -O- https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -

echo "\n\n\n sudo apt-get update \n\n\n"
sudo apt-get update

echo "\n\n\n sudo apt-get install -y newrelic-sysmond \n\n\n"
sudo apt-get install newrelic-sysmond

echo "\n\n\n sudo nrsysmond-config --set license_key= \n\n\n"
sudo nrsysmond-config --set license_key=

echo "\n\n\n sudo /etc/init.d/newrelic-sysmond start \n\n\n"
sudo /etc/init.d/newrelic-sysmond start