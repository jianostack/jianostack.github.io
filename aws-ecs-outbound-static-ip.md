# AWS ECS static outbound IP

ECS Fargate launch type with outbound static IP address for others to whitelist.

First deploy this CloudFormation script that creates 2 public subnets. 

https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/FargateLaunchType/clusters/public-vpc.yml

## Private subnet

We will need to create an additional subnet. This one will be a private subnet (no internet gateway, a route to the NAT Gateway) and it will have it's own route table.

Create a NAT gateway and assign an Elastic IP to it.

Create a new route table and associate it to the subnet.

In the route table you need this NAT gateway route:

- 0.0.0.0/0 (Destination) nat (Target)

## Public subnets

The CloudFormation script created two public subnets for us. These two subnets share the same route table

Add the NAT gateway (the same NAT gateway in the private subnet) route:

- 10.0.0.0/8 (Destination) nat (Target)

The Internet Gateway and local routes should already be there. 

## ECS service

Create your service in the private subnet with "Assign public IP" set to false.

### References

https://stackoverflow.com/questions/69047248/aws-fargate-with-outbound-static-ip
 
