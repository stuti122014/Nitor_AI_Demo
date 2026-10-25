variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "keyvault_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "db_admin_username" {
  type    = string
  default = "psqladmin"
}

variable "db_admin_password" {
  type      = string
  sensitive = true
  default   = "NitorSecure@2026!"
}

variable "tags" {
  type    = map(string)
  default = {}
}
