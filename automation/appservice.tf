terraform {
  required_version = ">= 0.11"
  backend "azurerm" {
    storage_account_name = "mobeadv2"
    container_name = "terraform"
    key = "terraform.tfstate"
    }
  }
  provider "azurerm" {
  features {}
}

resource "azurerm_app_service_plan" "MobEADv2-plan-hml" {
  name                = "MobEADv2-plan-hml"
  location            = "East US"
  resource_group_name = "AzureDevOps"

  sku {
    tier = "Free"
    size = "F1"
  }

}

resource "azurerm_app_service" "MobEADv2-plan-hml" {
  name                = "mobeadv2-hml"
  location            = "East US"
  resource_group_name = "AzureDevOps"
  app_service_plan_id = "${azurerm_app_service_plan.MobEADv2-plan-hml.id}"

  site_config {
    dotnet_core_version = "v3.1"
  }

}