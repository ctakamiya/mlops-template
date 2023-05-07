# Databricks notebook source
# MAGIC %md
# MAGIC # Instruções
# MAGIC
# MAGIC  Este notebook é apenas uma sugestão de template para  iniciar e acelerar suas atividades na Análise Exploratória dos Dados. Sinta-se a vontade para incluir/modificar tópicos que forem pertinentes ao seus estudos.\
# MAGIC  Os notebooks permitem que os Cientista de Dados possam trabalhar em pares. E ao final do trabalho o notebook pode ser exportado como HTML, comunicando e compartilhando os resultados do estudo.
# MAGIC  
# MAGIC  Apague esta célula ao concluir o trabalho

# COMMAND ----------

# MAGIC %md
# MAGIC ![](/files/porto_bank_logo.png)

# COMMAND ----------

# MAGIC %md
# MAGIC ## Análise Exploratória de Dados

# COMMAND ----------

# MAGIC %md
# MAGIC ## Introdução
# MAGIC
# MAGIC [ Antes de submter os dados para uma aplicação o EDA é um passo importante para avaliar a potencialidade do projeto.\
# MAGIC Descreva aqui o problema ou oportunidade que será estudado neste documento.\
# MAGIC Caso o projeto se mostre viável, um dos possíveis resultados nesta atividade são as possíveis métricas para monitorar os modelos (input drift)]

# COMMAND ----------

# Dataset

df1 = (spark.read
  .format("csv")
  .option("header", "true")
  .option("inferSchema", "true")
  .load("/databricks-datasets/flights/departuredelays.csv")
)

# fonte1 = "nyctaxi.fares"
# df1 = spark.read.table(tableName=fonte1).sample(withReplacement=True, fraction=0.1, seed=3)

# COMMAND ----------

display(df1.head(4))

# COMMAND ----------

display(df1.tail(4))

# COMMAND ----------

dbutils.data.summarize(df1) 

