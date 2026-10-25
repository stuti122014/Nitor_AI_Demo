# ==============================================================================
# Modular Infrastructure Deployment for Nitor AI Demo
# Target Azure Subscription: Azure Demo Subscription (4f12f3dd-584c-4465-8c36-0bdac946f2be)
# ==============================================================================
# AzureRM Resources Provisioned via Modular Architecture:
# - azurerm_resource_group
# - azurerm_virtual_network
# - azurerm_subnet (frontend-subnet, backend-subnet, db-subnet)
# - azurerm_container_registry
# - azurerm_key_vault
# - azurerm_kubernetes_cluster
# - azurerm_postgresql_flexible_server
# ==============================================================================

locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "AI-MultiCloud-Platform"
    Repository  = "stuti122014/Nitor_AI_Demo"
    Owner       = "stuti.srivastava@nitorinfotech.com"
  }
}

# 1. Modular Resource Group
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

# 2. Modular Network (3 Isolated Subnets)
module "network" {
  source               = "./modules/network"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  vnet_name            = var.vnet_name
  address_space        = var.vnet_cidr
  frontend_subnet_cidr = var.frontend_subnet_cidr
  backend_subnet_cidr  = var.backend_subnet_cidr
  database_subnet_cidr = var.database_subnet_cidr
  tags                 = local.common_tags
}

# 3. Modular Key Vault (Storing DB secrets securely)
module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  keyvault_name       = var.keyvault_name
  tenant_id           = "d7758e8f-1df3-489f-86b5-a2254f55f9cc"
  sku_name            = var.keyvault_sku
  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password
  tags                = local.common_tags
}

# 4. Modular Container Registry
module "acr" {
  source              = "./modules/acr"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  acr_name            = var.acr_name
  sku                 = var.acr_sku
  tags                = local.common_tags
}

# 5. Modular Azure Kubernetes Service (VNet Full Range with Auto-Selected Subnets)
module "aks" {
  source              = "./modules/aks"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  cluster_name        = var.aks_cluster_name
  kubernetes_version  = var.aks_kubernetes_version
  node_count          = var.aks_node_count
  vm_size             = var.aks_vm_size
  subnet_id           = module.network.backend_subnet_id
  frontend_subnet_id  = module.network.frontend_subnet_id
  tags                = local.common_tags
}

# 6. Modular PostgreSQL Flexible Server (Secured via Key Vault Credentials)
module "postgresql" {
  source                 = "./modules/postgresql"
  resource_group_name    = module.resource_group.name
  location               = module.resource_group.location
  server_name            = var.db_server_name
  delegated_subnet_id    = module.network.database_subnet_id
  administrator_login    = var.db_admin_username
  administrator_password = var.db_admin_password
  storage_mb             = var.db_storage_mb
  sku_name               = var.db_sku_name
  tags                   = local.common_tags
}
