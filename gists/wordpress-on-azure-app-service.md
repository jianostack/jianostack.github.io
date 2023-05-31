# Wordpress on Azure App service setup

## New resource
Create a new resource and search for 'WordPress on App Service'.
Use standard plan
Tick create blob storage box
Take note of mysql password on the review tab

## SSH jump server
Launch a new Ubuntu instance
Under networking create a new subnet 
Save private key
Whitelist port 22

## Connect to MYSQL via SSH
Load MYSQL and jump server SSH details into TablePlus
Once connected create a new user and export TablePlus connection

## Github action Build and deploy PHP app to Azure Web App
Go to the repository and then the actions page
Create a new workflow, search for Deploy a PHP app to an Azure Web App
See instructions on workflow yml to configure Github permissions
- create service principle
- download publish profile
- add to Github secrets

## Uploads to Azure Blob
Go to W3 Total cache plugin, general settings page and activate Azure CDN
Go to the CDN page and fill in the access details (Azure Storage blob > access keys)
Got to the advanced section and check 'Use CDN links for the Media Library on admin pages'

## Migrate AWS S3 to Azure Blob
Copy AWS S3 bucket to local with `aws s3 cp s3://bucket-name destination --recursive`
Upload media to Azure blob storage with Microsoft Azure Storage Explorer
Apply CORS policy to Azure blob storage
Purge W3tc cache from appropiate pages

## Outbound email
Create an SendGrid account within the resource group

## Redirect root domain to www
Azure app services lets you assign custom domains to the app but I could not figure out how to redirect them. I tried .htaccess, nginx.conf and web.config.

I eventually used CloudFlare DNS to do the root domain redirect to www.

https://developers.cloudflare.com/fundamentals/get-started/basic-tasks/manage-subdomains/#redirect-root-domain-to-a-subdomain
