# Deploy ECS

## EC2 launch type with private subnets 

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/EC2LaunchType/clusters/private-vpc.yml

## Key pairs

The Cloudformation doesn't associate a keypair with your EC2. Do the following to fix this:

- EC2 > launch configuration
- Create a new launch configuration by copying an existing one
- The keypair association will come after the review
- change your EC2 > auto scaling groups > edit > launch configuration
- check your min capicity is 0 and desired capacity is 1
- instance management > detach 
- a new instance will be launched into to the auto scaling group

## Create subnet issue
Make sure your default VPC has at least 2 availability zones with default subnets

https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet

https://github.com/widdix/aws-cf-templates/issues/37
