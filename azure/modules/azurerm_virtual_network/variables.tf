variable "account_tier" {
  description = "Storage account's tier."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "location" {
  description = "Region where the resources will be created."
  type        = string
  default     = "Brazil South"
}

variable "resource_group_name" {
  type    = string
  default = "terraform_resource_group"
}

variable "storage_account_name" {
  type    = string
  default = "chrystianbarrosstaccount"
}

variable "storage_container_name" {
  type    = string
  default = "chrystianbarrosstcontainer"
}