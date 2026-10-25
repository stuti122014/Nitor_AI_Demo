# ==============================================================================
# Modular Infrastructure Deployment for Nitor AI Demo
# Target Azure Subscription: Ascendion Nitor Daas-Platform (37edf351-2797-441e-8f2a-b27c5a9ed9e2)
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

# 3. Modular Key Vault
module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  keyvault_name       = var.keyvault_name
  tenant_id           = "d7758e8f-1df3-489f-86b5-a2254f55f9cc"
  tags                = local.common_tags
}

# 4. Modular Container Registry
module "acr" {
  source              = "./modules/acr"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  acr_name            = var.acr_name
  tags                = local.common_tags
}

# 5. Modular Azure Kubernetes Service
module "aks" {
  source              = "./modules/aks"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  cluster_name        = var.aks_cluster_name
  node_count          = var.aks_node_count
  vm_size             = "Standard_B2s"
  subnet_id           = module.network.backend_subnet_id
  tags                = local.common_tags
}

# 6. Modular PostgreSQL Flexible Server
module "postgresql" {
  source              = "./modules/postgresql"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  server_name         = var.db_server_name
  delegated_subnet_id = module.network.database_subnet_id
  storage_mb          = 32768
  sku_name            = "B_Standard_B1ms"
  tags                = local.common_tags
}
