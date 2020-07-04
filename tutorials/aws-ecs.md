# Elastic container service tutorial

## Fargate launch type with public subnets

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/FargateLaunchType/clusters/public-vpc.yml

## EC2 launch type with public or private subnets

Let's use AWS CloudFormation to deploy a cluster. Choose between the following:

Public subnets are easier to configure but not as secure.

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/EC2LaunchType/clusters/public-vpc.yml

Private subnets have increased security but are expensive because of the NAT gateway.

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/EC2LaunchType/clusters/private-vpc.yml

## Continous integration

Head over to [here](aws-ci.md) and follow the instructions to link a code source to a container build and then deploy it to the cluster.

---

### Key pair issue

The Cloudformation doesn't associate a keypair with your EC2. Do the following to fix this:

- EC2 > launch configuration
- Create a new launch configuration by copying an existing one
- Delete existing launch configuration
- The keypair association will come after the review
- change your EC2 > auto scaling groups > edit > launch configuration
- check your min capicity is 0 and desired capacity is 1
- instance management > detach
- a new instance will be launched into to the auto scaling group

### Create subnet issue
Make sure your default VPC has at least 2 availability zones with default subnets

https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet

https://github.com/widdix/aws-cf-templates/issues/37
