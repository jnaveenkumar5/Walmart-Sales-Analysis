# 🛒 Walmart Sales Data Analysis

## 📌 About  
This project aims to explore Walmart Sales data to understand:  
- **Top-performing branches and products**  
- **Sales trends of different products**  
- **Customer behavior and purchase patterns**  
- **Ways to improve and optimize sales strategies**  

The dataset was obtained from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/competitions/walmart-recruiting-store-sales-forecasting/overview).  

### 🔍 Dataset Overview  
The dataset contains sales transactions from three Walmart branches in **Mandalay, Yangon, and Naypyitaw**, with **17 columns** and **1000 rows**.

| Column                | Description                                  | Data Type       |
|-----------------------|----------------------------------------------|----------------|
| `invoice_id`         | Invoice of the sales made                    | `VARCHAR(30)`  |
| `branch`             | Branch where sales were made                 | `VARCHAR(5)`   |
| `city`               | Location of the branch                       | `VARCHAR(30)`  |
| `customer_type`      | Type of the customer                         | `VARCHAR(30)`  |
| `gender`            | Gender of the customer                       | `VARCHAR(10)`  |
| `product_line`      | Product line of the sold product             | `VARCHAR(100)` |
| `unit_price`        | Price of each product                        | `DECIMAL(10,2)` |
| `quantity`         | Quantity of the product sold                 | `INT`         |
| `VAT`              | Tax amount on the purchase                   | `FLOAT(6,4)`  |
| `total`            | Total cost of the purchase                    | `DECIMAL(10,2)` |
| `date`             | Date of the transaction                       | `DATE`        |
| `time`             | Time of the transaction                       | `TIMESTAMP`   |
| `payment_method`   | Payment method used                           | `VARCHAR(15)` |
| `cogs`             | Cost of Goods Sold (COGS)                     | `DECIMAL(10,2)` |
| `gross_margin_pct` | Gross margin percentage                       | `FLOAT(11,9)` |
| `gross_income`     | Gross Income                                   | `DECIMAL(10,2)` |
| `rating`           | Customer rating                               | `FLOAT(2,1)` |

---

## 🎯 Project Goals
The major goal of this project is to **analyze Walmart's sales data** to identify **factors that impact sales** across different branches.

### 🔹 Key Analysis Areas:
1. **Product Analysis**
   - Identify the best-performing product lines.
   - Determine which product lines need improvement.

2. **Sales Analysis**
   - Study sales trends of different products.
   - Evaluate the effectiveness of different sales strategies.

3. **Customer Analysis**
   - Identify customer segments and purchasing behavior.
   - Analyze the profitability of each customer type.

---

## ⚙️ Approach Used

### 1️⃣ **Data Wrangling**
- Inspected and cleaned the data.
- Handled missing values (if any).
- Created a database and imported the cleaned dataset.

### 2️⃣ **Feature Engineering**
- Added new features to enhance the analysis:
  - **`time_of_day`** → Categorizes sales as **Morning, Afternoon, or Evening**.
  - **`day_name`** → Extracts the **day of the week** (Mon-Sun).
  - **`month_name`** → Extracts the **month** (Jan-Dec).

### 3️⃣ **Exploratory Data Analysis (EDA)**
- Used SQL queries and visualizations to extract insights.

---

## 📊 Business Questions Answered  

### 🔹 General Questions
- **How many unique cities are in the dataset?**
- **Which city has each branch?**

### 🔹 Product-Based Insights
- **How many unique product lines exist?**
- **What is the most common payment method?**
- **Which product line generates the most revenue?**
- **Which city has the highest revenue?**
- **Which product line has the highest VAT?**
- **Which branch sells more products than the average?**
- **What is the most common product line by gender?**
- **What is the average rating per product line?**

### 🔹 Sales Insights
- **Sales distribution by time of day and weekday.**
- **Which customer type generates the most revenue?**
- **Which city has the highest VAT percentage?**
- **Which customer type pays the highest VAT?**

### 🔹 Customer Insights
- **How many unique customer types exist?**
- **What is the most common customer type?**
- **Which customer type purchases the most?**
- **Gender distribution per branch.**
- **Which time of day receives the highest ratings?**
- **Which day of the week has the highest average ratings per branch?**

---

## 💰 Revenue & Profit Calculations  

### Key Financial Formulas  

- **Cost of Goods Sold (COGS)**  
  $$ COGS = \text{unit price} \times \text{quantity} $$

- **VAT Calculation (5% of COGS)**  
  $$ VAT = 0.05 \times COGS $$

- **Total Revenue (Gross Sales)**  
  $$ \text{Total} = VAT + COGS $$

- **Gross Profit Calculation**  
  $$ \text{Gross Profit} = \text{Total} - COGS $$

- **Gross Margin Percentage**  
  $$ \text{Gross Margin} = \frac{\text{Gross Income}}{\text{Total Revenue}} $$  

---

### Example Calculation (First Row in Dataset)  

#### Given Data:
- **Unit Price** = $45.79$  
- **Quantity** = $7$  

#### Calculation:

1. **COGS Calculation**  
   $$ COGS = 45.79 \times 7 = 320.53 $$  

2. **VAT Calculation**  
   $$ VAT = 5\% \times 320.53 = 16.0265 $$  

3. **Total Revenue Calculation**  
   $$ \text{Total} = 320.53 + 16.0265 = 336.5565 $$  

4. **Gross Margin Percentage Calculation**  
   $$ \text{Gross Margin} = \frac{16.0265}{336.5565} \approx 0.0476 \text{ (4.76%)} $$  
## 📌 Code  
For the rest of the code, check the WalmartsalesSQL file.  

### 🛠 Database & Table Creation  

```sql
-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Use database
USE walmartSales;

-- Create table
CREATE TABLE IF NOT EXISTS sales (
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2,1)
);
```
## 🛠 Tools Used  

- **Database**: MySQL  
- **Analytics & Querying**: SQL   
- **Dataset Source**: [Kaggle - Walmart Sales Forecasting](https://www.kaggle.com/)  

---

## 📌 Conclusion  

This project provided valuable insights into Walmart's sales data, helping us understand key business trends.  
### 🔹 Key Takeaways:
1. **Top Performing Branches & Products**  
   - Identified the highest revenue-generating branches and best-selling product lines.  

2. **Sales Trends & Seasonal Patterns**  
   - Analyzed monthly and daily sales trends to determine peak sales periods.  

3. **Customer Behavior & Purchase Trends**  
   - Examined customer types, purchase frequency, and most common payment methods.  

4. **Revenue & Profitability Analysis**  
   - Assessed gross income, VAT impact, and overall business performance.  





