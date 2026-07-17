resource "azurerm_storage_account" "my_storage_account" {
  name = "diag${random_id.random_id.hex}"
  location = azurerm_resource_group.homelab.location
  resource_group_name = azurerm_resource_group.homelab.name
  account_tier = "Standard"
  account_replication_type = "LRS"
} # for boot diagnostics

resource "random_id" "random_id" {
  keepers = {
    resource_group = azurerm_resource_group.homelab.name
  }
  byte_length = 8
}

