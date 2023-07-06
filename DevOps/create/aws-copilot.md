<!-- Space: DOS -->
<!-- Parent: Create -->

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

Create a new Copilot app and first ECS service. Do not deploy a test environment.

```
copilot init
```

To create an environment. Do not deploy environment yet.

```
copilot env init
```

Create RDS storage

```
copilot storage init
```

Deploy environment now

```
copilot env deploy
```

After storage yml file is created add this line for encryption.

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

Use input.yml file to upload environment variables to AWS parameter store.

```
copilot secret init --cli-input-yaml input.yml
```

input.yml

```
<secret A>:
  <env 1>: <the value of secret A in env 1>
  <env 2>: <the value of secret A in env 2>
```

manifest.yml

```
environments:
    dev:
      secrets: 
        API_BASE_URL: /copilot/copilot-app/environment/secrets/API_BASE_URL

```

If you need the environment variables to be baked into the build the add them to the buildspec.yml

buildspec.yml

```
version: 0.2
env:
  variables:
    COPILOT_APPLICATION_NAME: copilot-app
    COPILOT_ENVIRONMENT_NAME: staging	
  parameter-store:
    NODE_ENV: /copilot/copilot-app/environment/secrets/NODE_ENV

```

https://aws.github.io/copilot-cli/docs/commands/secret-init/