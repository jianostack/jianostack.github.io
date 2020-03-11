This guide gets your repository onto CodeCommit, built/pushed onto ECR then finally deployed to ECS. Pheww.

## 1. CodeCommit

Originally I started out with Bitbucket as a source but realised later that CodePipeline cannot build with that. Very misleading AWS. So instead choose CodeCommit.

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

## 2. CodeBuild

Create a new CodeBuild project.

Add a buildspec.yml to your repo. Edit the ECR_URI, ECR_TAG and CONTAINER_NAME:

```
version: 0.2

phases:
  pre_build:
    commands:
      - echo Logging in to Amazon ECR...
      - aws --version
      - $(aws ecr get-login --region $AWS_DEFAULT_REGION --no-include-email)
      - REPOSITORY_URI=ECR_URI
      - COMMIT_HASH=$(echo $CODEBUILD_RESOLVED_SOURCE_VERSION | cut -c 1-7)
      - IMAGE_TAG=${COMMIT_HASH:=ECR_TAG}
  build:
    commands:
      - echo Build started on `date`
      - echo Building the Docker image...
      - docker build --build-arg APP_NAME=${APP_NAME} --build-arg API_VERSION=${API_VERSION} -t $REPOSITORY_URI:ECR_TAG .
      - docker tag $REPOSITORY_URI:ECR_TAG $REPOSITORY_URI:$IMAGE_TAG
  post_build:
    commands:
      - echo Build completed on `date`
      - echo Pushing the Docker images...
      - docker push $REPOSITORY_URI:ECR_TAG
      - docker push $REPOSITORY_URI:$IMAGE_TAG
      - echo Writing image definitions file...
      - printf '[{"name":"CONTAINER_NAME","imageUri":"%s"}]' $REPOSITORY_URI:$IMAGE_TAG > imagedefinitions.json
artifacts:
    files: imagedefinitions.json

```
### Privileged

Make sure the follow flag is checked:

- [x] Enable this flag if you want to build Docker images or want your builds to get elevated privileges

### CodeBuild Service role 

If you create a new service role make sure you attach this policy:

AmazonEC2ContainerRegistryPowerUser

## 3. CodePipeline

The CodePipeline combines the source, build and deploy steps together.

Create your ECS task definition and service before starting a CodePipeline.

## References

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-cd-pipeline.html
