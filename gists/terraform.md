# Terraform notes

## Commands

terraform init

terraform fmt

terraform validate

terraform apply

terraform show

terraform state list

## Modules
https://developer.hashicorp.com/terraform/tutorials/modules/module-use

https://registry.terraform.io/providers/hashicorp/aws/latest

Directory:
- terraform.tf
- main.tf
- variables.tf

Install modules
`terraform init`

## Templates

aws-ec2-template.tf

```
# Define provider (AWS in this case)
provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

# Define variables
variable "instance_ami" {
  default = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI for us-east-1, you may want to change this based on your requirements
}

variable "instance_type" {
  default = "t2.micro"  # You can choose a different instance type if needed
}

# Create an EC2 instance
resource "aws_instance" "example_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}
```

## Plan
https://developer.hashicorp.com/terraform/tutorials/cli/plan
