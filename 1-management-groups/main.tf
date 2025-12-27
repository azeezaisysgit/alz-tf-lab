terraform {
  required_version = ">= 1.6.0"

required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.110"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "root_management_group_id" {
  type        = string
  description = "Tenant Root MG ID"
  default     = "33511258-7b0d-4c95-88ae-d819e1fcf22d"
}

data "azurerm_management_group" "root" {
  name = var.root_management_group_id
}

# -------------------------
# Platform MG
# -------------------------
resource "azurerm_management_group" "platform" {
  display_name               = "Platform"
  parent_management_group_id = data.azurerm_management_group.root.id
}

resource "azurerm_management_group" "identity" {
  display_name               = "Identity"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "management" {
  display_name               = "Management"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "connectivity" {
  display_name               = "Connectivity"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "security" {
  display_name               = "Security"
  parent_management_group_id = azurerm_management_group.platform.id
}

# -------------------------
# Landing Zones MGs (DoE)
# -------------------------
resource "azurerm_management_group" "landing_zones" {
  display_name               = "Landing Zones"
  parent_management_group_id = data.azurerm_management_group.root.id
}

resource "azurerm_management_group" "internal" {
  display_name               = "Internal"
  parent_management_group_id = azurerm_management_group.landing_zones.id
}

resource "azurerm_management_group" "protected" {
  display_name               = "Protected"
  parent_management_group_id = azurerm_management_group.landing_zones.id
}

resource "azurerm_management_group" "external" {
  display_name               = "External"
  parent_management_group_id = azurerm_management_group.landing_zones.id
}

# -------------------------
# Sandbox & Decommissioned
# -------------------------
resource "azurerm_management_group" "sandbox" {
  display_name               = "Sandbox"
  parent_management_group_id = data.azurerm_management_group.root.id
}

resource "azurerm_management_group" "decommissioned" {
  display_name               = "Decommissioned"
  parent_management_group_id = data.azurerm_management_group.root.id
}