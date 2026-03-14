# 📚 Bookstore SQL Data Analysis Project

## 📌 Project Overview

This project focuses on analyzing a **Bookstore dataset** using SQL.
The dataset includes information about **books, customers, and orders**.
Using SQL queries, we perform data analysis to gain insights into **sales performance, customer behavior, and inventory management**.

This project demonstrates the use of **SQL concepts such as filtering, aggregation, joins, grouping, and subqueries**.

---

## 🗂 Dataset Description

The project contains the following datasets in CSV format:

| File Name     | Description                                                                 |
| ------------- | --------------------------------------------------------------------------- |
| books.csv     | Contains details about books such as title, author, genre, price, and stock |
| customers.csv | Contains customer information such as name, email, phone, city, and country |
| orders.csv    | Contains order details including order date, quantity, and total amount     |

---

## 🛠 Tools & Technologies Used

* SQL
* PostgreSQL
* CSV Dataset
* GitHub

---

## 📊 Database Tables

### 1️⃣ Books Table

Stores information about books available in the store.

Example columns:

* book_id
* title
* author
* genre
* published_year
* price
* stock

---

### 2️⃣ Customers Table

Stores information about bookstore customers.

Example columns:

* customer_id
* name
* email
* phone
* city
* country

---

### 3️⃣ Orders Table

Stores purchase details for books ordered by customers.

Example columns:

* order_id
* book_id
* customer_id
* order_date
* quantity
* total_amount

---

# 🔎 SQL Analysis Performed

## 🟢 Basic Queries

Some basic SQL queries used in the project include:

* Retrieve all books in the **Fiction** genre
* Find books published **after 1950**
* List customers from a specific **city**
* Retrieve **orders placed in November 2023**
* Calculate **total stock available**
* Find the **most expensive book**
* List **distinct genres**
* Find books with **lowest stock**
* Calculate **total revenue**

---

## 🔵 Advanced Queries

Advanced SQL queries performed include:

* Total books sold **per genre**
* Average price of books in **Fantasy genre**
* Customers who placed **at least 2 orders**
* Most frequently ordered book
* Top **3 most expensive Fantasy books**
* Total books sold **per author**
* Cities where customers spent **more than $30**
* Customer who **spent the most**
* Calculate **remaining stock after orders**
* Customers who ordered **quantity = 2**

---

## 📁 Project Structure

```
bookstore-sql-analysis
│
├── books.csv
├── customers.csv
├── orders.csv
├── queries.sql
└── README.md
```

---

## 📈 Key Insights

* Identify the **most popular books**
* Track **customer purchasing behavior**
* Analyze **genre-wise sales**
* Monitor **inventory stock levels**
* Calculate **total revenue from orders**

---

## 🎯 Learning Outcomes

Through this project I practiced:

* SQL Filtering (`WHERE`)
* Aggregation (`SUM`, `AVG`, `COUNT`)
* Joins (`INNER JOIN`, `LEFT JOIN`)
* Grouping (`GROUP BY`, `HAVING`)
* Sorting (`ORDER BY`)
* Subqueries
* Data analysis using SQL

---

## 👨‍💻 Author

**Deepak Kumar**

SQL Data Analysis Project

---

⭐ If you like this project, feel free to star the repository!

