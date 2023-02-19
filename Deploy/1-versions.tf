terraform {
  required_version = "= 1.3.5"
  backend "azurerm" {
    resource_group_name  = "fbu-apps"         # mettre ici le nom du resource group de vos ressource
    storage_account_name = "terraformstoragefbu"      # mettre le nom du compte de stockage créer dans le lab 1
    container_name       = "terraform"
    key                  = "test"
    access_key           = "xx"#"xxtf_storage_account_keyxx"
  }
  required_providers {
    azurerm = {
      # The "hashicorp" namespace is the new home for the HashiCorp-maintained
      # provider plugins.
      #
      # source is not required for the hashicorp/* namespace as a measure of
      # backward compatibility for commonly-used providers, but recommended for
      # explicitness.
      # more info about the Azure Provider: https://github.com/terraform-providers/terraform-provider-azurerm
      # Check Changelog : https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
      source  = "hashicorp/azurerm"
      version = "= 2.98.0"
    }

}
}

# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
}
