resource "azurerm_public_ip" "homelab_publicIP" {
  name = "homelab_publicIP"
  location = azurerm_resource_group.homelab.location
  resource_group_name =  azurerm_resource_group.homelab.name
  allocation_method = "Static"
}

resource "azurerm_subnet" "homelab_subnet" {
  name = "mySubnet"
  resource_group_name = azurerm_resource_group.homelab.name
  virtual_network_name = azurerm_virtual_network.homelab_network.name
  address_prefixes = ["10.0.1.0/24"]

}

resource "azurerm_virtual_network" "homelab_network" {
  name = "myVnet"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.homelab.location
  resource_group_name = azurerm_resource_group.homelab.name
}

resource "azurerm_network_interface" "my_terraform_nic" {
  name = "myNIC"
  location = azurerm_resource_group.homelab.location
  resource_group_name = azurerm_resource_group.homelab.name

  ip_configuration {
    name = "my_nic_configuration"
    subnet_id = azurerm_subnet.homelab_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.homelab_publicIP.id
  }
}
