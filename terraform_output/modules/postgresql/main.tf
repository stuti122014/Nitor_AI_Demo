resource "azurerm_postgresql_flexible_server" "db" {
  name                   = var.server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "15"
  delegated_subnet_id    = var.delegated_subnet_id
  administrator_login    = "psqladmin"
  administrator_password = "SecurePassword@2026!"
  storage_mb             = var.storage_mb
  sku_name               = var.sku_name
  backup_retention_days  = 7
  tags                   = var.tags
}
