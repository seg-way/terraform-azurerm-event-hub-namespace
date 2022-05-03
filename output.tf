output "id" {
  description = "The EventHub Namespace ID."
  value       = azurerm_eventhub_namespace.evh.id
}

output "name" {
  description = "The EventHub Namespace name."
  value       = azurerm_eventhub_namespace.evh.name
}

output "default_primary_connection_string" {
  description = "The primary connection string"
  value       = azurerm_eventhub_namespace.evh.default_primary_connection_string
  sensitive   = true
}

output "default_primary_connection_string_alias" {
  description = "The primary connection string alias"
  value       = azurerm_eventhub_namespace.evh.default_primary_connection_string_alias
  sensitive   = true
}

output "default_primary_key" {
  description = "The primary key"
  value       = azurerm_eventhub_namespace.evh.default_primary_key
  sensitive   = true
}

output "default_secondary_connection_string" {
  description = "The primary connection string"
  value       = azurerm_eventhub_namespace.evh.default_secondary_connection_string
  sensitive   = true
}

output "default_secondary_connection_string_alias" {
  description = "The secondary connection string alias"
  value       = azurerm_eventhub_namespace.evh.default_secondary_connection_string_alias
  sensitive   = true
}

output "default_secondary_key" {
  description = "The secondary key"
  value       = azurerm_eventhub_namespace.evh.default_secondary_key
  sensitive   = true
}