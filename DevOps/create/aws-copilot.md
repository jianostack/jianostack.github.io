<!-- Space: DOS -->
<!-- Parent: Create -->
<!-- Title: AWS Copilot -->

# AWS Copilot

Copilot will create the VPC, subnets, ECS cluster, ECS service and CodePipelines with simple prompts the command line.

## Install

`brew install aws/tap/copilot-cli`

Dependencies are the AWS CLI, Docker Desktop and AWS credentials.

Tested with AWS IAM policy AdministratorAccess.

## Demo app
https://aws.github.io/copilot-cli/docs/getting-started/first-app-tutorial/  

## Credentials
Running Copilot with other profiles

```
export AWS_PROFILE=my-app
copilot app ls
```
https://aws.github.io/copilot-cli/docs/credentials/

## Setup 
Change directory into the project with a Dockerfile. 

`copilot init`

To create a production environment.

```
copilot env init
copilot svc deploy
```

Create RDS storage

`copilot storage init`

Afte storage yml file is create add this line for encryption.

```
apiclusterDBCluster:
    StorageEncrypted: true
```

Deploy the storage with the environment and not the workload.

`copilot env deploy`

## Setup Gotchas
Try and initially deploy an ECS service that does not require other services to pass the ALB health check. 


## Existing 

Take note existing ALB and ECS cluster cannot be used. :disappointed_relieved: 

Register your workspace or download existing workspace
`copilot app init`

Environment init and modify manifest.yml with existing VPC and subnets.
`copilot env init`

copilot env deploy takes the configurations in your environment manifest and deploys your environment infrastructure.
`copilot env deploy`

Create a new service in the existing copilot app
`copilot svc init`

Deploy the new service.
`copilot svc deploy`




## CodePipelines
This won't create your pipeline, but it will create some local files under copilot/pipelines that will be used when creating your pipeline.
`copilot pipeline init`

Add the Codepipeline manifest files to the repo.
`git add copilot/ && git commit -m "Adding pipeline artifacts" && git push`

Creates a CodePipeline in the same account and region as your application and kicks off a pipeline execution.
`copilot pipeline deploy`

## CodeBuild

For Nodejs 14:
- Codebuild environment Ubuntu standard 5.0

```
phases:
  install:
    runtime-versions:
      nodejs: 14
```

For Nodejs 16
- Codebuild environment Amazon Linux standard 4.0
- Codebuild environment Ubuntu standard 6.0

```
phases:
  install:
    runtime-versions:
      nodejs: 16
```

Define codebuild environment in manifest.yml
```
build:
  image: aws/codebuild/amazonlinux2-x86_64-standard:4.0

```

Clean up
`copilot app delete`


## Parameter store environment variable file 

For runtime environment variables

`copilot secret init --cli-input-yaml input.yml --overwrite`

Release pipeline

input.yml:

```
BASIC_ACC_1_U:
  staging-ecs: massive
```
