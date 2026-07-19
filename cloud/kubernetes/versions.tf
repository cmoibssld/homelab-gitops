# Use by terraform init to identify required providers 
# resolve their sources and download the plugin(s) associated 
terraform {
	required_providers {
		kubernetes = {
			source = "hashicorp/kubernetes"
      version = "~> 3.0"
		}

		helm = {
			source = "hashicorp/helm"
      version = "~> 3.0"
		}

  }
}
