# AWS Lambda with outbound internet access

By default Lambda is not connected to a VPC, which enables it to have internet access but prevents it from accessing private services like RDS, DocumentDB and DynamoDB. Including Lambda inside a VPC breaks the internet connection. 

This guide will allow a Lambda function to have an outbound static IP address which allows Lambda to connect to the internet.

Internet access from a private subnet requires network address translation (NAT). To give internet access to an Amazon VPC-connected Lambda function, route its outbound traffic to a NAT gateway.


## NAT gateway
Create a NAT gateway:
- Assign it to a single public subnet
- Connectivity type is public
- Assign an Elastic IP to it

## Private subnets
We will need to create two private subnets.

In the shared route table you need this NAT gateway route:

0.0.0.0/0 (Destination) NAT gateway (Target)

Make sure your route table is associated with the two private subnets.

---

Resources

https://repost.aws/knowledge-center/internet-access-lambda-function
