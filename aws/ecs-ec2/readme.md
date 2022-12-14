<!-- Space: DOS -->
<!-- Parent: Create -->
<!-- Title: AWS ECS EC2 -->

# AWS ECS EC2

## Creating the VPC and Cluster

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/EC2LaunchType/clusters/public-vpc.yml

## ECS services

You can try and create a service with this script. 

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/EC2LaunchType/services/public-service.yml

### ecs-cli compose service up
This will create our task definition, create an ECS service and set task count to 1.

```
ecs-cli compose --project-name project-name-is-ecs-service-name \
--ecs-params ecs-params.yml \
--file ecs-service.yml \
service up \
--create-log-groups \
--tags project=string \
--cluster string \
--launch-type EC2 \
--target-groups "targetGroupArn=arn,containerName=string,containerPort=3000" \
--health-check-grace-period 30 \
--aws-profile profile-name
```

## Gotchas

### Key pair issue EC2 launch type
The Cloudformation doesn't associate a keypair with your EC2 instance. 

