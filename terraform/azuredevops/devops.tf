resource "azuredevops_project" "project" {
  name            = var.devops_project_name
  description     = "MLOps template"
  visibility      = "private"
  version_control = "Git"
  work_item_template = "Agile"
}


#resource "azuredevops_git_repository" "project" {
#  project_id = azuredevops_project.project.id
#  name       = var.devops_repo_name
#  default_branch = "refs/heads/main" 
#  initialization {
#    init_type = "Clean"
#  }
#}


resource "azuredevops_git_repository" "repo-import" {
  project_id = azuredevops_project.project.id
  name       = var.devops_repo_name
  default_branch = "refs/heads/main" 
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/ctakamiya/mlops-template"
  
  }
}


resource "azuredevops_build_definition" "build" {
  project_id = azuredevops_project.project.id
  name       = "MLOps Build Pipeline"

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.repo-import.id
    branch_name = azuredevops_git_repository.repo-import.default_branch
    yml_path    = "azure-pipelines.yml"
  }

  variable_groups = [azuredevops_variable_group.vg.id]
}

resource "databricks_token" "pat_for_devops" {
  provider = databricks.dev
  comment          = "Azure MLOps template"
  lifetime_seconds = 864000
}

resource "azuredevops_variable_group" "vg" {
  project_id   = azuredevops_project.project.id
  name         = "MLOps VG"
  description  = "Variable group for build job"
  allow_access = true

  variable {
    name  = "databricks_host"    
    value = var.devops_databricks_staging_host
  }

  variable {
    name         = "databricks_token"
    secret_value = var.devops_pat_databricks_staging
    is_secret    = true
  }

  variable {
    name  = "cluster_id"
    value = databricks_cluster.mlops_template.id
  }

  variable {
    name  = "staging_directory"
    value = local.staging_repo_path
  }

}
