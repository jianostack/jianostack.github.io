<!-- Space: DOS -->
<!-- Parent: Access -->

# AWS CLI with profiles

Install AWS CLI with homebrew
```
brew install awscli
```

Create the .aws dir
```
mkdir ~/.aws
```

Create the credentials file
```
touch ~/.aws/credentials
```

A DevOps engineer will generate an access key ID and secret access key for you. Insert the key and secret into the credentials file. This will grant you access to Massive Infinity AWS account
```
[default]
aws_access_key_id=
aws_secret_access_key=
```

Create a config file
```
touch ~/.aws/config
```

Insert the default profile and other profiles into your config file
```
[default]
region = ap-southeast-1

[profile profile-name]
region = ap-southeast-1
role_arn = arn:aws:iam::account-number:role/iam-role-name
source_profile = default
```

Use export to switch profiles in the terminal
```
export AWS_PROFILE=profile-name
```

Run this to show which profile you are currently using
```
aws configure list
```
