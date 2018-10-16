## Elastic beanstalk CLI

Fire up an instance

`eb init`

Upload the configs, deploy app

`eb create environemnt_name`

Set environment

`eb use environment_name`

Environment variables. Inside eb ssh:

`sudo /opt/elasticbeanstalk/bin/get-config environment --output YAML`

## Amazon CLI

Setup credentials

`aws configure`

## Elastic beanstalk

`ssh ec2-user@example.elasticbeanstalk.com`
