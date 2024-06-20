**save the Terraform state file in Azure**

Step 1: create resource group

```python
az group create --name myLearningWorld --location eastus
```

Step 2: Create an Azure Storage Account:
```python
az storage account create --name mydlptfstateaccount --resource-group myLearningWorld --location eastus --sku Standard_LRS
```

Step 3: Create a Storage Container:
```python
az storage container create --name tfstatedev --account-name mydlptfstateaccount
az storage container create --name tfstateqa --account-name mydlptfstateaccount
az storage container create --name tfstateprod --account-name mydlptfstateaccount
```


Step 4: Configure Terraform Backend:
Create a file named backend.tf with the following content:

```python
terraform {
  backend "azurerm" {
    resource_group_name   = "myLearningWorld"
    storage_account_name  = "mydlptfstateaccount"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
```
Step 5: Initialize Terraform:

Run terraform init in the directory containing backend.tf.

```sh
terraform init
```




