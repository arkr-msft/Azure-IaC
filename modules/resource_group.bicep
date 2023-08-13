//bicep code to create a new resource group

targetScope = 'subscription'

param p_rgName string
param p_rgLocation string
param p_tags object = {}

resource rg 'Microsoft.Resources/resourceGroups@2018-05-01' = {
  location: p_rgLocation
  name: p_rgName
  properties: {}
  tags: p_tags
}

output rgId string = rg.id
output rgName string = rg.name
output rgLocation string = rg.location
output rgTags object = rg.tags
