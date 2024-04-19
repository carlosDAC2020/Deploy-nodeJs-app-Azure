terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.28.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# gurpo de recursos
resource "azurerm_resource_group" "node-server-app" {
  name = "node-server-app" 
  location = "eastus" 
}

# container instance para la base de datos 
resource "azurerm_container_group" "db-node-app" {
  name                  = "node-app"
  location              = azurerm_resource_group.node-server-app.location 
  resource_group_name   = azurerm_resource_group.node-server-app.name 

  ip_address_type       = "Public"
  dns_name_label        = "h2c-parcial-node-app" #friendly name we want to give our domain
  os_type               = "Linux"

  # Specify the container information
  container {
    name = "node-app"
    image = "cdapdev2020/db-node-server-app:20240417233850"
    cpu = "1"
    memory = "1"

    ports {
        port = 3306 
        protocol = "TCP"
    }
  }
}
