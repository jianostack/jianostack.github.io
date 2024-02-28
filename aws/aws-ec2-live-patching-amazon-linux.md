## Live Patching in Amazon Linux 2

Setup:

```
sudo yum install -y yum-plugin-kernel-livepatch
sudo yum kernel-livepatch enable -y
sudo systemctl enable kpatch.service
sudo amazon-linux-extras enable livepatch
yum check-update kernel
yum updateinfo list
sudo yum update --security
kpatch list
yum kernel-livepatch supported
```

Reboot :
After 3 months we still need to reboot.
```
sudo yum install -y kernel
sudo reboot
yum kernel-livepatch supported
```

https://aws.amazon.com/amazon-linux-2/faqs/

