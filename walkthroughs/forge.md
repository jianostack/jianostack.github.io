[Forge.laravel.com](https://forge.laravel.com) manages AWS for us. This guide is based off this video series over at [serversforhackers.com](https://serversforhackers.com/scaling-laravel/forge)

## Setup

Let's create the following:

*   project-lb
*   project-cache
*   project-app1
*   project-app2
*   project-db (not managed by Forge)

## Load balancer

Create the server:

*   Spec: t2.small size
*   No database
*   Select Provision As Load Balancer

## Cache

Create the Redis cache server:

*   Spec: t2.small size
*   Reference the server [specs here](http://massiveinfinity.atlassian.net/wiki/spaces/MI/pages/104980067/Laravel+hosting)
*   No database
*   Restrict port 22 to forge servers and your static IP
*   Run cache recipe.

## App servers

Create the app servers:

*   Spec: t2.small size
*   No database
*   Run app recipe

## Network App servers

*   can connect to the cache server

## Database

Go to the AWS management console and create an RDS instance:

*   Spec: db.t2.small

Navigate to it's security group and allow the app servers to connect inbound. Office IP should be automatically added. I suggest you create a new MYSQL user.

## Bucket

Create a new S3 bucket and a new IAM user:

https://gist.github.com/jianliyow/82bd7557e8de3f0cbaa457080bc78767

## Deploy the project

Point domain name to load balancer:

*   A record: @
*   CNAME www

Inside the load balancer page add a new site. Add a new site. Navigate into the site and select the servers you want to balance.

## Redis

In our sites .env edit the following: 

``` 
CACHE_DRIVER=redis 
SESSION_DRIVER=redis 
REDIS_HOST=local_ip 

```

## Sites

Inside the app servers, add a new site. Connect the Bitbucket repository to the site. Create the SSL cert with LetsEncrypt (Beta).
