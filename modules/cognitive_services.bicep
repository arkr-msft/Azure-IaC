// bicep code for cognitive services deployment

param p_openAiName string
param p_location string
param p_tags object = {}
param p_sku string
param p_kind string

resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2021-04-30' = {
  name: p_openAiName
  location: p_location
  tags: p_tags
  sku: {
    name: p_sku
  }
  kind: p_kind
  properties: {
    disableLocalAuth: true
    networkAcls: {
      defaultAction: 'Deny'
      ipRules: []
      virtualNetworkRules: []
    }
  publicNetworkAccess: 'Enabled'
  }
}
