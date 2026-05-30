variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "subscription_id" {
  description = "The Azure Subscription ID."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "aks_name" {
  description = "The name of the Azure Kubernetes Service cluster."
  type        = string
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for the default node pool."
  type        = bool
  default     = true
}

variable "enable_monitoring" {
  description = "Enable Azure Monitor for containers."
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace for monitoring."
  type        = string
  default     = null
}

variable "node_pools" {
  description = "A map of additional node pools to create."
  type = map(object({
    vm_size             = string
    node_count          = number
    min_count           = number
    max_count           = number
    enable_auto_scaling = bool
  }))
}