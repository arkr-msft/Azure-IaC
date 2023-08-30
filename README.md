# Azure-IaC
This repo contains infrastructure as code for deployment of specific resources to Azure

## Steps to deploy in Azure:

### 1. Verify azure-cli is installed. Install if not present.
pip freeze | less
pip install azure-cli

### 2. Login to Azure from terminal
az login --use-device-code

### 3. Set subscription 
az account set --subscription mysubscription

### 4. Executed the main.bicep file via Azure CLI command:
az deployment sub create \
--name 'MainDeployment'$(date +"%Y-%m-%d") \
--location "eastus" \
--template-file main.bicep

## Alternate command for east us 2
az deployment sub create --name 'MainDeployment'$(date +"%Y-%m-%d") --location "eastus2" --template-file main.bicep

## Steps to remove resources 

### 1. Execute below command to delete RG and all resources in it
az group delete --name rgName

### 2. Below command can be used to delete specific resources
az resource delete \
  --resource-group arkr_msft \
  --name resourcename \
  --resource-type "Microsoft.CognitiveServices/accounts@2021-04-30"