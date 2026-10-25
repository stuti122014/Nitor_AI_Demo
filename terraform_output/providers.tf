provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id            = "4f12f3dd-584c-4465-8c36-0bdac946f2be"
  skip_provider_registration = true
}
