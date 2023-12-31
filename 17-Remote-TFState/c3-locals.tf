# Define Local Values in Terraform
locals {
  owners = var.business_divsion
  environment = var.environment
  #resource_name_prefix = "${var.business_divsion}-${var.environment}"
  resource_name_prefix = "${var.resource_group_location}-${var.business_divsion}-${var.environment}-${var.resource_group_location}"  
  common_tags = {
    owners = local.owners
    environment = local.environment
    Tag = "demo-tag1"   
    Tag = "demo-tag2" 
    Tag = "demo-tag3" 
    Tag = "demo-tag4" 
  }
} 
