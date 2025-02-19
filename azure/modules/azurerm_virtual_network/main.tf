terraform {
  required_version = ">=1.10.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.19.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform_resource_group"                  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "chrystianbarrosstaccount"                  # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "chrystianbarrosstcontainer"                # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "azurerm_virtual_network/terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

#Resource section
resource "azurerm_resource_group" "resource_group" {
  name     = "terraform_resource_group_2"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "terraform_virtual_network"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = ["172.16.0.0/16"]

  tags = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "terraform_subnet"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["172.16.1.0/24"]
}

resource "azurerm_network_security_group" "network_security_group" {
  name                = "terraform_network_security_group"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  tags = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}