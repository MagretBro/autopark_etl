from airflow import DAG
from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator
from datetime import datetime

default_args = {
    "owner": "airflow",
    "start_date": datetime(2024, 1, 1),
}

with DAG(
    dag_id="push_autopark_import_pipeline",
    default_args=default_args,
    schedule_interval=None,
    catchup=False,
    tags=["autopark", "etl"],
) as dag:

    step_0_create_tables = SQLExecuteQueryOperator(
        task_id="create_base_tables",
       conn_id="postgres_car",
        sql="sql/create_tables.sql",
    )

    step_0a_test_data = SQLExecuteQueryOperator(
        task_id="insert_test_data",
        conn_id="postgres_car",
        sql="sql/test_data.sql",
    )

    step_1_prepare = SQLExecuteQueryOperator(
        task_id="prepare_import_data",
       conn_id="postgres_car",
        sql="sql/import_prepare.sql",
    )

    step_2_aggregate = SQLExecuteQueryOperator(
        task_id="aggregate_import_data",
       conn_id="postgres_car",
        sql="sql/import_aggregated.sql",
    )

    step_3_update_existing = SQLExecuteQueryOperator(
        task_id="update_existing_rows",
       conn_id="postgres_car",
        sql="sql/update_existing.sql",
    )

    step_4_insert_new = SQLExecuteQueryOperator(
        task_id="insert_new_rows",
       conn_id="postgres_car",
        sql="sql/insert_new_tecdoc.sql",
    )

    step_5_insert_null = SQLExecuteQueryOperator(
        task_id="insert_null_tecdoc_rows",
       conn_id="postgres_car",
        sql="sql/insert_null_tecdoc.sql",
    )

    step_0_create_tables >> step_0a_test_data >> step_1_prepare >> step_2_aggregate >> step_3_update_existing >> step_4_insert_new >> step_5_insert_null
