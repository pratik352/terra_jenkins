provider "azurerm" {
  subscription_id = "80d37f3a-a7f6-405b-a0d0-e2d362572306"
  features {}
}

resource "azurerm_resource_group" "pratikterrajenkinsresource" {
  name     = "pratikterrajenkinsresource-rg"
  location = "West US"
}
