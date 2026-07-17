variable "username" {
  type = string
  description = "Username for the local account created on the new VM"
  default = "azureuser"
}

variable "resource_group_location" {
  type = string
  description = "Location of the resource group."
  default = "francecentral"
}

variable "resource_group_name_prefix" {
  type = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default = "rg"
}
