# Airflow DAG: Push Autopark Import Pipeline

Этот DAG загружает и обновляет данные в PostgreSQL-таблице `table_old`. DAG написан под Apache Airflow 2.10.4

## Используемые технологии

- **Airflow**: 2.10.4
- **Python**: 3.10+
- **PostgreSQL**: 14
- **PostgreSQL Provider**: apache-airflow-providers-postgres==2.4.0

## 📁 Структура проекта

```
autopark_airflow_project/
├── dags/
│   └── push_autopark_import_pipeline.py
│   └── sql/
├── README.md
├── .gitignore
```

## 🔧 Установка и запуск

1. Установи Airflow с нужным провайдером:

```bash
pip install apache-airflow==2.10.4 \
            apache-airflow-providers-postgres==2.4.0
```

2. Инициализируй базу данных Airflow:

```bash
airflow db init
```

3. Создай пользователя (если ещё не создан):

```bash
airflow users create \
    --username admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email admin@example.com \
    --password admin
```

4. Добавь подключение к PostgreSQL:

> ⚠️ Замените значения на свои реальные данные.

```bash
airflow connections add 'postgres_car' \
    --conn-type 'postgres' \
    --conn-host 'localhost' \
    --conn-port '5432' \
    --conn-login 'your_user' \
    --conn-password 'your_pass' \
    --conn-schema 'your_db'
```

5. Запусти Airflow:

```bash
airflow scheduler
airflow webserver --port 8080
```

Затем открой [http://localhost:8080](http://localhost:8080), найди DAG с именем `push_autopark_import_pipeline`, включи и запусти его вручную.

## Особенности

- **Финальная таблица**: `table_old`
- DAG выполняет обновление данных по логике UPSERT.
- CSV-файлы или внешние библиотеки **не используются**.

## Ссылка на проект
(https://github.com/autopark_etl)
