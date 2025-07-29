# Serverless deployment pipeline

1. Create a CodeBuild project with aws/codebuild/standard:6.0.

2. Insert the following buidspec.yml into your serverless repository.

buildspec.yml
```
version: 0.2
env:
  variables:
    STAGE: $STAGE
    DBUSER: $DBUSER
phases:
  install:
    runtime-versions:
      nodejs: 16
  pre_build:
    commands:
      - aws --version
      - echo Preparing environment
      - echo "DBUSER=$DBUSER" >> .env.$STAGE
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

3. Add the following inline policy to your CodeBuild IAM role.

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

4. Create a CodePipeline with no deploy step, as it is done in the CodeBuild project already.

5. Check the package.json in the app has the following commands:

```
{
  "name": "serverless",
  "version": "1.0.0",
  "description": "serverless from codebuild",
  "author": "",
  "license": "MIT",
  "dependencies": {
    "serverless": "^3.31.0"
  },
  "scripts": {
    "deploy-staging" : "sls deploy --stage $STAGE",
    "deploy-prod" : "sls deploy --stage $STAGE"
  },
  "devDependencies": {
    "serverless-bundle": "^6.0.0",
    "serverless-offline": "^12.0.4"
  }
}
```

6. Here is a serverless.yml example

```
service: project-name
provider:
  name: aws
  runtime: nodejs16.x
  region: ap-southeast-1
  timeout: 60
  environment:
    DBUSER: ${env:DBUSER}
```
