terraform {
  cloud {
    organization = "Motormate"

    workspaces {
      name = "motormate-wp"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.75.0"
    }
  }
}
