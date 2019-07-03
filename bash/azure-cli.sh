# azure-cli, nodejs-legacy, npm, zip
sudo apt-get update
sudo apt-get install -y nodejs-legacy npm zip
sudo npm install -y azure-cli -g

## Log into Azure cli

`az account set --subscription id-id-id-id-id`

`az acr login --name registry_name`

## Azure Containers

`az acr repository show-tags --name registry_name --repository image_name`
