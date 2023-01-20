<!-- Space: DOS -->
<!-- Parent: Create -->

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
--ecs-params params.yml \
--file service.yml \
service up \
--create-log-groups \
--tags project=string \
--cluster string \
--launch-type EC2 \
--target-groups "targetGroupArn=arn,containerName=string,containerPort=3000" \
--health-check-grace-period 30 \
--aws-profile profile-name
```

params.yml
```
version: 1
task_definition:
  task_execution_role: ecsTaskExecutionRole
  ecs_network_mode: bridge
  task_size:
    mem_limit: 0.5GB
    cpu_limit: 256
run_params:
  network_configuration:
    awsvpc_configuration:
      subnets:
        - subnet-id
        - subnet-id
      security_groups:
        - sg-id
      assign_public_ip: ENABLED

```

service.yml
```
version: "3"

services:

  container-name:
    image: # repositoryurl:tag
    ports:
      - "0:3000"
    logging:
      driver: awslogs
      options:
        awslogs-group: # group name
        awslogs-region: ap-southeast-1
        awslogs-stream-prefix: ecs

```
