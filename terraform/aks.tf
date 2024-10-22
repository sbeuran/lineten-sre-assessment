resource "azurerm_kubernetes_cluster" "lineten-assignment-aks" {
  name                = "lineten-aks"
  location            = azurerm_resource_group.lineten-assignment-resource-group.location
  resource_group_name = azurerm_resource_group.lineten-assignment-resource-group.name
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_node_type
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment_name
  }
}
