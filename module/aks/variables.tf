variable "aks_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be created."
  type        = string
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry for role assignment."
  type        = string
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for the default node pool."
  type        = bool
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

variable "kubernetes_version" {
  description = "The Kubernetes version for the AKS cluster."
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

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}