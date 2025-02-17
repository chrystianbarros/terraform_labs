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
resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name
  storage_account_id    = ""
  container_access_type = "private"
}