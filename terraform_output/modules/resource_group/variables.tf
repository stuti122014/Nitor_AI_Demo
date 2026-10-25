variable "name" {
  type        = string
  description = "The name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "The Azure region for resources"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to all resources"
}
