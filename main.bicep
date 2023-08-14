// Documentation: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview
// Bicep Playground: https://bicepdemo.z22.web.core.windows.net/
// Bicep source github repo: arkr-msft/Azure-IaC
// License: MIT

// This file is the main bicep file that will be used to deploy the resources in Azure. It will call required module files to deploy the resources.

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
var v_cognitiveServicesName = 'arkr-msft-cogsvc'

//OpenAI SKU:
var v_sku = 'S0'

//Cognitive Services Kind:
var v_kind = 'OpenAI'
var v_custom_subdomain_name = v_cognitiveServicesName

// Resource Group module - creates the resource group - parameters are passed in from the variables above
module rg 'modules/resource_group.bicep' = {
//  scope: subscription()
  name: v_resourceGroupName
  params: {
    p_rgName: v_resourceGroupName
    p_rgLocation: v_rgLocation
    p_tags: v_tags
  }
}

// Cognitive Services module - creates the cognitive services account - parameters are passed in from the variables above
module cs 'modules/cognitive_services.bicep' = {
  scope: resourceGroup(rg.name)
  name: v_cognitiveServicesName
  dependsOn: [
    rg
  ]
  params: {
    p_openAiName: v_cognitiveServicesName 
    p_location: v_rgLocation
    p_tags: v_tags 
    p_sku: v_sku
    p_kind: v_kind
    p_custom_subdomain_name: v_custom_subdomain_name
  }
}

