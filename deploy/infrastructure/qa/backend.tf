terraform {
  backend "azurerm" {
    resource_group_name   = "myLearningWorld"
    storage_account_name  = "mydlptfstateaccount"
    container_name        = "tfstateqa"
    key                   = "terraform.tfstate"
  }
}