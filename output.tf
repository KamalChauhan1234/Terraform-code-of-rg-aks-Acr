output "aks_name" {
  description = "The name of the AKS cluster."
  value       = module.aks.aks_name
}

output "aks_id" {
  description = "The ID of the AKS cluster."
  value       = module.aks.aks_id
}

output "acr_login_server" {
  description = "The login server URL for the ACR."
  value       = module.acr.login_server
}

output "kube_config" {
  description = "Raw Kubernetes config."
  value       = module.aks.kube_config
  sensitive   = true
}