# Deploy ECS

## EC2 launch type with private subnets 

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/EC2LaunchType/clusters/private-vpc.yml

## Keypairs

The Cloudformation doesn't associate a keypair with your EC2. Do the following to fix this:

- EC2 > auto scaling groups > edit > switch to launch template
- create a launch template with keypair 
- check your min capicity is 0 and desired capacity is 1
- instance management > detach 
- a new instance will be launched due to the auto scaling group

## Create subnet issue
Make sure your default VPC has at least 2 availability zones with default subnets

https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet

https://github.com/widdix/aws-cf-templates/issues/37
