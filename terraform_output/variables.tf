variable "resource_group_name" {
  type        = string
  default     = "rg-nitor-ai-prod"
  description = "Target Azure Resource Group"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure Region"
}

variable "vnet_name" {
  type    = string
  default = "vnet-nitor-ai-prod"
}

variable "vnet_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "frontend_subnet_cidr" {
  type    = string
  default = "[REDACTED_IPV4_ADDRESS_1]/24"
}

variable "backend_subnet_cidr" {
  type    = string
  default = "[REDACTED_IPV4_ADDRESS_2]/24"
}

variable "database_subnet_cidr" {
  type    = string
  default = "[REDACTED_IPV4_ADDRESS_3]/24"
}

variable "aks_cluster_name" {
  type    = string
  default = "aks-nitor-ai-prod"
}

variable "aks_kubernetes_version" {
  type    = string
  default = "1.34"
}

variable "aks_node_count" {
  type    = number
  default = 3
}

variable "aks_vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "keyvault_name" {
  type    = string
  default = "kv-nitor-ai-prod"
}

variable "keyvault_sku" {
  type    = string
  default = "standard"
}

variable "acr_name" {
  type    = string
  default = "acrnitoraiprod"
}

variable "acr_sku" {
  type    = string
  default = "Basic"
}

variable "db_server_name" {
  type    = string
  default = "psql-nitor-ai-prod"
}

variable "db_admin_username" {
  type        = string
  default     = "psqladmin"
  description = "Database administrator username"
}

variable "db_admin_password" {
  type        = string
  sensitive   = true
  default     = "NitorSecure@2026!"
  description = "Database administrator password saved in Key Vault"
}

variable "db_storage_mb" {
  type    = number
  default = 32768
}

variable "db_sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "environment" {
  type    = string
  default = "production"
}
