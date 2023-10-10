# Provider-1 for EastUS (Default Provider)
provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}

# Provider-2 for WestUS Region
provider "azurerm" {
 skip_provider_registration = "true" 
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false # This will ensure when the Virtual Machine is destroyed, Disk is not deleted, default is true and we can alter it at provider level
    }
  }
  alias = "provider2-westus"
  #client_id = "XXXX"
  #client_secret = "YYY"
  #environment = "german"
  #subscription_id = "JJJJ"
}



