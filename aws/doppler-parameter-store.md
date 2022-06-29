Doppler is a SecretOps platform that will help you manage environment variables.

## New project
Create a new project in Doppler and integrate[1] with AWS Parameter store. Basically creating and connecting an IAM user.

The sync path will need to start with / 

E.g. /project-name/staging

Once integration is successful, you can populate all your env variables on Doppler and they will automatically get created in Parameter store.

## Permissions for ECS task execution role
Add the following permissions to the task execution role. It is a simplified version of what is found here[2].

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameters"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt"
            ],
            "Resource": [
                "arn:aws:kms:ap-southeast-1:510281071509:key/this-is-the-aws-ssm-key"
            ]
        }
    ]
}
```

## ECS task definition
Edit your task definition to include the secrets[3] referencing the Parameter store env variables.

---

[1] https://docs.doppler.com/docs/aws-parameter-store

[2] https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data-parameters.html#secrets-iam-parameters

[3] https://docs.aws.amazon.com/AmazonECS/latest/developerguide/specifying-sensitive-data-parameters.html#secrets-envvar-parameters