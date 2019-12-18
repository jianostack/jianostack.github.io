## Create a Log group

Action > Create log group

## docker-compose

```
logging:
      driver: "awslogs"
      options:
        awslogs-region: "[region]"
        awslogs-group: "[log-group]"
        awslogs-stream: "[stream-name]"
```


## Create an IAM role

The service that will use this role

- EC2

Attach permissions policies

- CloudWatchFullAccess

## EC2

EC2 > Actions > Instance settings > Attache IAM Role


### Reference

[AWS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html#create-iam-role)
