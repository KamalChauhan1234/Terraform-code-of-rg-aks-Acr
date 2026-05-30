resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.aks_name}-dns"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                 = "system"
    vm_size              = "Standard_DS2_v2"
    node_count           = var.enable_auto_scaling ? null : 3
    auto_scaling_enabled = var.enable_auto_scaling
    min_count            = var.enable_auto_scaling ? 1 : null
    max_count            = var.enable_auto_scaling ? 5 : null
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  dynamic "oms_agent" {
    for_each = var.enable_monitoring ? [1] : []

    content {
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "userpool" {
  for_each = var.node_pools

  name                  = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id

  vm_size    = each.value.vm_size
  node_count = each.value.enable_auto_scaling ? null : each.value.node_count

  auto_scaling_enabled = each.value.enable_auto_scaling
  min_count            = each.value.enable_auto_scaling ? each.value.min_count : null
  max_count            = each.value.enable_auto_scaling ? each.value.max_count : null

  mode = "User"

  tags = var.tags
}

resource "azurerm_role_assignment" "aks_acr" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}