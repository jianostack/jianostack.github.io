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


## AWS CLI Service discovery already exists
`aws servicediscovery list-services`
`aws servicediscovery delete-service --id "xxx"`

## Cross-account permissions for SNS
You can use a Lambda function in one AWS account to subscribe to an Amazon SNS topic in a separate AWS account.

https://docs.aws.amazon.com/en_us/lambda/latest/dg/with-sns-example.html
