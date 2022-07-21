# AWS Fargate scheduler

Create an Amazon Linux EC2 image. It comes with AWS CLI installed.

Setup AWS CLI with

`aws configure`

Edit crontab

`crontab -e`

Insert cron job. Take note of your server time zone. Usually it is UTC.

```
0 22 * * * aws ecs update-service --cluster cluster-id --service service-name --desired-count 1 >/dev/null 2>&1

59 15 * * * aws ecs update-service --cluster cluster-id --service service-name --desired-count 0 >/dev/null 2>&1
```
