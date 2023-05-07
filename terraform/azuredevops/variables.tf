variable "devops_org_url" {
  description = "DevOps URL"
  type        = string
}


variable "devops_pat" {
  description = "DevOps PAT"
  sensitive = true
  type        = string
}

variable "devops_pat_databricks_staging" {
  description = "Databricks Staging - Personal Access Token"
  type        = string
  sensitive   = true
}

variable "devops_pat_databricks_prod" {
  description = "Databricks Production - Personal Access Token"
  type        = string
  sensitive   = true
} 


variable "devops_user_name" {
  description = "DevOps User Name"
  type        = string
}

variable "devops_user_name_staging" {
  description = "DevOps User Name"
  type        = string
}

variable "devops_user_name_prod" {
  description = "DevOps User Name"
  type        = string
}

variable "devops_project_name" {
  description = "Project name in Azure DevOps"
  type        = string
  default     = "mlops_template"
}

variable "devops_repo_name" {
  description = "Project name in Azure DevOps"
  type        = string
  default     = "mlops_repo_template"
}

variable "devops_databricks_staging_host" {
  description = "Databricks Staging Host Name"
  type        = string
}

variable "devops_databricks_prod_host" {
  description = "Databricks Staging Host Name"
  type        = string
}



