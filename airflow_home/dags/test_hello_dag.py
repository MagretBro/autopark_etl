from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def say_hello():
    print("✅ Hello from Airflow!")

with DAG(
    dag_id="test_hello_dag",
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False,
    tags=["test"],
) as dag:
    hello_task = PythonOperator(
        task_id="say_hello_task",
        python_callable=say_hello,
    )
