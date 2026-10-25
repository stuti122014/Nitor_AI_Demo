variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "server_name" {
  type = string
}

variable "delegated_subnet_id" {
  type = string
}

variable "administrator_login" {
  type    = string
  default = "psqladmin"
}

variable "administrator_password" {
  type      = string
  sensitive = true
  default   = "NitorSecure@2026!"
}

variable "storage_mb" {
  type    = number
  default = 32768
}

variable "sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "tags" {
  type    = map(string)
  default = {}
}
