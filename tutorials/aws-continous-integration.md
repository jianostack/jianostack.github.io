# AWS Continous Integration

CodeBuild and CodePipeline.

## CodeBuild

Create a new CodeBuild project.

### Source

Setup Bitbucket/Github source provider connection and repo.

### Buildspec

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
      - docker build --build-arg APP_KEY=${APP_KEY} -t $REPOSITORY_URI:ECR_TAG .
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

## References

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-cd-pipeline.html
