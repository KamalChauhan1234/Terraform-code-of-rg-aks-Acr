resource_group_name = "rg-devops-prod"
location            = "Central India"
subscription_id     = "7d7e4c65-1bfb-4455-b143-d0d76737869b"

acr_name = "acrdevopsprod123"

aks_name = "aks-prod"

enable_auto_scaling        = true
enable_monitoring          = false
log_analytics_workspace_id = null

node_pools = {

  app1 = {
    vm_size             = "Standard_DS2_v2"
    node_count          = 2
    min_count           = 1
    max_count           = 5
    enable_auto_scaling = true
  }

  app2 = {
    vm_size             = "Standard_DS3_v2"
    node_count          = 2
    min_count           = 1
    max_count           = 4
    enable_auto_scaling = true
  }
}