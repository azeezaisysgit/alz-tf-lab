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
  subscription_id = "adc00d4f-f770-4d2d-ae2d-d6832f0cd0a5"
}

data "azurerm_client_config" "current" {}
