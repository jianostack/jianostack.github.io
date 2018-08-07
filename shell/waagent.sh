#! /bin/bash
# Upgrade the WALinuxAgent. Run as sudo. waagent

echo "\n"
echo "RUN THIS SCRIPT AS SUDO!!!!!!!!!"
echo "\n"
echo "Download waagent master"
echo "\n"
wget https://github.com/Azure/WALinuxAgent/archive/master.zip
echo "\n"
echo "Unzip the folder"
echo "\n"
unzip master.zip
echo "\n"
echo "Install setuptools if not available : wget https://bootstrap.pypa.io/ez_setup.py -O - | python"
echo "\n"
echo "cd WALinuxAgent-master"
echo "\n"
cd WALinuxAgent-master/
echo "\n"
echo "Install"
echo "\n"
python setup.py install
echo "\n"
echo "Restart walinuxagent"
echo "\n"
sudo service walinuxagent restart
echo "\n"
echo "Remove install dir and zip"
echo "\n"
rm -rf WALinuxAgent-master/ master.zip
echo "\n"
echo "check version"
echo "\n"
waagent -version