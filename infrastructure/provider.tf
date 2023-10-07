provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  subscription_id = local.subcription_id
  tenant_id       = local.tentant_id
}
