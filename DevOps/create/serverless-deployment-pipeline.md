<!-- Space: DOS -->
<!-- Parent: Create -->

# Serverless deployment pipeline

Create a CodeBuild project with aws/codebuild/standard:6.0.

Insert the following buidspec.yml into your serverless repository.

buildspec.yml
```
version: 0.2
phases:
  install:
    runtime-versions:
      nodejs: 16
  pre_build:
    commands:
      - aws --version
      - echo Preparing environment
      - aws s3 cp s3://project-$STAGE/api/.env.$STAGE ./.env.$STAGE
      - echo Installing dependencies
      - npm install --frozen-lockfile
  build:
    commands:
      - echo Deployment started on `date`
      - echo STAGE $STAGE
      - npm run deploy-$STAGE
  post_build:
    commands:
      - echo Cleanup
      - rm -rf .env.$STAGE
      - echo Deployment completed on `date`
```

Add the following inline policy to your CodeBuild IAM role:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "logs:*",
                "lambda:*",
                "cloudformation:*",
                "events:*",
                "schemas:*",
                "scheduler:*",
                "pipes:*",
                "iam:*"
            ],
            "Resource": "*"
        }
    ]
}
```

Last step is to create a CodePipeline with no deploy step, as it is done in the CodeBuild project already.

