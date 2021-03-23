# Elastic container service

ECS, RDS, Elastic cache and CodePipeline setup. I use it for PHP or  NodeJS stacks.

## Creating the VPC and Cluster

First off choose your launch type. EC2 is seen as old faithful with a more manual setup yet with greater control. Fargate is the new kid on the block with AWS managing the servers for you, all that automation comes at a price though.

Next is public vs private subnets. Public is easier to config but not as secure. Private is more secure but with a harder setup and heavier price tag.

**Production**

I recommend Fargate with public subnets. Use CloudFormation to spin up the VPC, load balancer, subnets and ECS cluster.

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/FargateLaunchType/clusters/public-vpc.yml

**Development and Staging**

For dev and staging I recommend using EC2 launch type with public subnet. It is also appropriate when the IP address of the EC2 is needed.

https://raw.githubusercontent.com/awslabs/aws-cloudformation-templates/master/aws/services/ECS/EC2LaunchType/clusters/public-vpc.yml


# ECR

Create a repo in ECR and grab the URI.

# CodeBuild

Create a build project and complete the initial build so it can push to ECR.

More steps found [here](aws-continous-integration.md).

## ECS services, tasks and target groups
Setup your ecs-cli first.

### Target groups
Create the target group and assign it to the load balancer.

Target type is IP.

Check target group and health check port is the same as the container port.

### ecs-cli compose service
To use this cli you will need these three files:

- [ecs-service.yml](ecs-service.yml)
- [ecs-params.yml](ecs-params.yml)
- .env_example

### ecs-cli compose service create
This will create our task definition.

`ecs-cli compose --project-name string --ecs-params ecs-params.yml --file ecs-service.yml service create --create-log-groups --tags project=string --cluster string --launch-type FARGATE --target-groups "targetGroupArn=arn,containerName=string,containerPort=3000" --health-check-grace-period 30`


### ecs-cli compose service up
Create and start the service. Also used to update.

`ecs-cli compose --project-name string --ecs-params ecs-params.yml --file ecs-service.yml service up --cluster string`

### autoscaling register-scalable-target
```
aws application-autoscaling register-scalable-target \
--service-namespace ecs \
--scalable-dimension ecs:service:DesiredCount \
--resource-id service/cluster-name/service-name \
--min-capacity 1 \
--max-capacity 10
```

### autoscaling put-scaling-policy CPU
```
aws application-autoscaling put-scaling-policy --service-namespace ecs \
--scalable-dimension ecs:service:DesiredCount \
--resource-id service/cluster-name/service-name \
--policy-name cpu-target-tracking-scaling-policy --policy-type TargetTrackingScaling \
--target-tracking-scaling-policy-configuration file://ecs-cpu-policy.json
```

### autoscaling put-scaling-policy memory
```
aws application-autoscaling put-scaling-policy --service-namespace ecs \
--scalable-dimension ecs:service:DesiredCount \
--resource-id service/cluster-name/service-name \
--policy-name memory-target-tracking-scaling-policy --policy-type TargetTrackingScaling \
--target-tracking-scaling-policy-configuration file://ecs-memory-policy.json
```

## CodePipeline

Create your CodePipeline for each environment.

## RDS

Create RDS in the same VPC.

## Elastic cache

To save costs for development and staging do not provision a redis cluster. Instead use file caching. 

For production provision a redis cluster with two t2 micro nodes. 

---

### Key pair issue EC2 launch type
The Cloudformation doesn't associate a keypair with your EC2 instance. Do the following to fix this:

- EC2 > launch configuration
- Create a new launch configuration by copying an existing one
- Delete existing launch configuration
- The keypair association will come after the review
- change your EC2 > auto scaling groups > edit > launch configuration
- check your min capicity is 0 and desired capacity is 1
- instance management > detach
- a new instance will be launched into to the auto scaling group
- If a new instance is not appearing in your cluster try manually assigning it an elastic IP address

### Create subnet issue
Make sure your default VPC has at least 2 availability zones with default subnets

https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet

https://github.com/widdix/aws-cf-templates/issues/37

### Unhealthy targets

If your targets inside your target group are unhealthy or keep draining check the following:

- Check that your VPC default security group and Load Balancer's security group are the same. It should be allowing all TCP connections to itself.
- Check that your EC2s (cluster) security group is allowing the VPC default security group.
- No application errors on your homepage. Even though your request is returing 200 the health check still doesn't like the errors.
- Does your startup script require a DB connection? ECS task will keep failing if this is not setup.
- Check the health check path is /
- Check if there is a redirection from the health check path. 302 will cause health check to fail.

### Deleting a service
`ecs-cli compose service rm --file ecs-service.yml service rm --cluster string`

To delete the service discovery from the [CLI](https://stackoverflow.com/questions/53370256/aws-creation-failed-service-already-exists-service-awsservicediscovery-stat)
