output "resource_group_name" {
  value       = module.resource_group.name
  description = "The provisioned resource group name"
}

output "virtual_network_name" {
  value       = module.network.vnet_name
  description = "Virtual Network name"
}

output "kubernetes_cluster_name" {
  value       = module.aks.cluster_name
  description = "Managed AKS Cluster name"
}

output "container_registry_login_server" {
  value       = module.acr.login_server
  description = "ACR login endpoint"
}

output "key_vault_uri" {
  value       = module.keyvault.vault_uri
  description = "Key Vault endpoint"
}

output "database_fqdn" {
  value       = module.postgresql.fqdn
  description = "PostgreSQL Flexible Server FQDN"
}

output "key_vault_db_username_secret_id" {
  value       = module.keyvault.db_username_secret_id
  description = "Key Vault Secret ID for DB username"
}

output "key_vault_db_password_secret_id" {
  value       = module.keyvault.db_password_secret_id
  description = "Key Vault Secret ID for DB password"
}

output "aks_frontend_workload_subnet_id" {
  value       = module.aks.frontend_workload_subnet_id
  description = "Auto-selected VNet frontend subnet for frontend workload ingress"
}

output "aks_backend_workload_subnet_id" {
  value       = module.aks.backend_workload_subnet_id
  description = "Auto-selected VNet backend subnet for backend compute services"
}
