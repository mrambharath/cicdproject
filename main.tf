terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

#Resource Group Creation
resource "azurerm_resource_group" "inlogik_rg" {
  name     = "inlogik_rg"
  location = "East US"
}


#VNet Creation
resource "azurerm_virtual_network" "inlogik_vnet" {
  name                = "inlogik_vnet"
  location            = azurerm_resource_group.inlogik_rg.location
  resource_group_name = azurerm_resource_group.inlogik_rg.name
  address_space       = ["10.0.0.0/16"]

}

#Public Subnet Creation
resource "azurerm_subnet" "inlogik_public_subnet" {
  name                 = "inlogik_public-subnet"
  resource_group_name  = azurerm_resource_group.inlogik_rg.name
  virtual_network_name = azurerm_virtual_network.inlogik_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a Private Subnet
resource "azurerm_subnet" "inlogik_private_subnet" {
  name                 = "inlogik_private-subnet"
  resource_group_name  = azurerm_resource_group.inlogik_rg.name
  virtual_network_name = azurerm_virtual_network.inlogik_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_container_registry" "inlogik_acr" {
  name                = "inlogikacr"
  resource_group_name = azurerm_resource_group.inlogik_rg.name
  location            = azurerm_resource_group.inlogik_rg.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "inlogikaks" {
  name                = "inlogikaks"
  location            = azurerm_resource_group.inlogik_rg.location
  resource_group_name = azurerm_resource_group.inlogik_rg.name
  dns_prefix          = "inlogikaks"

  default_node_pool {
    name                   = "inlogikaks"
    node_count             = 1
    vm_size                = "standard_d2pls_v5"
    node_public_ip_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }
}
