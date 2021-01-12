# Live Patching in Amazon Linux 2

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

---

# Disable Codepipeline auto trigger cloudwatch events for production
Via console 
`CloudWatch > Rules > disable`

Via CLI
`https://serverfault.com/questions/869484/temporarily-disable-aws-codepipeline`

No option to disable Bitbucket (codestar) webhooks connections.

---

# AWS CLI Service already exists
`aws servicediscovery list-services`
`aws servicediscovery delete-service --id "xxx"`

---

# Cloudwatch metrics
https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html

---

# Cloudwatch concepts
https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html

---

# To configure an Amazon SNS topic to use as a target for AWS CodeStar Notifications notification rules
https://docs.aws.amazon.com/codestar-notifications/latest/userguide/set-up-sns.html

---

# Cross-account permissions for SNS
You can use a Lambda function in one AWS account to subscribe to an Amazon SNS topic in a separate AWS account.

https://docs.aws.amazon.com/en_us/lambda/latest/dg/with-sns-example.html
