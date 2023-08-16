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
  public_network_access_enabled  = var.public_network_access_enabled

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
    for_each = lookup(var.settings, "network_rulesets", {}) != {} ? [1] : []
    content {
      default_action                 = lookup(var.settings.network_rulesets, "default_action", null)
      trusted_service_access_enabled = lookup(var.settings.network_rulesets, "trusted_service_access_enabled", true)
      dynamic "virtual_network_rule" {
        for_each = lookup(var.settings.network_rulesets, "virtual_network_rule", {}) != {} ? [1] : []
        content {
          subnet_id                                       = lookup(var.settings.network_rulesets.virtual_network_rule, "subnet_id", null)
          ignore_missing_virtual_network_service_endpoint = lookup(var.settings.network_rulesets.virtual_network_rule, "ignore_missing_virtual_network_service_endpoint", false)
        }
      }

      dynamic "ip_rule" {
        for_each = lookup(var.settings.network_rulesets, "ip_rule", {}) != {} ? [1] : []
        content {
          ip_mask = lookup(var.settings.network_rulesets.ip_rule, "ip_mask", null)
          action  = lookup(var.settings.network_rulesets.ip_rule, "action", null)
        }
      }
    }
  }
}

