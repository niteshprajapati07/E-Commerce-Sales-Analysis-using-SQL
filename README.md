# E-Commerce Sales Analysis using SQL

##  SQL for Data Analysis

### Objective

Use SQL queries to extract, manipulate, and analyze e-commerce sales data from a relational database.

### Tools Used

* MySQL
* MySQL Workbench
* GitHub

### Dataset

E-Commerce Sales Dataset containing order, customer, product, sales, profit, delivery, and transaction information.

## SQL Concepts Implemented

The following SQL concepts were used in this project:

1. **SELECT** – Retrieve data from the Orders table.
2. **WHERE** – Filter orders based on sales value.
3. **ORDER BY** – Sort orders by sales.
4. **GROUP BY** – Analyze sales by category and customer segment.
5. **Aggregate Functions** – Used `SUM()`, `AVG()`, and `COUNT()`.
6. **INNER JOIN** – Combine orders with customer information.
7. **LEFT JOIN** – Retrieve all orders with matching customer information.
8. **RIGHT JOIN** – Retrieve all customers with matching order information.
9. **Subqueries** – Identify orders with sales above the average sales value.
10. **Views** – Created `Category_Sales_Analysis` for reusable analysis.
11. **Indexes** – Created indexes on frequently used columns for query optimization.

## Key Analysis Performed

* Category-wise sales analysis
* Segment-wise sales and profit analysis
* Top 10 products by sales
* Total sales and total profit
* Average sales
* Total number of orders
* Orders above average sales
* Customer and order data using JOIN operations

## Project Structure

```text
E-Commerce-Sales-Analysis/
│
├── ecommerce_sales_analysis.sql
│
├── screenshots/
│   ├── 01_select.png
│   ├── 02_where.png
│   ├── 03_order_by.png
│   ├── 04_group_by.png
│   ├── 05_aggregate_functions.png
│   ├── 06_segment_analysis.png
│   ├── 07_top_10_products.png
│   ├── 08_inner_join.png
│   ├── 09_left_join.png
│   ├── 10_right_join.png
│   ├── 11_subquery.png
│   ├── 12_view.png
│   └── 13_indexes.png
│
└── README.md
```

## Outcome

This project demonstrates practical SQL skills for data analysis, including data filtering, sorting, aggregation, grouping, joins, subqueries, views, and query optimization using indexes.
