terraform {
  # Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name  = "packer-demo"
    storage_account_name = "packerdemostorage"
    container_name       = "packerimages"
    key                  = "project-pkr-eastus-terraform.tfstate"
  }
}