primary_location    = "eastus"
image_name          = "pkr-ubuntu"
image_version       = "0.0.1"
resource_group_name = "packer-demo"
storage_account     = "packerdemo"

image_sku           = "22_04-lts-gen2"
image_offer         = "0001-com-ubuntu-server-jammy"
capture_name_prefix = "packer"
location            = "eastus"

vm_size = "Standard_B1s"