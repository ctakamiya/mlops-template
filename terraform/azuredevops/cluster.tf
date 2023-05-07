data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_cluster" "mlops_template" {
  cluster_name            = "MLOps Template (${data.databricks_current_user.me.alphanumeric})"
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = "Standard_E4s_v5"
  autotermination_minutes = 20
  spark_conf = {
    # Single-node
    "spark.databricks.cluster.profile" : "singleNode"
    "spark.master" : "local[*]"
  }

  custom_tags = {
    "ResourceClass" = "SingleNode"
  }

  library {
    pypi {
      package = "nutter"
    }
  }
  library {
    pypi {
      package = "chispa"
    }
  }

}
