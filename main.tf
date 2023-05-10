# Define the provider for Azure
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-aks" {
  name     = "rg-aks-training"
  location = "eastus"
}

resource "azurerm_kubernetes_cluster" "aks-walxar" {
  name                = "walxar-aks"
  location            = azurerm_resource_group.rg-aks.location
  resource_group_name = azurerm_resource_group.rg-aks.name
  dns_prefix          = "walxar"
  kubernetes_version  = "1.24.10"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks-walxar.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks-walxar.kube_config_raw

  sensitive = true
}