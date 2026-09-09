# 🛒 E-Commerce Data Engineering Pipeline

An end-to-end **E-Commerce Data Engineering Pipeline** designed to collect, store, process, transform, and analyze e-commerce data using a distributed data architecture.

The project demonstrates how raw data can be transformed into structured, analytics-ready data and delivered to a **Data Warehouse** for business intelligence and reporting.

---

## 📌 Project Overview

The main goal of this project is to build a complete data pipeline that handles e-commerce data from different sources and transforms it into meaningful information for business analysis.

The pipeline follows a layered architecture:

**Data Sources → Apache NiFi → HDFS → Apache Spark → Hive Data Warehouse → Power BI**

The system supports data ingestion, storage, transformation, data modeling, and visualization.

---

## 🏗️ Architecture

```text
                ┌─────────────────┐
                │   Data Sources  │
                │                 │
                │ CSV / JSON / DB │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │   Apache NiFi   │
                │ Data Ingestion  │
                │ & Orchestration │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │      HDFS       │
                │    Data Lake    │
                │   Raw / Bronze   │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │  Apache Spark   │
                │ Transformation  │
                │   & Processing   │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │      Hive       │
                │ Data Warehouse  │
                │ Silver / Gold   │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │    Power BI     │
                │   Dashboards    │
                │ & Visualization │
                └─────────────────┘
```

---

## 🔄 Data Pipeline

### 1. Data Ingestion

**Apache NiFi** is used to ingest data from the available sources.

NiFi handles:

* Data ingestion
* Routing
* Basic validation
* Flow management
* Data movement
* Pipeline orchestration
* Error handling

The incoming data is preserved in its raw form before major transformations.

---

### 2. Data Lake

**HDFS (Hadoop Distributed File System)** is used as the project's local Data Lake.

Raw data is stored in HDFS using a structured directory organization.

Example:

```text
/ecommerce/
│
├── raw/
│   ├── customers/
│   ├── products/
│   ├── orders/
│  
│
├── processed/
│
└── warehouse/
```

The raw layer keeps the original data and provides a reliable storage layer before processing.

---

### 3. Data Processing & Transformation

**Apache Spark** is used for large-scale data processing and transformation.

The transformation stage includes:

* Data cleaning
* Handling missing values
* Removing duplicates
* Data type conversion
* Joining datasets
* Feature creation
* Business-rule implementation
* Aggregations
* Data quality checks

One important transformation is calculating the **sales per product per order** based on the available product and order information.

Example:

```text
Sales = Quantity × Unit Price
```

---

## 🥉 Medallion Architecture

The pipeline follows the concept of a **Medallion Architecture**.

### 🥉 Bronze Layer

Contains the raw data exactly as received from the sources.

```text
Source Data
     ↓
   Bronze
```

Technology:

**HDFS**

---

### 🥈 Silver Layer

Contains cleaned and transformed data.

Operations include:

* Cleaning
* Deduplication
* Data type standardization
* Joining datasets
* Data validation

Technology:

**Apache Spark**

---

### 🥇 Gold Layer

Contains business-ready and aggregated data designed for analytics.

Examples include:

* Product performance
* Customer analysis
* Order analysis
* Sales analysis
* Revenue metrics

Technology:

**Hive Data Warehouse**

---

## 🏢 Data Warehouse

The processed data is modeled using a **Star Schema**.

### Fact Table

The main fact table stores measurable business events such as orders and sales.

Example measures:

* Quantity
* Sales
* Revenue
* Discount

### Dimension Tables

Examples:

* `dim_customer`
* `dim_product`
* `dim_date`
* `dim_category`

The dimensions provide descriptive information that can be used to analyze the facts.

---

## 🔑 Surrogate Keys

Surrogate keys are used in the dimensional model to uniquely identify dimension records.

For example:

```text
dim_customer

customer_sk
------------
1
2
3
4
```

The fact table references these surrogate keys instead of relying directly on business identifiers.

This makes the warehouse model more flexible and suitable for analytical workloads.

---

## 📊 Business Intelligence

The final warehouse data is used by **Power BI** to create interactive dashboards.

The dashboards focus on business metrics such as:

* Total Sales
* Total Revenue
* Number of Orders
* Product Performance
* Customer Performance
* Sales Trends
* Category Analysis

The goal is to convert processed data into actionable business insights.

---

## 🛠️ Technologies Used

| Technology       | Purpose                          |
| ---------------- | -------------------------------- |
| **Apache NiFi**  | Data ingestion & orchestration   |
| **HDFS**         | Data Lake / distributed storage  |
| **Apache Spark** | Data processing & transformation |
| **Hive**         | Data Warehouse                   |
| **Power BI**     | Data visualization & BI          |
| **Git & GitHub** | Version control & collaboration  |
| **Linux / VM**   | Project environment              |

---

## 🚀 Project Workflow

```text
1. Collect Data
       ↓
2. Ingest Data using NiFi
       ↓
3. Store Raw Data in HDFS
       ↓
4. Process Data using Spark
       ↓
5. Clean & Transform Data
       ↓
6. Build Dimensional Model
       ↓
7. Load Data into Hive
       ↓
8. Connect BI Layer
       ↓
9. Build Power BI Dashboards
       ↓
10. Generate Business Insights
```

---

## 🎯 Project Objectives

* Build an end-to-end Data Engineering pipeline.
* Implement a local Data Lake using HDFS.
* Perform scalable data processing using Spark.
* Apply ETL transformations.
* Implement a Data Warehouse using Hive.
* Build a dimensional model using Fact and Dimension tables.
* Apply Medallion Architecture concepts.
* Create analytical dashboards using Power BI.
* Demonstrate the complete flow from raw data to business insights.

---

## 👥 Team

### Team Members

* **Abdullah emad**
* **Hamza Mahmoud **
* **Youssef Mohamed  **
* **Omar Fathy**

---

## 📈 Final Result

The project provides a complete data engineering workflow that transforms raw e-commerce data into clean, structured, and analytics-ready datasets.

```text
Raw Data
   ↓
Data Lake
   ↓
Data Processing
   ↓
Data Warehouse
   ↓
Business Intelligence
```

This architecture demonstrates how modern data engineering components can work together to build a scalable and reliable analytics pipeline.

---

## 📚 Key Concepts Demonstrated

* Data Engineering
* ETL Pipeline
* Data Lake
* Data Warehouse
* Medallion Architecture
* Data Ingestion
* Data Transformation
* Distributed Storage
* Distributed Processing
* Star Schema
* Fact & Dimension Tables
* Surrogate Keys
* Data Quality
* Business Intelligence
* Data Visualization
