# Azure-IaC
This repo contains infrastructure as code for deployment of specific resources to Azure

## Steps to deploy in Azure:

### 1. Verify & Install azure-cli is installed
pip freeze | less
pip install azure-cli

### 2. Login to Azure from terminal
az login --use-device-code

### 3. Set subscription 
az account set --subscription mysubscription

### 4. Executed the main.bicep file via Azure CLI command:
az deployment sub create \
--name 'MainDeployment'$(date +"%Y-%m-%d") \
--location <location> \
--template-file main.bicep


## Steps to remove resources 

### 1. Execute below command
az group delete --name rgName
