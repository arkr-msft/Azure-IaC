// bicep code for cognitive services deployment

resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2021-04-30' = {
  name: 'cognitiveServices'
  location: resourceGroup().location
  sku: {
    name: 'S0'
  }
  kind: 'TextAnalytics'
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
