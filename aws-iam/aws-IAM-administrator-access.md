# Administrators IAM Role

Best-practice is to create Roles to delegate permissions. For security, you should also require that users provide a one-time key generated from a multi-factor authentication (MFA) device.

The IAM role for admin must be created for each project’s AWS account. The role must not be shared between AWS accounts. 

### New Role

Go to IAM Roles and create a new role

Tick Require MFA

Select AdministratorAccess and Billing permission policies

Enter Role name as projectname-admin

### Trust relationships

Go to your new IAM Role and select the Trust relationships tab

Edit the trust policy to include the IAM User 

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Principal": {
				"AWS": [
					"arn:aws:iam::AWS-ACCOUNT-ID:user/username"
				]
			},
			"Action": "sts:AssumeRole"
		}
	]
}
```

## Creating a new administrator user

There should be a minimum of two sys admins per AWS account. This is a fall back plan in case one sys admin is absent.

### Create IAM User

Create a new user here https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/users/create

### MFA policy

A MFA policy will deny allow access to AWS console and CLI unless the user has signed in with their MFA device.

Instead of assigning this policy individually, create a user group and assign the policy to it. Then include all users into the group.

Create a new IAM Policy

Insert the policy into the json editor 

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowViewAccountInfo",
            "Effect": "Allow",
            "Action": "iam:ListVirtualMFADevices",
            "Resource": "*"
        },
        {
            "Sid": "AllowManageOwnVirtualMFADevice",
            "Effect": "Allow",
            "Action": [
                "iam:CreateVirtualMFADevice"
            ],
            "Resource": "arn:aws:iam::*:mfa/*"
        },
        {
            "Sid": "AllowManageOwnUserMFA",
            "Effect": "Allow",
            "Action": [
                "iam:DeactivateMFADevice",
                "iam:EnableMFADevice",
                "iam:GetUser",
                "iam:ListMFADevices",
                "iam:ResyncMFADevice"
            ],
            "Resource": "arn:aws:iam::*:user/${aws:username}"
        },
        {
            "Sid": "DenyAllExceptListedIfNoMFA",
            "Effect": "Deny",
            "NotAction": [
                "iam:CreateVirtualMFADevice",
                "iam:EnableMFADevice",
                "iam:GetUser",
                "iam:ListMFADevices",
                "iam:ListVirtualMFADevices",
                "iam:ResyncMFADevice",
                "sts:GetSessionToken",
                "iam:ChangePassword",
                "iam:GetLoginProfile",
                "iam:UpdateLoginProfile"
            ],
            "Resource": "*",
            "Condition": {
                "BoolIfExists": {
                    "aws:MultiFactorAuthPresent": "false"
                }
            }
        }
    ]
}
```

Enter name as projectname-MFA

## Switching into the Admin Role

### Console

Log into your project’s AWS account normally

Switch into the admin role e.g.https://signin.aws.amazon.com/switchrole?roleName=projectname-admin&account=xxx

### CLI

Alternatively you can setup aws-vault and use the login command to generate a link.

aws-vault login projectname-mfa

AWS documents show how to use MFA with the IAM Role but it does not work with AWS Copilot. It cannot assume the admin role.

An opensource workaround is provided by using aws-vault to store the AWS credentials.

Install aws-vault

`brew install --cask aws-vault`

Add new vault

```
aws-vault add projectname
Enter Access Key ID: ***
Enter Secret Access Key: 
Added credentials to profile "projectname" in vault
```


.aws/config
```
[profile project]
region = ap-southeast-1

[profile project-vault]
region = ap-southeast-1
role_arn = arn:aws:iam::account-number:role/project-administrator
source_profile = project
mfa_serial = arn:aws:iam::account-number:mfa/project-johnsmith
role_session_name = johnsmith@example.com

[profile project-mfa]
region = ap-southeast-1
credential_process = aws-vault exec project-vault --json --prompt=osascript
```

Switch profile

`export AWS_PROFILE=profile-mfa`

Test

```
aws s3 ls
copilot app ls
```

---


https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-oidc

https://github.com/hashicorp/terraform-provider-aws/issues/2420 

https://zenn.dev/kzen/articles/e0044cfb34c7bf
