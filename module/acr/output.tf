output "acr_id" {
  description = "The ID of the Azure Container Registry."
  value       = azurerm_container_registry.acr.id
}

output "login_server" {
  description = "The login server URL for the ACR."
  value       = azurerm_container_registry.acr.login_server
}