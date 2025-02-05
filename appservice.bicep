param location string = 'Brazil South'
param appServicePlanName string = 'lab-devops-plan'
param appServiceName string = 'lab-devops-webapp-linux'
param resourceGroupName string = 'lab-devops-rg'
param skuName string = 'B1'  // Cambia a F1 (Free) o S1 (Standard) si lo necesitas.

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: skuName
    tier: 'Basic'
    capacity: 1
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'
    }
  }
}
