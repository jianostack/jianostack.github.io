## Deploy containers using Elastic Container Service and CloudFormation
### EC2 launch type with public subnets 
https://github.com/awslabs/aws-cloudformation-templates/blob/master/aws/services/ECS/EC2LaunchType/clusters/public-vpc.yml

### Create subnet issue
Make sure your default VPC has at least 2 availability zones with default subnets

https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet

https://github.com/widdix/aws-cf-templates/issues/37
