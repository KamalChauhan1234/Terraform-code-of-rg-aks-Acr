variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the ACR will be created."
  type        = string
}

variable "sku" {
  description = "The SKU name of the Azure Container Registry."
  type        = string
  default     = "Premium"
}