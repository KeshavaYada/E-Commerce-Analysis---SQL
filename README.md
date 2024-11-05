# E-Commerce Analysis 📊

E-commerce Database Analysis with PostgreSQL: Solving Business Problems with SQL

## Project Overview 📝
This project involves analyzing an e-commerce dataset similar to Amazon using SQL. The goal is to answer key business questions and gain insights that can guide business decisions. The analysis was done by creating a PostgreSQL database, defining tables, conducting exploratory data analysis (EDA), and solving various business problems to derive actionable insights.

### Objectives
- Create a structured database to manage and analyze e-commerce data.
- Conduct exploratory data analysis (EDA) to identify trends and patterns.
- Solve business problems with SQL to aid in decision-making.

---

## Folder Structure 📂
- **datasets/**: Contains all raw datasets used for analysis, including customer, order, product, and category data.
- **Outputs/**: Includes output files in the form of images and tables generated from the analysis.
- **Defining the Tables.sql**: SQL code for defining and structuring the tables in the database.
- **E_Commerce_EDA.ipynb**: Jupyter Notebook for exploratory data analysis (EDA).
- **My_ERD_Database.png**: Entity Relationship Diagram (ERD) visualizing the database schema.
- **Problems_solving.sql**: SQL queries used to solve the business problems.
- **README.md**: Project documentation (you're reading it!).

### Datasets 📁
The `datasets` folder includes:
- `category.csv`
- `customers.csv`
- `inventory.csv`
- `order_items.csv`
- `orders.csv`
- `payments.csv`
- `products.csv`
- `sellers.csv`
- `shipping.csv`

### ERD Diagram 🗂️
The ERD diagram (`My_ERD_Database.png`) shows the relationships between entities like customers, orders, products, categories, and payments. This structure enables efficient querying and analysis.
![ERD Diagram](https://github.com/YourUsername/YourRepositoryName/blob/main/path/to/My_ERD_Database.png)
---

## Business Problems Solved ✅

Below are the business problems addressed, along with the SQL queries (located in `Problems_solving.sql`):

1. **Top Selling Products** 🏆  
   - Query the top 10 products by total sales value.
   - **Challenge**: Include product name, total quantity sold, and total sales value.

2. **Revenue by Category** 💰  
   - Calculate total revenue generated by each product category.
   - **Challenge**: Include the percentage contribution of each category to total revenue.

3. **Average Order Value (AOV)** 📈  
   - Compute the average order value for each customer.
   - **Challenge**: Include only customers with more than 5 orders.

4. **Monthly Sales Trend** 📅  
   - Query monthly total sales over the past year.
   - **Challenge**: Display the sales trend, including current month sales and last month sales.

5. **Customers with No Purchases** ❌  
   - Find customers who have registered but never placed an order.
   - **Challenge**: List customer details and the time since their registration.

6. **Least-Selling Categories by State** 🚨  
   - Identify the least-selling product category for each state.
   - **Challenge**: Include the total sales for that category within each state.

7. **Customer Lifetime Value (CLTV)** 💸  
   - Calculate the total value of orders placed by each customer over their lifetime.
   - **Challenge**: Rank customers based on their CLTV.

8. **Inventory Stock Alerts** ⚠️  
   - Query products with stock levels below a certain threshold (e.g., less than 10 units).
   - **Challenge**: Include the last restock date and warehouse information.

9. **Shipping Delays** 🕒  
   - Identify orders where the shipping date is more than 3 days after the order date.
   - **Challenge**: Include customer, order details, and delivery provider.

10. **Payment Success Rate** 💳  
    - Calculate the percentage of successful payments across all orders.
    - **Challenge**: Include breakdowns by payment status (e.g., failed, pending).

11. **Top Performing Sellers** 🥇  
    - Find the top 5 sellers based on total sales value.
    - **Challenge**: Include both successful and failed orders, and display the percentage of successful orders.

12. **Product Profit Margin** 📊  
    - Calculate the profit margin for each product (difference between price and cost of goods sold).
    - **Challenge**: Rank products by their profit margin, from highest to lowest.

13. **Most Returned Products** 🔄  
    - Query the top 10 products by the number of returns.
    - **Challenge**: Display the return rate as a percentage of total units sold for each product.

14. **Inactive Sellers** 🛑  
    - Identify sellers who haven’t made any sales in the last 6 months.
    - **Challenge**: Show the last sale date and total sales from those sellers.

15. **Returning vs. New Customers** 🔄👤  
    - Categorize customers as "returning" if they have more than 5 returns, otherwise as "new."
    - **Challenge**: List customer ID, name, total orders, and total returns.

16. **Top 5 Customers by Orders in Each State** 🌎  
    - Identify the top 5 customers with the highest number of orders for each state.
    - **Challenge**: Include the number of orders and total sales for each customer.

17. **Revenue by Shipping Provider** 🚚  
    - Calculate the total revenue handled by each shipping provider.
    - **Challenge**: Include the total number of orders and average delivery time for each provider.

18. **Top 10 Products with Decreasing Revenue** 📉  
    - Find the top 10 products with the highest revenue decrease ratio from 2022 to 2023.
    - **Challenge**: Return product ID, product name, category name, 2022 revenue, 2023 revenue, and decrease ratio.

---

## Getting Started 🚀

### Prerequisites
- **PostgreSQL**: Ensure you have PostgreSQL installed for database creation and querying.
- **Jupyter Notebook**: Required for EDA in `E_Commerce_EDA.ipynb`.
- **pgAdmin**: Recommended for managing the PostgreSQL database.



