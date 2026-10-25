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
  default = "10.0.1.0/24"
}

variable "backend_subnet_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "database_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "aks_cluster_name" {
  type    = string
  default = "aks-nitor-ai-prod"
}

variable "aks_node_count" {
  type    = number
  default = 2
}

variable "keyvault_name" {
  type    = string
  default = "kv-nitor-ai-prod"
}

variable "acr_name" {
  type    = string
  default = "acrnitoraiprod"
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

variable "environment" {
  type    = string
  default = "production"
}
