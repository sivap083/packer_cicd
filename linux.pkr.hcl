source "azure-arm" "ubuntu" {
  client_id       = var.client_id
  subscription_id = var.subscription_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  //---------------------
  // Managed Image configuration will not need the storage account. It will store the image under resource group
  managed_image_resource_group_name = var.resource_group_name
  managed_image_name                = "${var.image_name}-${var.image_version}_{{timestamp}}"
  //---------------------
  os_type         = "Linux"
  image_publisher = "Canonical"
  image_offer     = var.image_offer
  image_sku       = var.image_sku

  location = var.location
  vm_size  = var.vm_size
  azure_tags = {
    project = "packerdemo"
  }

}

