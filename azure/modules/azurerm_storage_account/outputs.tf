output "storage_account_id" {
  description = "Storage account ID"
  value       = azurerm_storage_account.storage_account.id
}

output "primary_access_key" {
  description = "Storage account primary access ID"
  value       = azurerm_storage_account.storage_account.primary_access_key
  sensitive   = true
}