terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# --- Core DoE MG design ---
# Tenant Root
#  └── doe
#      ├── platform
#      │   ├── identity
#      │   ├── management
#      │   └── connectivity
#      ├── landingzones
#      │   ├── internal
#      │   ├── protected
#      │   └── external
#      ├── sandbox
#      └── decommissioned

resource "azurerm_management_group" "doe" {
  display_name               = upper("${var.org_prefix}")
  name                       = "${var.org_prefix}"
  parent_management_group_id = var.tenant_root_mg_id
}

resource "azurerm_management_group" "platform" {
  display_name               = "Platform"
  name                       = "${var.org_prefix}-platform"
  parent_management_group_id = azurerm_management_group.doe.id
}

resource "azurerm_management_group" "platform_identity" {
  display_name               = "Identity"
  name                       = "${var.org_prefix}-platform-identity"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "platform_management" {
  display_name               = "Management"
  name                       = "${var.org_prefix}-platform-management"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "platform_connectivity" {
  display_name               = "Connectivity"
  name                       = "${var.org_prefix}-platform-connectivity"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "landingzones" {
  display_name               = "Landing Zones"
  name                       = "${var.org_prefix}-landingzones"
  parent_management_group_id = azurerm_management_group.doe.id
}

resource "azurerm_management_group" "lz_internal" {
  display_name               = "Internal"
  name                       = "${var.org_prefix}-lz-internal"
  parent_management_group_id = azurerm_management_group.landingzones.id
}

resource "azurerm_management_group" "lz_protected" {
  display_name               = "Protected"
  name                       = "${var.org_prefix}-lz-protected"
  parent_management_group_id = azurerm_management_group.landingzones.id
}

resource "azurerm_management_group" "lz_external" {
  display_name               = "External"
  name                       = "${var.org_prefix}-lz-external"
  parent_management_group_id = azurerm_management_group.landingzones.id
}

resource "azurerm_management_group" "sandbox" {
  display_name               = "Sandbox"
  name                       = "${var.org_prefix}-sandbox"
  parent_management_group_id = azurerm_management_group.doe.id
}

resource "azurerm_management_group" "decommissioned" {
  display_name               = "Decommissioned"
  name                       = "${var.org_prefix}-decommissioned"
  parent_management_group_id = azurerm_management_group.doe.id
}
