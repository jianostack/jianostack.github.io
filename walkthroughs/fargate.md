# Haha EC2 not fargate

Why? 
- cheaper
- you can SSH into your EC2
- EC2 is visible 
- devs need more control

Though Fargate does have some pros:
- task level orchestration
- Automated ECS agent version upgrades
- auto scaling

## ACM 

Amazon Certificate manager

Connect and verify your custom domain.

## ECR

Amazon Elastic container registery. 

We need to get our docker image into this registery.

Install AWS CLI. I recommend using `brew install awscli`.

Login to ECR and use the push commands supplied.

## VPC

Create a new Virtual Private Cloud. Yes IPv6 CIDR block it.

Create an internet gateway and attach it to your VPC.

Create two subnets:

- make sure they are in different zones
- add the internet gateway to your subnet's route table

## ALB

Create a new Application Load Balancer.

Use default VPC Security Group. Check if 80 and 443 are open.

Create a target group like project-app-dev.

Target type instance.

## ECS

Amazon Elastic container service.

### Define your task

Target type: IP

Protocol: HTTP

Ignore task size memory and CPU. Set a hard memory limit in the container.

Turn on all the logging in the container definition.

### Create a cluster

Take note of the security group being created with the VPC.

### Create a service

Production listener port: 80:HTTP

Production listener protocol: HTTP

Target group name: create new - dev/stg/pro

Target group protocol: HTTP

## HTTPS

Go to ALB > Listeners

Create a new 443 listener rule.

Add the URL to the host header and forward to the target group created in the service.

Redirect all HTTP to HTTPS.

## DB 

In the DB security group remember to allow ECS instance's security group or your jumpbox inbound.

## Troubleshooting

### Unhealthy targets

If your targets inside your target group are unhealthy or keep draining check the following:

- Check that your VPC default security group and Load Balancer's security group are the same. It should be allowing all TCP connections to itself.
- Check that your EC2s (cluster) security group is allowing the VPC default security group.
- No application errors on your homepage. Even though your request is returing 200 the health check still doesn't like the errors.
- Does your startup script require a DB connection? ECS task will keep failing if this is not setup.
- Check the health check path is /
- Check if there is a redirection from the health check path. 302 will cause health check to fail.

### Deleting a service

- Remove the target group from the ALB
- Delete the target group
- Stop the task inside the service
- Delete the service in the console
- Delete the service discovery from the [CLI](https://stackoverflow.com/questions/53370256/aws-creation-failed-service-already-exists-service-awsservicediscovery-stat)
