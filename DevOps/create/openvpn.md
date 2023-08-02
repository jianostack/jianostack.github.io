<!-- Space: DOS -->
<!-- Parent: Create -->

# Deploying an OpenVPN server on AWS

## Launch

Launch an EC2 instance and assign an elastic IP to it.

Allow port 443 in the security group for 0.0.0.0/0

## Install

`wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh`

- Protocol: tcp
- Port: 443
- DNS: 1.1.1.1

During the install it will ask you to create the initial profile to connect to the VPN. Please follow the naming convention project-user.ovpn

## Disable logs

`sudo vim /etc/openvpn/server/server.conf`

And change verb 3 to verb 0

Now restart the OpenVPN service:

`sudo systemctl restart openvpn-server@server.service`


---

References

https://github.com/Nyr/openvpn-install

https://notthebe.ee/blog/creating-your-own-vpn

