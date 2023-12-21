terraform {
  required_version = "~>1.6.6"
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/hashicorp/azurerm"
      version = "=3.85.0"
    }
    azuread = {
      source  = "registry.terraform.io/hashicorp/azuread"
      version = "=2.47.0"
    }

  }
  backend "azurerm" {
    resource_group_name  = "weu-terraform-dia-nonprod-rg"
    storage_account_name = "weuterraformdianonprodst"
    subscription_id      = "b356d97e-42a7-4490-b669-a54fd1ec3c59"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azuread" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}