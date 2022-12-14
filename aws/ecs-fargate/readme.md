<!-- Space: DOS -->
<!-- Parent: Create -->
<!-- Title: AWS ECS Fargate -->

# AWS Copilot

ECS Fargate setup which uses AWS ecs-cli has now been superseeded by AWS Copilot.

# AWS ECS Fargate

> A stack for deploying containerized applications in AWS Fargate. This stack runs containers in a public VPC subnet, and includes a public facing load balancer to register the services in.

With some DevOps sprinkled in.

## Creating the VPC and Cluster

Use CloudFormation to spin up the VPC, load balancer, subnets and ECS cluster.

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/FargateLaunchType/clusters/public-vpc.yml


## ECR

Create a repository in ECR and grab the URI.

```
aws ecr create-repository \
    --repository-name hello-world \
    --image-scanning-configuration scanOnPush=true \
    --region ap-southeast-1 \
    --profile profile-name
```

__Tip:__ Log into the AWS console and an ECR lifecycle to delete untagged images.

## CodeBuild

Create a build project and complete the initial successful build so you have an image in ECR.

### buildspec.yaml

Add buildspec.yaml to your repo.

Go to AWS console Codebuild > Environments and add variables.

### Privileged

Make sure the follow flag is checked:

- [x] Enable this flag if you want to build Docker images or want your builds to get elevated privileges

### CodeBuild Service role

If you create a new service role make sure you attach this policy:

AmazonEC2ContainerRegistryPowerUser

## ECS service

You can try using this script to create an ECS service. It is ideal for new stacks. If not continue to create the service and target group manually.

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/FargateLaunchType/services/public-service.yml

### Target groups
Create the target group and assign it to the load balancer.

Target type is IP.

Check target group and health check port is the same as the container port.

```
aws elbv2 create-target-group \
    --name target-group-name \
    --protocol HTTP \
    --port 80 \
    --target-type ip \
    --vpc-id vpc-0adfdf
    --profile profile-name
```

### ecs-cli compose service
_Note: The Amazon ECS CLI can only manage tasks, services, and container instances that were created with the Amazon ECS CLI._
Task definition updates done in the AWS web console will be lost when using the ecs-cli to update thereafter.

To use this cli you will need these three files:

- [ecs-service.yml](ecs-service.yml)
- [ecs-params.yml](ecs-params.yml)

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

### autoscaling register-scalable-target

```
aws application-autoscaling register-scalable-target \
--service-namespace ecs \
--scalable-dimension ecs:service:DesiredCount \
--resource-id service/cluster-name/service-name \
--min-capacity 1 \
--max-capacity 8 \
--profile profile-name
```

### autoscaling put-scaling-policy CPU

```
aws application-autoscaling put-scaling-policy --service-namespace ecs \
--scalable-dimension ecs:service:DesiredCount \
--resource-id service/cluster-name/service-name \
--policy-name cpu-target-tracking-scaling-policy --policy-type TargetTrackingScaling \
--target-tracking-scaling-policy-configuration file://ecs-cpu-policy.json \
--profile profile-name
```

### autoscaling put-scaling-policy memory

```
aws application-autoscaling put-scaling-policy --service-namespace ecs \
--scalable-dimension ecs:service:DesiredCount \
--resource-id service/cluster-name/service-name \
--policy-name memory-target-tracking-scaling-policy --policy-type TargetTrackingScaling \
--target-tracking-scaling-policy-configuration file://ecs-memory-policy.json \
--profile profile-name
```

## CodePipeline

Create your CodePipeline for each environment.

## RDS

Create RDS in the same VPC.

## Elastic cache

To save costs for development and staging do not provision a redis cluster. Instead use file caching.

For production provision a redis cluster with two t2 micro nodes.

---

## Gotchas

### Unhealthy targets
If your targets inside your target group are unhealthy or keep draining check the following:

- Check that your VPC default security group and ALB security group are the same
- Check that your ECS security group is allowing the VPC default security group
- No application errors on your health check path
- Does your startup script require a DB connection? ECS task will keep failing if this is not setup
- Check the health check path
- Check if there is a redirection from the health check path

### Deleting a service
`ecs-cli compose service rm --file ecs-service.yml service rm --cluster string`

To delete the service discovery from the [CLI](https://stackoverflow.com/questions/53370256/aws-creation-failed-service-already-exists-service-awsservicediscovery-stat)
