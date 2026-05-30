output "aks_id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_name" {
  description = "The name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools."
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "kubelet_identity" {
  description = "The identity object for the kubelet."
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity
}