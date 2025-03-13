dbt & Airflow Pipeline for Monthly Sales Analysis

 -- Proje Açıklaması --

Bu proje, dbt ve Apache Airflow kullanarak BigQuery üzerindeki satış verilerini işler.Her gün saat 10:00'da çalışan bir Airflow DAG'ı ile dbt modelleri çalıştırılır ve aylık ürün/kategori bazlı satış analizleri yapılır.

-- Proje Yapısı --

dbt_airflow_project/
│─ dags/
│   └─ dbt_daily_run.py        # Airflow DAG dosyası
│─ dbt_models/
│   ├─ monthly_product_sales.sql  # Ürün bazlı aylık satış modeli
│   └─ monthly_category_sales.sql # Kategori bazlı aylık satış modeli
│─ yml/
│   ├─ docker-compose.yml       # Docker yapılandırma dosyası
│   └─ bigquery-key.json        # BigQuery kimlik doğrulama dosyası (Gizli tut!)
│─ README.md                    # Proje açıklama dosyası

-- Kurulum & Kullanım --

Gerekli Bagımlılıkları Yükleyin

Docker ve Docker Compose kurulu olmalı.

Git ve dbt de yüklü olmalı.

Projeyi Klonlayın

git clone https://github.com/iskender-stack/dbt_airflow_project.git
cd dbt_airflow_project

Docker ile Airflow’u Başlatın

docker-compose up -d

Tüm servislerin çalıştığını doğrulamak için:

docker ps

-- Airflow Kullanıcı Girişi --

UI: http://localhost:8080

Kullanıcı Adı: admin

Şifre: admin

-- DAG'ı Çalıştırın --

Airflow UI’den "dbt_daily_run" DAG'ını etkinleştirip çalıştırabilirsiniz.

-- Teknolojiler & Araçlar --

dbt (Data Build Tool)

Apache Airflow

BigQuery

Docker & Docker Compose

Python & SQL

-- Geliştirme Sücreci --

 dbt modelleri yazıldı. Airflow DAG'ı oluşturuldu. Docker & Airflow entegrasyonu sağlandı. Günlük veri güncelleme süreci çalıştırıldı.