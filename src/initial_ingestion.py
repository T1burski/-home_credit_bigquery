from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from google.oauth2 import service_account
import pandas as pd
import json

'''
This module focuses on stating functions that
were used in the first ingestion of the data into
google bigquery using pyspark
'''

def extract_data():
    bureau = spark.read.option("header", True).csv("data/bureau.csv")
    dimensions = spark.read.option("header", True).csv("data/dimensions.csv")
    facts = spark.read.option("header", True).csv("data/facts.csv")
    target = spark.read.option("header", True).csv("data/target.csv")

    return [(bureau, 'raw_bureau'), (dimensions, 'raw_dimensions'), (facts, 'raw_facts'), (target, 'raw_target')]


def load_data(data_list):

    db_id = 'raw'
    service_account_info = json.load(open('home_credit_creds.json'))
    credentials = service_account.Credentials.from_service_account_info(
        service_account_info)

    for tb_data, tb_name in data_list:
        if isinstance(tb_data, pd.DataFrame):
            tb_data.to_gbq(credentials = credentials, destination_table = db_id + "." + tb_name, if_exists = 'replace')
        else:
            tb_data_df = tb_data.toPandas()
            tb_data_df.to_gbq(credentials = credentials, destination_table = db_id + "." + tb_name, if_exists = 'replace')


if __name__ == "__main__":

    # Create a Spark session
    spark = SparkSession.builder \
    .appName("Home_Credit_Initial_Ingestion") \
    .config("spark.executor.memory", "6g") \
    .config("spark.driver.memory", "6g") \
    .getOrCreate()

    load_data(extract_data())