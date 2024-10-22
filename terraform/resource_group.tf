resource "azurerm_resource_group" "lineten-assignment-resource-group" {
  name     = "lineten-resource-group-${var.environment_name}"
  location = var.resource_group_location
  tags = {
    environment = var.environment_name
  }
}