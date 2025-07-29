# AWS ECS static outbound IP
This guide will create an ECS cluster with an outbound static IP address. The ECS services lives inside the private subnets and has a NAT gateway attached to the route table. The NAT gateway has an Elastic IP which is our outbound static IP address.

## VPC and ECS cluster
Thankfully AWS has CloudFormation templates that we can use to get up and running. This will create a VPC, ECS cluster, public load balancer and 2 public subnets.

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/FargateLaunchType/clusters/public-vpc.yml

Nathan Peck has a public private Fargate network stack to try out too.

https://github.com/nathanpeck/aws-cloudformation-fargate/blob/master/fargate-networking-stacks/public-private-vpc.yml

## NAT Gateway

Create a NAT gateway:
- Connectivity type is public
- Assign an Elastic IP to it

## Public subnets

The Internet Gateway and local route should already be here.

## Private subnets
We will need to create two private subnets.

In the shared route table you need this NAT gateway route:

- 0.0.0.0/0 (Destination) NAT Gateway (Target)

## ECS service
Create your ECS service in the private subnets with "Assign public IP" set to false.

### References

https://stackoverflow.com/questions/69047248/aws-fargate-with-outbound-static-ip
 
