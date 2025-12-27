terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-storage-rg"
    storage_account_name = "terraformstate277"
    container_name       = "tfstatefiles"
    key                  = "alz/0-bootstrap.tfstate"
  }
}