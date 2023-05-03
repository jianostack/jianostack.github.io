# AWS CLI cheat sheet

## Session manager start session 
`aws ssm start-session --target "i-xxx"`

## Session manager with SSH SCP SFTP

Insert into ~/.ssh/config

```
# SSH over Session Manager
host i-* mi-*
    ProxyCommand sh -c "aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'"
```

Connect via Session manager to SFTP
`sftp -i Privacy-Enhanced-Mail.pem user@ec2-instanceid`


Get sessions token 
`aws sts get-session-token --duration-seconds 129600 --serial-number arn:aws:iam::accountno:mfa/user --token-code`

