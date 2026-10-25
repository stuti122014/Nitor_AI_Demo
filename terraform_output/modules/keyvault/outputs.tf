output "id" {
  value = azurerm_key_vault.kv.id
}

output "vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}

output "name" {
  value = azurerm_key_vault.kv.name
}

output "db_username_secret_id" {
  value = azurerm_key_vault_secret.db_username.id
}

output "db_password_secret_id" {
  value = azurerm_key_vault_secret.db_password.id
}
