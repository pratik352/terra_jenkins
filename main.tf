provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "pratikterrajenkinsresource" {
  name     = "pratikterrajenkinsresource-rg"
  location = "West US"
}
