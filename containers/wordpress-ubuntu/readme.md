# Wordpress on Ubuntu 22.04

## Point domain name 
- Point domain name to server

## Install Docker and docker-compose
```
vim install.sh
sh install.sh
```

## Setup Wordpress, MySQL and SWAG
```
su ubuntu 
cd 
vim docker-compose.yml
docker compose up
wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz -C /home/ubuntu/appdata/swag/www/
rm latest.tar.gz
vim appdata/swag/nginx/site-confs/default.conf
```

Change `root /config/www/wordpress`

`docker compose up -d`

Go to install Wordpress install

## Backup
- create script
- edit S3 bucket name
```
vim backup.sh
```
- create crontab
```
crontab -e
0 3 * * * sh /home/ubuntu/backup.sh >> /home/ubuntu/backup_$(date +\%Y\%m\%d).log 2>&1
```

## Create CloudWatch Alarms
- Install Terraform
- Check Terraform values aws_route53_health_check (fqdn)
- Check Terraform values aws_cloudwatch_metric_alarm (dimensions)
- Manually create alarm for healthcheck 
- Check EC2 role has CloudWatchAgentServerPolicy
- amazon-cloudwatch-agent should already be install on ubuntu 22.04 if not `sudo apt install amazon-cloudwatch-agent` or `wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb`
- Run the wizard
- sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
- Basic config
- Manually create the action for the alarm

## Reboots
- Docker automatically starts on reboot if install with package distro
- Supervisord to start docker compose
- sudo vim /etc/supervisor/conf.d/docker.conf
- sudo supervisorctl reread
- sudo supervisorctl update
- sudo supervisorctl
