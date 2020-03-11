# EC2 hardening
You should apply this to your AWS production cluster.

## Stay relevant
`yum update`

## Port 22
Close port 22 from jump server security group.

## TCP timestamp response
Disable TCP timestamp responses on Linux
Set the value of net.ipv4.tcp_timestamps to 0 by running the following command:
`sysctl -w net.ipv4.tcp_timestamps=0`

Additionally, put the following value in the default sysctl configuration file, generally sysctl.conf:
`net.ipv4.tcp_timestamps=0`

## SSH Server CBC Mode Ciphers Enabled
First check which ciphers are supported by your instances. You can do that by using the following command.

`sudo sshd -T | grep "\(ciphers\)"`

Below is a sample output.

ciphers chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-cbc,aes256-cbc,blowfish-cbc,cast128-cbc,3des-cbc

You can see that there are ciphers ending with "cbc", these are the CBC ciphers and the cipher ending with "ctr" are CTR ciphers. To enforce CTR encryption, you need to add the below line at the end of the /etc/ssh/sshd_config file.

`vim /etc/ssh/sshd_config`
`Ciphers aes256-ctr,aes192-ctr,aes128-ctr`

Reload the sshd service by using following command.

`sudo service sshd reload`

You can also confirm that CBC ciphers are disabled, by SSH to the instance with the below command. You should get "Unable to negotiate" error.

`ssh -i "your-sshkey.pem" user@your-instance-ip -c aes128-cbc,aes128-cbc,aes192-cbc`

## ICMP redirection enabled (linux-icmp- redirect)
These settings can be added to /etc/sysctl.conf to make them permanent.
```
vim /etc/sysctl.conf

net.ipv4.conf.all.accept_redirects=0 
net.ipv4.conf.default.accept_redirects=0
net.ipv4.conf.all.secure_redirects=0
net.ipv4.conf.default.secure_redirects=0
```

## Anonymous root login is allowed (unix- anonymous-root-logins)
Remove all the entries in /etc/securetty except console, tty[0- 9]* and vc\\[0-9]*
`vim /etc/securetty`
