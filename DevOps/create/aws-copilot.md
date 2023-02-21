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

init will create a console/manifest.yml

Yes deploy a test environment.

`copilot init`

To create a production environment.

```
copilot env init
copilot svc deploy
```

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


Restore existing service manifest file
`copilot svc show -n mysvc --manifest test > copilot/mysvc/manifest.yml`


## CodePipelines
This won't create your pipeline, but it will create some local files under copilot/pipelines that will be used when creating your pipeline.
`copilot pipeline init`

Add the Codepipeline manifest files to the repo.
`git add copilot/ && git commit -m "Adding pipeline artifacts" && git push`

Creates a CodePipeline in the same account and region as your application and kicks off a pipeline execution.
`copilot pipeline deploy`

## CodeBuild

For NodeJS 14 use:
- Ubuntu standard 5
```
phases:
  install:
    runtime-versions:
      ruby: 2.7
      nodejs: 14
```

Clean up
`copilot app delete`
