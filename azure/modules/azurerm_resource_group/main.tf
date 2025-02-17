#Provider section
terraform {
  required_version = ">=1.10.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.19.0"
    }
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
  name     = var.resource_group_name
  location = var.location
  
  tags = local.common_tags
}