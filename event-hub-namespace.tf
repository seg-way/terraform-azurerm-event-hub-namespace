resource "azurerm_eventhub_namespace" "evh" {
  name                     = var.event_hub_namespace_name
  location                 = var.location
  resource_group_name      = var.rg_name
  sku                      = var.settings.sku
  capacity                 = try(var.settings.capacity, null)
  tags                     = var.tags
  auto_inflate_enabled     = try(var.settings.auto_inflate_enabled, null)
  dedicated_cluster_id     = try(var.settings.dedicated_cluster_id, null)
  maximum_throughput_units = try(var.settings.maximum_throughput_units, null)
  zone_redundant           = try(var.settings.zone_redundant, null)

  dynamic "identity" {
    for_each = length(var.identity_ids) == 0 && var.identity_type == "SystemAssigned" ? [var.identity_type] : []
    content {
      type = var.identity_type
    }
  }

  dynamic "identity" {
    for_each = length(var.identity_ids) > 0 || var.identity_type == "UserAssigned" ? [var.identity_type] : []
    content {
      type         = var.identity_type
      identity_ids = length(var.identity_ids) > 0 ? var.identity_ids : []
    }
  }

  dynamic "network_rulesets" {
    for_each = lookup(var.settings.network_rulesets, "network_rulesets" {}) != {} ? [1] : []
    content {
      default_action                 = network_rulesets.value.default_action #Possible values are Allow and Deny. Defaults to Deny.
      trusted_service_access_enabled = try(network_rulesets.value.trusted_service_access_enabled, null)

      dynamic "virtual_network_rule" {
        for_each = lookup(var.settings.network_rulesets.virtual_network_rule, "virtual_network_rule" {}) != {} ? [1] : []
        content {
          subnet_id                                       = virtual_network_rule.value.subnet_id
          ignore_missing_virtual_network_service_endpoint = try(virtual_network_rule.value.ignore_missing_virtual_network_service_endpoint, null)
        }
      }

      dynamic "ip_rule" {
        for_each = lookup(var.settings.network_rulesets.ip_rule, "ip_rule" {}) != {} ? [1] : []
        content {
          ip_mask = ip_rule.value.ip_mask
          action  = try(ip_rule.value.action, null)
        }
      }
    }
  }
}