provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id            = "00000000-0000-0000-0000-000000000000"
  skip_provider_registration = true
}
