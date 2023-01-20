This guide will allow a Lambda function to have an outbound static IP address and indirectly connect to a IGW (internet gateway). 

The Lambda function lives inside the private subnets and has a NAT gateway attached to the route tables. The NAT gateway has an Elastic IP which is the outbound static IP address.

In the public subnets the same NAT gateway is there, along with the IGW.

## NAT gateway
Create a NAT gateway:
- Assign it to a single public subnet
- Connectivity type is public
- Assign an Elastic IP to it

We’re going to add it to your private subnets route table later.

## Public subnets
These public two subnets are connected to the load balancer and share the same route table.

Add the NAT gateway to the route table:

10.0.0.0/8 (Destination) nat (Target)

The Internet Gateway and local routes should already be there.

## Private subnet
We will need to create two additional private subnets (no internet gateway, a route to the NAT Gateway).

In the shared route table you need this NAT gateway route:

0.0.0.0/0 (Destination) nat (Target)

Make sure your route table is associated with the two private subnets.
