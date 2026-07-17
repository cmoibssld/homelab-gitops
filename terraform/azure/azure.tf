provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "homelab" {
  name = "homelab-gitops"
  location = var.resource_group_location
}
