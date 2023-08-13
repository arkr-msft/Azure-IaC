// Documentation: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview
// Bicep Playground: https://bicepdemo.z22.web.core.windows.net/
// Bicep source github repo: arkr-msft/Azure-IaC
// License: MIT

// This file is the main bicep file that will be used to deploy the resources in Azure. It will call required module files to deploy the resources.
// This file is executed by the Azure CLI command: az deployment group create -f main.bicep -g arkr_msft --mode Complete

targetScope = 'subscription'

// Variables - (preset in the file to prevent prompting for input)

var v_resourceGroupName = 'arkr_msft'
var v_rgLocation = 'eastus'
var v_environment = 'learn'
var v_tags = {
  template_source: 'github.com/arkr-msft/Azure-IaC'
  created_via: 'bicep'
  Environment: v_environment
}

// Resource Group module - creates the resource group - parameters are passed in from the variables above
module resourceGroup 'modules/resource_group.bicep' = {
  name: v_resourceGroupName
  params: {
    p_rgName: v_resourceGroupName
    p_rgLocation: v_rgLocation
    p_tags: v_tags
  }
}


// module cognitiveServices 'modules/cognitiveservices.bicep' = {
//  name: cognitiveServicesName
//  location: location
//  params: {
//    sku: sku
//    kind: kind
//    resourceGroup: resourceGroup
//    tags: tagsJoined
//  }
// }

