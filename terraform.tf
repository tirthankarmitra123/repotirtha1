terraform {
 required_providers {
   azurerm = {
     source = "hashicorp/azurerm"
     version = "4.14.0"
   }
 }
}

provider "azurerm" {
 # Configuration options
subscription_id = "7158deXXXXXXXXXXXXXXXXXXXXXXXXXXc70b347"
features{}
}

resource "azurerm_resource_group" "example" {
 name     = "terraform121"
 location = "East US"
}

# Create virtual network
resource "azurerm_virtual_network" "example" {
 name                = "vnat1"
 address_space       = ["172.16.0.0/16"]
 location            = azurerm_resource_group.example.location
 resource_group_name = azurerm_resource_group.example.name
}

# Create subnet within the virtual network
resource "azurerm_subnet" "example" {
 name                 = "subnet1"
 resource_group_name  = azurerm_resource_group.example.name
 virtual_network_name = azurerm_virtual_network.example.name
 address_prefixes     = ["172.16.10.0/24"]
}
