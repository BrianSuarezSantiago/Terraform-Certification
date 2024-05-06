# Official AWS provider maintain by Hashicorp
provider "aws" {
    region = "eu-west-2"
    access_key = ""
    secret_key = ""
}

# Official Microsoft Azure provider maintain by Hashicorp
provider "azurerm" {}    # Another way to download appropiate provider's plugins/dependencies

# Unofficial Hashicorp provider (Community)
terraform {
    required_providers {
        unofficialprovider = {    # The local resource name should follows Terraform standars
            source = "phish32786/ad"    # The provider plugins must be released (not in development stage)
            version = "~> 0.5.14"
        }
    }
}
