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

## Uploads to Azure Blob
Go to W3 Total cache plugin, general settings page and activate Azure CDN
Go to the CDN page and fill in the access details (Azure Storage blob > access keys)
Got to the advanced section and check 'Use CDN links for the Media Library on admin pages'

## Migrate AWS S3 to Azure Blob
Install AzCopy https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10
Login to AzCopy
Assign Storage Blob Data Reader Role to your account https://learn.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal
Execute S3 to Azure command
Apply CORS policy to Azure blob storage
Purge W3tc cache from appropiate pages

## Outbound email
