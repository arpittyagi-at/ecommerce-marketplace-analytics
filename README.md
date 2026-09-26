# 🛒 Olist E-Commerce Marketplace Analytics

<p align="center">
  <b>Built by ARPIT TYAGI</b><br>
  Data Analytics • SQL • Python • PostgreSQL • Power BI
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.x-blue?style=for-the-badge&logo=python" />
  <img src="https://img.shields.io/badge/PostgreSQL-18-316192?style=for-the-badge&logo=postgresql" />
  <img src="https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi" />
  <img src="https://img.shields.io/badge/SQL-Analysis-4479A1?style=for-the-badge&logo=postgresql" />
</p>

> **A complete end-to-end analytics project built by ARPIT TYAGI to transform raw e-commerce data into actionable business insights.**

---

## 🚀 Project Overview

**Olist E-Commerce Marketplace Analytics** is an end-to-end data analytics project built on the Brazilian Olist e-commerce dataset.

The project covers the complete journey from **raw CSV data → Python analysis → PostgreSQL → SQL business analysis → Power BI dashboard**.

The analysis covers **99,441 orders, 96,096 unique customers and 112,650 order items**, with a focus on marketplace revenue, customer geography, product categories, sellers, payments and reviews.

```text
                    ARPIT TYAGI
                         │
                    Raw Olist Data
                         │
                         ▼
              Python Data Exploration
                         │
                         ▼
               Data Quality & Cleaning
                         │
                         ▼
                  PostgreSQL Model
                         │
                         ▼
                 SQL Business Analysis
                         │
                         ▼
                  Power BI Dashboard
                         │
                         ▼
                  Business Insights
```

---

## 🎯 What This Project Answers

- What is the total marketplace revenue?
- How many orders and unique customers are present?
- Which Brazilian states generate the most orders and revenue?
- Which product categories generate the most revenue?
- Which sellers generate the highest revenue?
- Which payment methods are most commonly used?
- What is the distribution of customer review scores?
- How does marketplace revenue change over time?

---

# 📊 Project Snapshot

| KPI | Result |
|---|---:|
| 💰 Total Revenue | **13.59M** |
| 🛒 Total Orders | **99,441** |
| 👥 Unique Customers | **96,096** |
| 📦 Order Items | **112,650** |
| 💵 Average Order Value | **137.75** |
| ⭐ Average Review Score | **4.09 / 5** |
| 🏪 Sellers | **3,095** |
| 🛍️ Products | **32,951** |

> Revenue represents the sum of product item prices and excludes freight charges.

---

# 🔍 01 — Data Understanding

Initial exploration was performed using **Python, Pandas and Jupyter Notebook**.

The analysis focused on:

- Dataset dimensions
- Column structures
- Primary identifiers
- Relationships between datasets
- Customer-level vs order-level granularity
- Order-item relationships
- Repeat customer identification

### Key observation

An order can contain multiple order items, so order-level and item-level metrics were handled separately.

`customer_unique_id` was used for customer-level analysis because the same customer can have multiple `customer_id` records.

---

# 🧹 02 — Data Quality & Preparation

Before database analysis, the datasets were checked for:

- Missing values
- Duplicate records
- Incorrect data types
- Date/time formatting
- Numeric consistency
- Key and relationship integrity

Processed datasets:

```text
data/processed/
├── orders_clean.csv
├── order_items_clean.csv
└── reviews_clean.csv
```

Raw data is excluded from Git using `.gitignore`.

---

# 🗄️ 03 — PostgreSQL Data Model

The Olist datasets were structured into relational PostgreSQL tables.

```text
customers
     │
     ▼
   orders
   ├──────────────┐
   ▼              ▼
order_items     payments
   │
   ├──────────► products
   │
   └──────────► sellers

orders ───────► reviews
```

### Key Relationships

```text
customers.customer_id
        ↓
orders.customer_id

orders.order_id
        ↓
order_items.order_id
payments.order_id
reviews.order_id

order_items.product_id → products.product_id
order_items.seller_id  → sellers.seller_id
```

