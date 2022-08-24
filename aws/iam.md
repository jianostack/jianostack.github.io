## user group permission policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::[account-number]:role/oeca-developers"
        }
    ]
}
```

## project role trust relationship
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::[account-number]:user/[name]",
          "arn:aws:iam::[account-number]:user/[name]"
        ]
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "Bool": {
          "aws:MultiFactorAuthPresent": "true"
        }
      }
    }
  ]
}
```

## project developers codepipeline s3 policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "codepipeline:ListWebhooks",
                "codepipeline:ListTagsForResource"
            ],
            "Resource": [
                "arn:aws:codepipeline:*:[account-number]:actiontype:*/*/*/*",
                "arn:aws:codepipeline:*:[account-number]:webhook:*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "codepipeline:ListPipelineExecutions",
                "codepipeline:ListActionExecutions",
                "codepipeline:GetPipeline",
                "codepipeline:ListTagsForResource",
                "codepipeline:GetPipelineState",
                "codepipeline:GetPipelineExecution"
            ],
            "Resource": "arn:aws:codepipeline:*:[account-number]:*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets",
                "codepipeline:ListPipelines",
                "codepipeline:GetPipeline",
                "cognito-idp:*",
                "codebuild:ListProjects",
                "codepipeline:GetThirdPartyJobDetails",
                "codepipeline:GetJobDetails",
                "codecommit:ListRepositories",
                "codepipeline:ListActionTypes",
                "codebuild:BatchGetProjects",
                "codedeploy:ListApplications",
                "codebuild:ListBuildsForProject",
                "codebuild:BatchGetBuilds"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::[name]"
            ]
        }
    ]
}
```

## project developers cloudwatch policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "logs:*",
            "Resource": [
                "arn:aws:logs:ap-southeast-1:[account-number]:log-group:[group-name]:*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "logs:DescribeLogGroups",
            "Resource": "*"
        }
    ]
}
```
