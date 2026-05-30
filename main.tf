import {
  to = module.rg.azurerm_resource_group.rg
  id = "/subscriptions/7d7e4c65-1bfb-4455-b143-d0d76737869b/resourceGroups/rg-devops-prod"
}

import {
  to = module.acr.azurerm_container_registry.acr
  id = "/subscriptions/7d7e4c65-1bfb-4455-b143-d0d76737869b/resourceGroups/rg-devops-prod/providers/Microsoft.ContainerRegistry/registries/acrdevopsprod123"
}

import {
  to = module.aks.azurerm_kubernetes_cluster.aks
  id = "/subscriptions/7d7e4c65-1bfb-4455-b143-d0d76737869b/resourceGroups/rg-devops-prod/providers/Microsoft.ContainerService/managedClusters/aks-prod"
}

module "rg" {
  source = "./module/rg"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "acr" {
  source = "./module/acr"

  acr_name            = var.acr_name
  location            = var.location
  resource_group_name = module.rg.resource_group_name
}

module "aks" {
  source = "./module/aks"

  aks_name                   = var.aks_name
  location                   = var.location
  resource_group_name        = module.rg.resource_group_name
  acr_id                     = module.acr.acr_id
  node_pools                 = var.node_pools
  enable_auto_scaling        = var.enable_auto_scaling
  enable_monitoring          = var.enable_monitoring
  log_analytics_workspace_id = var.log_analytics_workspace_id
}