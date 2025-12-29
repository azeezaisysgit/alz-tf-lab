output "mg_ids" {
  value = {
    doe                   = azurerm_management_group.doe.id
    platform              = azurerm_management_group.platform.id
    platform_identity     = azurerm_management_group.platform_identity.id
    platform_management   = azurerm_management_group.platform_management.id
    platform_connectivity = azurerm_management_group.platform_connectivity.id
    landingzones          = azurerm_management_group.landingzones.id
    lz_internal           = azurerm_management_group.lz_internal.id
    lz_protected          = azurerm_management_group.lz_protected.id
    lz_external           = azurerm_management_group.lz_external.id
    sandbox               = azurerm_management_group.sandbox.id
    decommissioned        = azurerm_management_group.decommissioned.id
  }
}