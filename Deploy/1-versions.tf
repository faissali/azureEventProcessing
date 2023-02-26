terraform {
  required_version = "= 1.3.9"
  backend "azurerm" {
    resource_group_name  = "$RESOURCE_GROUP_NAME"         # mettre ici le nom du resource group de vos ressource
    storage_account_name = "$TERRAFORM_STORAGE_NAME"      # mettre le nom du compte de stockage créer dans le lab 1
    container_name       = "$TERRAFORM_CONTAINER_NAME"
    key                  = "$TERRAFORM_KEY"
    #access_key           = "__tf_storage_account_key__"
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
  # credentials
  subscription_id = "$SUBSCRIPTION_ID"
  client_id       = "$CLIENT_ID"
  client_secret   = "$CLIENT_SECRET"
  tenant_id       = "$TENANT_ID"

  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
}
