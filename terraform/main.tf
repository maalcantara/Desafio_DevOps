resource "azurerm_resource_group" "res-0" {
  location = "centralus"
  name     = "rg_DesafioDevOps"
}
resource "azurerm_kubernetes_cluster" "res-1" {
  automatic_channel_upgrade = "patch"
  dns_prefix                = "k8s-devops"
  location                  = "centralus"
  name                      = "cluster_DesafioDevOps"
  resource_group_name       = "rg_DesafioDevOps"
  default_node_pool {
    name    = "agentpool"
    vm_size = "Standard_DS2_v2"
    upgrade_settings {
      max_surge = "10%"
    }
  }
  identity {
    type = "SystemAssigned"
  }
  maintenance_window_auto_upgrade {
    day_of_week = "Sunday"
    duration    = 4
    frequency   = "Weekly"
    interval    = 1
    start_time  = "00:00"
    utc_offset  = "+00:00"
  }
  maintenance_window_node_os {
    day_of_week = "Sunday"
    duration    = 4
    frequency   = "Weekly"
    interval    = 1
    start_time  = "00:00"
    utc_offset  = "+00:00"
  }
  monitor_metrics {
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_kubernetes_cluster_node_pool" "res-2" {
  kubernetes_cluster_id = "/subscriptions/5de99f93-a553-4f56-a986-cb654be7ffaf/resourceGroups/rg_DesafioDevOps/providers/Microsoft.ContainerService/managedClusters/cluster_DesafioDevOps"
  mode                  = "System"
  name                  = "agentpool"
  vm_size               = "Standard_DS2_v2"
  upgrade_settings {
    max_surge = "10%"
  }
  depends_on = [
    azurerm_kubernetes_cluster.res-1,
  ]
}
resource "azurerm_virtual_network" "res-5" {
  address_space       = ["10.0.0.0/16"]
  location            = "centralus"
  name                = "vNET_DesafioDevOps"
  resource_group_name = "rg_DesafioDevOps"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_subnet" "res-6" {
  address_prefixes     = ["10.0.1.0/26"]
  name                 = "AzureFirewallSubnet"
  resource_group_name  = "rg_DesafioDevOps"
  virtual_network_name = "vNET_DesafioDevOps"
  depends_on = [
    azurerm_virtual_network.res-5,
  ]
}
resource "azurerm_subnet" "res-7" {
  address_prefixes     = ["10.0.2.0/24"]
  name                 = "subNET_DesafioDevOps"
  resource_group_name  = "rg_DesafioDevOps"
  virtual_network_name = "vNET_DesafioDevOps"
  depends_on = [
    azurerm_virtual_network.res-5,
  ]
}
resource "azurerm_storage_account" "res-8" {
  account_replication_type         = "RAGRS"
  account_tier                     = "Standard"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  location                         = "centralus"
  name                             = "sadesafiodevops"
  resource_group_name              = "rg_DesafioDevOps"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_storage_container" "res-10" {
  name                 = "conteinerdesafiodevops"
  storage_account_name = "sadesafiodevops"
}
