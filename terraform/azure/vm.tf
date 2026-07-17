resource "azurerm_linux_virtual_machine" "focalboard" {
  name                  = "myVM"
  location              = azurerm_resource_group.homelab.location
  resource_group_name   = azurerm_resource_group.homelab.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = "Standard_D2ads_v7"

  priority        = "Spot"
  eviction_policy = "Deallocate"
  max_bid_price   = -1

  zone = "3"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = data.azurerm_platform_image.homelab.publisher
    offer     = data.azurerm_platform_image.homelab.offer
    sku       = data.azurerm_platform_image.homelab.sku
    version   = data.azurerm_platform_image.homelab.version
  }

  computer_name  = "cloudlab"
  admin_username = var.username

  admin_ssh_key {
    username   = var.username
    public_key = azapi_resource_action.ssh_public_key_gen.output.publicKey
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  }
}

data "azurerm_platform_image" "homelab" {
  location = azurerm_resource_group.homelab.location
  publisher = "Debian"
  offer = "debian-13"
  sku = "13"
} # will look up the marketplace and fetch the most recent versionI can use. Should be x64
