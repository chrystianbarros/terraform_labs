variable "location" {
  description = "Region where the resources will be created."
  type        = string
  default     = "Brazil South"
}

variable "resource_group_name" {
  type = string
    default = "terraform_resource_group"
}