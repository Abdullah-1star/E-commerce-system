# 🛒 E-Commerce Big Data ETL & Analytics Pipeline

An enterprise-grade, end-to-end Big Data Engineering pipeline built to handle high-throughput e-commerce transactional data ingestion, distributed transformation, data warehousing, and executive business intelligence reporting.

Developed as part of the **Samsung Innovation Campus (SIC G13)** initiative in collaboration with **Life Makers Egypt**.

---

## 📌 Project Overview & Problem Statement

Modern e-commerce platforms handle continuous streams of heterogeneous data. Managing semi-structured transactional payloads (like JSON orders with nested line items) alongside flat relational datasets (customers and products CSVs) creates significant processing bottlenecks.

### Core Objectives
* **Automated Data Ingestion:** Real-time collection and validation of raw JSON documents from MongoDB and CSV files from local storage.
* **Scalable Data Processing:** Distributed extraction and flattening of nested JSON structures using Apache Spark.
* **Structured Warehousing:** Star Schema data modeling stored in Apache Hive with optimized columnar storage (Parquet).
* **Actionable Analytics:** Interactive Power BI dashboards for tracking revenue, order fulfillment, and regional performance.

---

## 📐 System Architecture & Workflow

The architecture consists of 6 integrated, decoupled layers:

[ MongoDB / CSV ] ──> [ Apache NiFi ] ──> [ HDFS Raw Zone ]
│
▼
[ Power BI ] <── [ Apache Hive ] <── [ Apache Spark (PySpark) ]


### Pipeline Components

| Layer | Technology | Primary Function |
| :--- | :--- | :--- |
| **Data Sources** | MongoDB & Local Files | Primary storage for raw orders (JSON) and dimensional master data (CSV). |
| **Ingestion** | Apache NiFi | Automated ingestion, file extension fixing, MIME-type routing, and failure alert notifications via email. |
| **Storage Lake** | Hadoop HDFS | Immutable Raw Data Lake storage layer (`/raw_data/`). |
| **Data Processing** | Apache Spark (PySpark) | Schema enforcement, array explosion, left-joins, surrogate key creation, and Parquet formatting. |
| **Data Warehouse** | Apache Hive | External Star Schema tables backed by Snappy-compressed Parquet files (`/cleaned_data/`). |
| **Analytics & BI** | Power BI | Executive-level KPI dashboard visualization and business reporting. |

---

## 🏗️ Data Warehouse Model (Star Schema)

The analytical data warehouse is structured using a **Star Schema** to optimize query performance and BI aggregations:

* **Fact Table:** `fact_sales` (Contains order line items, sales quantities, calculated total amounts, and payment status)
* **Dimension Tables:**
  * `dim_customer` (Customer demographic profiles and registration data)
  * `dim_product` (Product names, categories, and unit pricing)
  * `dim_date` (Generated date dimension with day, month, quarter, and year breakdown)

---

## 📊 Analytics & Key Business Insights

The project includes a **Power BI Dashboard** that delivers critical business metrics from the processed data:

* **Total Revenue:** $1.30M across processed orders.
* **Volume:** 15K total product units sold across 2,751 orders.
* **Average Order Value:** $472.81 per transaction.
* **Top Performers:** Smart Watches and Mechanical Keyboards represent the highest grossing product categories.
* **Operational Insight:** High payment failure and refund rate (~49.8%) identified, highlighting a critical need for payment gateway optimization.

---

## 👥 Engineering Team

* **Abdullah Emad Abdulaziz** — Big Data Engineer (Pipeline Architecture & Hive Data Warehousing)
* **Youssef Mahmoud Abo Ali** — Data Engineer (PySpark ETL Development & Data Transformations)
* **Hamza Mohamed Ali** — Data Pipeline Engineer (Apache NiFi Ingestion & Error Alert Orchestration)
* **Omar Fathy Mohamed** — BI & Analytics Engineer (Power BI Dashboard Modeling & Insights)

---
*Supervised by Samsung Innovation Campus (SIC) & Life Makers Foundation.*
