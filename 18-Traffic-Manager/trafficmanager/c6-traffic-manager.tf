# Resource-1: Traffic Manager Profile
resource "azurerm_traffic_manager_profile" "tm_profile" {
  name                   = "mytfdemo-${random_string.myrandom.id}"
  resource_group_name    = azurerm_resource_group.rg.name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "mytfdemo-${random_string.myrandom.id}"
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }
  tags = local.common_tags
}

resource "azurerm_public_ip" "public_ip_1"{
    name = "public-ip-1"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Static"
    domain_name_label = "public-ip-label"
}

resource "azurerm_public_ip" "public_ip_2"{
    name = "public-ip-2"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Static"
    domain_name_label = "public-ip-label"
}

# Traffic Manager Endpoint - Project-1-EastUs2
resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoint_project1_eastus2" {
  name                = "tm-endpoint-project1-eastus2"
  profile_id        = azurerm_traffic_manager_profile.tm_profile.id
  weight              = 50
  target_resource_id  = azurerm_public_ip.public_ip_1.id
}


# Traffic Manager Endpoint - Project-2-WestUs2
resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoint_project2_westus2" {
  name                = "tm-endpoint-project2-westus2"
  profile_id        = azurerm_traffic_manager_profile.tm_profile.id
  weight              = 50
  target_resource_id  = azurerm_public_ip.public_ip_2.id
}
