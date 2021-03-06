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
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }

}

resource "azurerm_app_service" "MobEADv2-hml" {
  name                = "mobeadv2-hml"
  location            = "East US"
  resource_group_name = "AzureDevOps"
  app_service_plan_id = "${azurerm_app_service_plan.MobEADv2-plan-hml.id}"

}

resource "azurerm_app_service_plan" "MobEADv2-plan-prd" {
  name                = "MobEADv2-plan-prd"
  location            = "East US 2"
  resource_group_name = "AzureDevOps"
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }

}

resource "azurerm_app_service" "MobEADv2-prd" {
  name                = "mobeadv2-prd"
  location            = "East US 2"
  resource_group_name = "AzureDevOps"
  app_service_plan_id = "${azurerm_app_service_plan.MobEADv2-plan-prd.id}"

}