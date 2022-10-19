# Deploying an OpenVPN server on AWS

This tutorial is a modified version of [Wolfgang's](https://notthebe.ee/blog/creating-your-own-vpn).

Launch an EC2 instance and assign an elastic IP to it.

## Install
Head over to [Nyr/openvpn-install](https://github.com/Nyr/openvpn-install) repo to download the shell script and install OpenVPN.

Protocol: tcp

Port: 443

DNS: 1.1.1.1

It will spit out a config for us to download and connect to the VPN later.

Disable the logs:

`sudo vim /etc/openvpn/server/server.conf`

And change verb 3 to verb 0

Now restart the OpenVPN service:

`systemctl restart openvpn-server@server.service`

## Optional: Unattended upgrades

Choose internet site and enter the email you want to send with:

`sudo apt install unattended-upgrades apt-listchanges bsd-mailx`

Enable:

`sudo dpkg-reconfigure -plow unattended-upgrades`

Edit the config file:

`sudo vim /etc/apt/apt.conf.d/50unattended-upgrades`

```
Unattended-Upgrade::Mail "mail@example.com";
Unattended-Upgrade::MailOnlyOnError "true";
Unattended-Upgrade::Automatic-Reboot "true"; 
Unattended-Upgrade::Automatic-Reboot-Time "05:00"; 
```

Dry run:

`sudo unattended-upgrades --dry-run`