Schema:

`sql/schema.sql`

---

# 📈 04 — SQL Business Analysis

I developed **20+ SQL business queries** covering:

- Aggregations
- Filtering
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `DISTINCT`
- `INNER JOIN`
- Date-based analysis
- Subqueries

Analysis:

`sql/business_analysis.sql`

### Selected Findings

#### 🌎 Geography

**São Paulo (SP)** recorded the highest order volume:

**41,746 orders**

and the highest revenue:

**5.20M**

#### 🛍️ Product Categories

Top revenue categories included:

| Category | Revenue |
|---|---:|
| beleza_saude | 1.26M |
| relogios_presentes | 1.21M |
| cama_mesa_banho | 1.04M |
| esporte_lazer | 988K |
| informatica_acessorios | 912K |

#### 💳 Payments

Credit card was the most frequently used payment method:

**76,505 orders**

#### ⭐ Reviews

Average review score:

**4.09 / 5**

Five-star reviews were the largest review group with:

**57,328 reviews**

---

# 📊 05 — Power BI Dashboard

The final Power BI report contains four focused analytical pages.

### 01 — Executive Summary

**KPIs**
- Total Revenue
- Unique Customers
- Total Orders
- Average Order Value
- Average Review Score

**Visual**
- Monthly Revenue Trend

### 02 — Customer & Geography

- Orders by Customer State
- Revenue by Customer State

### 03 — Products & Sellers

- Top 10 Product Categories by Revenue
- Top 10 Sellers by Revenue

### 04 — Payments & Reviews

- Review Score Distribution
- Orders by Payment Method

Power BI report:

`PowerBI Reports/Olist_Ecommerce_Analytics.pbix`

---

# 📅 Revenue Trend Note

The Olist dataset contains only partial observations for the final months of 2018.

Therefore, **September and October 2018 were excluded from the main monthly revenue visualization** so that incomplete periods were not interpreted as a full-month decline.

---

# 🛠️ Tech Stack

```text
Python       → Data exploration & cleaning
Pandas       → Data manipulation
NumPy        → Numerical analysis
PostgreSQL   → Relational database
SQL          → Business analysis
Power BI     → Dashboard & visualization
Jupyter      → Exploratory analysis
Git/GitHub   → Version control
```

---

# 📁 Project Structure

```text
ecommerce-marketplace-analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_dataset_understanding.ipynb
│   └── 02_data_quality.ipynb
│
├── sql/
│   ├── schema.sql
│   └── business_analysis.sql
│
├── PowerBI Reports/
│   └── Olist_Ecommerce_Analytics.pbix
│
├── README.md
└── .gitignore
```

---

# ⚡ Reproduce the Project

### 1. Clone

```bash
git clone <https://github.com/arpittyagi-at/ecommerce-marketplace-analytics>
cd ecommerce-marketplace-analytics
```

### 2. Run notebooks

Open:

```text
notebooks/01_dataset_understanding.ipynb
notebooks/02_data_quality.ipynb
```

### 3. Create PostgreSQL schema

Execute:

```text
sql/schema.sql
```

Then load the Olist CSV files into the corresponding tables.

### 4. Run business analysis

Execute:

```text
sql/business_analysis.sql
```

### 5. Open Power BI

Open:

```text
PowerBI Reports/Olist_Ecommerce_Analytics.pbix
```

Update the PostgreSQL connection if required.

---

# 💡 What I Built

This project demonstrates practical experience with:

- Relational data modeling
- Data cleaning and validation
- SQL-based business analysis
- Multi-table joins
- Aggregation and KPI creation
- Time-series analysis
- Interactive BI dashboards
- Translating raw data into business insights

---

## 👨‍💻 ARPIT TYAGI 

**Data Analytics • SQL • Python • PostgreSQL • Power BI**

Built as a portfolio project to demonstrate an end-to-end analytics workflow — from raw datasets to a production-style business intelligence dashboard.

<p align="center">
  <b>Turning data into decisions. 📊</b>
</p>
