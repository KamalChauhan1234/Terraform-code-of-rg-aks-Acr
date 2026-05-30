resource_group_name = "rg-devops-prod"
location            = "Central India"
subscription_id     = "7d7e4c65-1bfb-4455-b143-d0d76737869b"

acr_name = "acrdevopsprod123"

aks_name = "aks-prod"

enable_auto_scaling        = true
enable_monitoring          = false
log_analytics_workspace_id = null

# Reduced node counts and switched to Standard_B2s (v1) to fit in quota
node_pools = {

  app1 = {
    vm_size             = "Standard_B2s"
    node_count          = 1
    min_count           = 1
    max_count           = 2
    enable_auto_scaling = true
  }

}