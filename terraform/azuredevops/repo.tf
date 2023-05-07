data "databricks_current_user" "me" {
}

locals {
  staging_repo_path = "${data.databricks_current_user.me.repos}/${var.devops_project_name}-staging"
}



resource "databricks_git_credential" "dev" {
  provider = databricks.dev
  git_provider          = "azureDevOpsServices"
  git_username          = var.devops_user_name
  personal_access_token = var.devops_pat
  force                 = true
}

resource "databricks_git_credential" "staging" {
  provider = databricks.staging
  git_provider          = "azureDevOpsServices"
  git_username          = var.devops_user_name_staging
  personal_access_token = var.devops_pat
  force                 = true
}


resource "databricks_git_credential" "prod" {
  provider = databricks.prod
  git_provider          = "azureDevOpsServices"
  git_username          = var.devops_user_name_prod
  personal_access_token = var.devops_pat
  force                 = true
}



resource "databricks_repo" "mlops_user_home" {
  provider = databricks.dev
  depends_on = [databricks_git_credential.dev]
  url        = azuredevops_git_repository.repo-import.remote_url
  path       = "${data.databricks_current_user.me.repos}/${var.devops_project_name}-dev"
  branch     = "releases"
}

resource "databricks_repo" "mlops_in_staging" {
  provider = databricks.staging
  depends_on = [databricks_git_credential.staging]
  url        = azuredevops_git_repository.repo-import.remote_url
  path       = local.staging_repo_path
  branch     = "releases"
}

resource "databricks_repo" "mlops_in_prod" {
  provider = databricks.prod
  depends_on = [databricks_git_credential.prod]
  url        = azuredevops_git_repository.repo-import.remote_url
  path       = "${data.databricks_current_user.me.repos}/${var.devops_project_name}-prod"
  branch     = "releases"
}
