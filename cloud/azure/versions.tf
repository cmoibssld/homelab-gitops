# Use by terraform init to identify required providers 
# resolve their sources and download the plugin(s) associated 
terraform {
	required_providers {
		azurerm = {
			source = "hashicorp/azurerm"
      version = "~> 4.0"
		}

    azapi = {
      source = "azure/azapi"
      version = "~> 1.5"
    }

    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }

	}
}
