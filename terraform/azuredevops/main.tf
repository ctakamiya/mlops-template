terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.5.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.5.0"
    }
  }
}

# https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs

provider "azuredevops" {
  org_service_url       = var.devops_org_url
  personal_access_token = var.devops_pat
}

provider "databricks" {
     alias = "dev"
     host  = "https://adb-4562026214062884.4.azuredatabricks.net/"
     token = "dapibcd9c9e1b610d04a7f84b0879e2c3733-3"
}

provider "databricks" {
     alias = "staging"
     host  = "https://adb-6120542968195864.4.azuredatabricks.net/"
     token = "dapid3c4d862abc98568ff24857b3f13d2a8-3"
}

provider "databricks" {
     alias = "prod"
     host  = "https://adb-6120542968195864.4.azuredatabricks.net/"
     token = "dapid3c4d862abc98568ff24857b3f13d2a8-3"
}