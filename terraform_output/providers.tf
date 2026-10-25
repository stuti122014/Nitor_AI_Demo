provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id            = "37edf351-2797-441e-8f2a-b27c5a9ed9e2"
  skip_provider_registration = true
}
