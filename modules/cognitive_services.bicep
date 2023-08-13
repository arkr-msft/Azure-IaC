// bicep code for cognitive services deployment

param p_rgName string
param p_openAiName string
param p_tags object = {}


resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2021-04-30' = {
  name: p_openAiName
  location: resourceGroup().location
  sku: {
    name: 'S0'
  }
  kind: 'OpenAI'
  properties: {
    encryption: {
      keySource: 'Microsoft.CognitiveServices'
      keyVaultProperties: {
        keyName: 'cognitiveServicesKey'
        keyVaultUri: 'https://myKeyVault.vault.azure.net'
        keyVersion: 'cognitiveServicesKeyVersion'
      }
    }
  }
}
