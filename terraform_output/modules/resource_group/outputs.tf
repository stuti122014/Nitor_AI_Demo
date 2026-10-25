output "name" {
  value       = azurerm_resource_group.rg.name
  description = "The provisioned resource group name"
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "The resource group location"
}

output "id" {
  value       = azurerm_resource_group.rg.id
  description = "Resource group ID"
}
