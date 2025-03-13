from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

# Varsayılan argümanlar
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2025, 3, 12),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# DAG tanımı
dag = DAG(
    'dbt_daily_run',
    default_args=default_args,
    description='Run dbt models daily at 10 AM',
    schedule_interval='0 10 * * *',  # Her gün saat 10:00'da çalıştır
    catchup=False,
)

# İlk dbt modelini çalıştıran task
dbt_run_product_sales = BashOperator(
    task_id='run_monthly_product_sales',
    bash_command='dbt run --select monthly_product_sales',
    dag=dag,
)

# İkinci dbt modelini çalıştıran task
dbt_run_category_sales = BashOperator(
    task_id='run_monthly_category_sales',
    bash_command='dbt run --select monthly_category_sales',
    dag=dag,
)

# Task sırasını belirleme: Önce `monthly_product_sales`, sonra `monthly_category_sales`
dbt_run_product_sales >> dbt_run_category_sales
