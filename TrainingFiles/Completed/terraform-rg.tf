terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.34.0"
    }
  }
}


# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "demo-365-rg" {
  name     = "demo02-365-rg"
  location = "West Europe"
}

