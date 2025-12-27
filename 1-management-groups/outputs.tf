output "mg_ids" {
  value = {
    root          = data.azurerm_management_group.root.id
    platform      = azurerm_management_group.platform.id
    identity      = azurerm_management_group.identity.id
    management    = azurerm_management_group.management.id
    connectivity  = azurerm_management_group.connectivity.id
    security      = azurerm_management_group.security.id

    landing_zones = azurerm_management_group.landing_zones.id
    internal      = azurerm_management_group.internal.id
    protected     = azurerm_management_group.protected.id
    external      = azurerm_management_group.external.id

    sandbox       = azurerm_management_group.sandbox.id
    decommissioned= azurerm_management_group.decommissioned.id
  }
}