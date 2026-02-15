# 📊 SQL Retail Sales Analysis – Project P1

## Project Overview

This project is a hands-on SQL analysis exercise based on a retail sales dataset.

The main goal of this project is to strengthen my SQL fundamentals by working with structured transactional data and applying analytical queries.

The project was built using PostgreSQL.

---

## Dataset Description

The dataset contains retail transaction data with the following columns:

| Column | Description |
|--------|------------|
| transactions_id | Unique transaction identifier |
| sale_date | Date of sale |
| sale_time | Time of sale |
| customer_id | Unique customer identifier |
| gender | Customer gender |
| age | Customer age |
| category | Product category |
| quantity | Number of items purchased |
| price_per_unit | Price per unit |
| cogs | Cost of goods sold |
| total_sale | Total transaction value |

---

## Database Setup

###  Create Database

```sql
CREATE DATABASE sql_projekt;
```
## Initial Table Creation (Safe Import Version)

To avoid CSV import issues, the table was first created using `TEXT` data types.

```sql
CREATE TABLE retail_sales (
    transactions_id TEXT,
    sale_date TEXT,
    sale_time TEXT,
    customer_id TEXT,
    gender TEXT,
    age TEXT,
    category TEXT,
    quantity TEXT,
    price_per_unit TEXT,
    cogs TEXT,
    total_sale TEXT
);
```
##  Converting to Proper Data Types

After importing the data successfully, columns were converted to appropriate data types:

- `INTEGER`
- `DATE`
- `TIME`
- `NUMERIC`

A **primary key** was set on `transactions_id`.

---

## SQL Concepts Applied

### Aggregation Functions
- `COUNT()`, `SUM()`, `AVG()`
- `DISTINCT` and `GROUP BY`
- Counting unique categories
- Monthly and yearly aggregations

### Date Functions
- `EXTRACT(YEAR FROM sale_date)`
- `EXTRACT(MONTH FROM sale_date)`

### Window Functions
- `RANK()`
- `PARTITION BY`
---

## 🧠 Key Learnings

- Proper usage of `GROUP BY`
- Difference between `DISTINCT` and `COUNT(DISTINCT)`
- How window functions operate
- How `PARTITION BY` works inside window functions
- Importance of correct data types
- Handling CSV import and delimiter issues
- Setting primary keys and constraints

---
