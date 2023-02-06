<!-- Space: DOS -->
<!-- Parent: Create -->

# Serverless deployment pipeline

Insert the following buidspec.yml into your serverless repository. It uses SLS CLI to deploy. The environment variables are printed out to a temporary .env.$STAGE file.

builspec.yml
```
version: 0.2

env:
  variables:
    STAGE: $STAGE
    USER_TABLE: $USER_TABLE

phases:
  install:
    runtime-versions:
      python: 3.9
      nodejs: 14
  pre_build:
    commands:
      - aws --version
      - echo Preparing environment $STAGE
      - echo "USER_TABLE=$USER_TABLE" >> .env.$STAGE
      - echo Installing dependencies
      - npm install
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

Add the following policies to your CodeBuild IAM role:
- AmazonS3FullAccess
- CloudWatchLogsFullAccess
- CloudWatchEventsFullAccess
- AWSCloudFormationFullAccess
- AWSLambda_FullAccess

Last step is to create a CodePipeline with no deploy step, as it is done in the CodeBuild project already.

