resource_group_name = "rg-devops-prod"
location            = "Central India"
subscription_id     = "7d7e4c65-1bfb-4455-b143-d0d76737869b"

acr_name = "acrdevopsprod123"

aks_name = "aks-prod"

enable_auto_scaling        = true
enable_monitoring          = false
log_analytics_workspace_id = null

# Removing user node pools for now to ensure we stay under the VCPU quota
node_pools = {}
