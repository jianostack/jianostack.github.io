## CodeCommit

_This is an archive. I pull from Bitbucket/Github now._

Add your new CodeCommit repo as a remote.

```
[remote "aws"]
	url = SSH_URL
	fetch = +refs/heads/*:refs/remotes/origin/*
```

To grant access to CodeCommit add your Access Key ID from AWS Console IAM page to `vim ~/.ssh/config`

```
Host git-codecommit.*.amazonaws.com
User AWS_ACCOUNT_ID
IdentityFile ~/.ssh/id_rsa
```

## IAM user policy

Add this policy to the user:

AWSCodeCommitPowerUser
