// Documentation: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview
// Bicep Playground: https://bicepdemo.z22.web.core.windows.net/
// Bicep source github repo: arkr-msft/Azure-IaC
// License: MIT

// This file is the main bicep file that will be used to deploy the resources in Azure. It will call required module files to deploy the resources.

//targetScope = 'subscription'

// Variables - (preset in the file to prevent prompting for input)

var v_resourceGroupName = 'arkr_msft'
var v_rgLocation = 'eastus'
var v_environment = 'learn'
var v_tags = {
  template_source: 'github.com/arkr-msft/Azure-IaC'
  created_via: 'bicep'
  Environment: v_environment
}
var v_cognitiveServicesName = 'arkr-msft-cogsvc'

// Resource Group module - creates the resource group - parameters are passed in from the variables above
module resourceGroup 'modules/resource_group.bicep' = {
  scope: subscription()
  name: v_resourceGroupName
  params: {
    p_rgName: v_resourceGroupName
    p_rgLocation: v_rgLocation
    p_tags: v_tags
  }
}

// Cognitive Services module - creates the cognitive services account - parameters are passed in from the variables above
module cognitiveServices 'modules/cognitive_services.bicep' = {
  scope: resourceGroup(v_resourceGroupName)
  name: v_cognitiveServicesNameq
  depends on: [
    resourceGroup
  ]
  params: {
    sku: sku
    kind: kind
    resourceGroup: resourceGroup
    tags: tagsJoined
    location: location  }
}

