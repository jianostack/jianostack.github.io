# AWS CLI cheat sheet

## Session manager start session 
`aws ssm start-session --target "i-xxx"`

## aws ec2 describe-instances
```
aws ec2 describe-instances \
--query 'Reservations[*].Instances[*].{Instance:InstanceId,Name:Tags[?Key==`Name`]|[0].Value}' \
--output text
```
