# AWS ECS static outbound IP
This guide will create an ECS cluster with an outbound static IP address. The ECS service lives inside the private subnets and have a NAT gateway attached to the route table. The NAT gateway has an Elastic IP which is our outbound static IP address.

## VPC and ECS cluster
Thankfully AWS has CloudFormation templates that we can use to get up and running. This will create a VPC, ECS cluster, public load balancer and 2 public subnets.

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/FargateLaunchType/clusters/public-vpc.yml

## Public subnets
These public two subnets are connected to the load balancer and share the same route table.

Create a NAT gateway and assign an Elastic IP to it.

Add the NAT gateway to the route table:
- 10.0.0.0/8 (Destination) nat (Target)

The Internet Gateway and local routes should already be there.

## Private subnet
We will need to create two additional private subnets (no internet gateway, a route to the NAT Gateway).

In the shared route table you need this NAT gateway route:

- 0.0.0.0/0 (Destination) nat (Target)

## ECS service
Create your ECS service in the private subnets with "Assign public IP" set to false.

### References

https://stackoverflow.com/questions/69047248/aws-fargate-with-outbound-static-ip
 
