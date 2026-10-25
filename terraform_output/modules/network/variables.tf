variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = string
}

variable "frontend_subnet_cidr" {
  type = string
}

variable "backend_subnet_cidr" {
  type = string
}

variable "database_subnet_cidr" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
