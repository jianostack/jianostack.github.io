<!-- Space: DOS -->
<!-- Parent: Standards -->

# IAM Developer role permissions

## User group permission policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::[account-number]:role/developers"
        }
    ]
}
```

## Project role trust relationship
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
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

## Developers codepipeline codebuild read 
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "codebuild:BatchGetProjects",
                "codebuild:BatchGetBuildBatches",
                "codebuild:ListReportsForReportGroup",
                "codepipeline:ListWebhooks",
                "codepipeline:ListPipelineExecutions",
                "codepipeline:ListActionExecutions",
                "codepipeline:ListTagsForResource",
                "codepipeline:GetThirdPartyJobDetails",
                "codebuild:ListBuildsForProject",
                "codebuild:ListRepositories",
                "codepipeline:GetJobDetails",
                "codebuild:BatchGetBuilds",
                "codebuild:ListBuildBatches",
                "codepipeline:ListPipelines",
                "codepipeline:GetPipeline",
                "codebuild:ListBuilds",
                "codebuild:ListBuildBatchesForProject",
                "codebuild:ListProjects",
                "codepipeline:GetPipelineState",
                "codepipeline:GetActionType",
                "codepipeline:GetPipelineExecution",
                "codebuild:ListConnectedOAuthAccounts",
                "codepipeline:ListActionTypes"
            ],
            "Resource": "*"
        }
    ]
}
```

## Developers cloudwatch
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
            "Resource": "arn:aws:logs:*:[account-number]:log-group:*"
        }
    ]
}
```
