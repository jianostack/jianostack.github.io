# AWS ECS EC2 walk-through

## Creating the VPC and Cluster

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/EC2LaunchType/clusters/public-vpc.yml

## ECS services, tasks and target groups

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
--launch-type FARGATE \
--target-groups "targetGroupArn=arn,containerName=string,containerPort=3000" \
--health-check-grace-period 30 \
--aws-profile profile-name
```
