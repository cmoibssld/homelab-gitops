output "public_ip" {
  value = resource.azurerm_public_ip.homelab_publicIP.ip_address
}

output "private_ssh_key" {
  value = azapi_resource_action.ssh_public_key_gen.output.privateKey
  sensitive = true
}

