# Retail Sales Dataset Analysis – Google BigQuery + Power BI

![Project Banner](https://via.placeholder.com/1200x400.png?text=Retail+Sales+Analysis+Dashboard)  
*Practical Exercise – BigQuery SQL + Reporting*

## Project Overview
This repository contains a complete end-to-end data analysis project based on a retail sales dataset with 1,000+ transactions recorded throughout 2023 (and one transaction in 2024).  
The goal is to master Google BigQuery SQL concepts while extracting meaningful business insights and building an interactive Power BI dashboard.

### Key Learning Objectives
- WHERE, GROUP BY, HAVING, CASE statements
- Conditional aggregation & calculated fields
- Subqueries & window functions (average comparison)
- Data modeling and visualization in Power BI

## Dataset Information
**File**: `retail_sales_dataset.csv`  
**Rows**: 1,000+  
**Columns**:
| Column            | Description                         | Data Type |
|-------------------|-------------------------------------|-----------|
| Transaction_ID    | Unique transaction identifier       | INT       |
| Date              | Transaction date                    | DATE      |
| Customer_ID       | Unique customer identifier          | STRING    |
| Gender            | Male / Female                       | STRING    |
| Age               | Customer age (18–64)                | INT       |
| Product_Category  | Beauty, Clothing, Electronics       | STRING    |
| Quantity          | Units sold                          | INT       |
| Price_per_Unit    | Price per item                      | INT       |
| Total_Amount      | Quantity × Price_per_Unit           | INT       |

## Folder Structure
├── data/
│   └── retail_sales_dataset.csv          # Raw dataset
├── queries/
│   └── bigquery_exercises.sql            # All 10 SQL solutions (commented)
├── powerbi/
│   └── Retail_Sales_Dashboard.pbix       # Ready-to-use Power BI file
├── presentation/
│   └── Retail_Sales_Analysis.pptx        # 12-slide presentation
├── screenshots/                          # Dashboard & query previews
└── README.md                             # You are here


## How to Set Up & Run

### 1. Google BigQuery (SQL)
1. Create a new project or use an existing one in Google Cloud.
2. Create a dataset (e.g., `retail_analysis`).
3. Upload `retail_sales_dataset.csv` → Create table → Name it `retail_sales`.
4. Open BigQuery SQL editor and run queries from `queries/bigquery_exercises.sql`.

### 2. Power BI Dashboard
1. Download and open `Retail_Sales_Dashboard.pbix` with Power BI Desktop (free).
2. If you prefer to build from scratch:
   - Get Data → Text/CSV → load `retail_sales_dataset.csv`
   - Create the calculated columns (Age_Group, Spending_Level, Unit_Cost_Category) using the DAX provided in the file.
3. Explore the 3-page interactive dashboard.

### 3. PowerPoint Presentation
Open `Retail_Sales_Analysis.pptx` – ready for classroom or client presentation (12 clean slides with insights and visuals).

## SQL Solutions (queries/bigquery_exercises.sql)

```sql
-- Q1: Transactions in 2023
SELECT * FROM `your-project.retail_analysis.retail_sales`
WHERE EXTRACT(YEAR FROM Date) = 2023;

-- Q2: Transactions above average Total_Amount
SELECT * FROM `your-project.retail_analysis.retail_sales`
WHERE Total_Amount > (SELECT AVG(Total_Amount) FROM `your-project.retail_analysis.retail_sales`);

-- Q3: Total Revenue
SELECT SUM(Total_Amount) AS Total_Revenue FROM `your-project.retail_analysis.retail_sales`;

-- Q4: Distinct Product Categories
SELECT DISTINCT Product_Category FROM `your-project.retail_analysis.retail_sales`;

-- Q5: Total Quantity per Category
SELECT Product_Category, SUM(Quantity) AS Total_Quantity
FROM `your-project.retail_analysis.retail_sales`
GROUP BY Product_Category;

-- Q6: Age Group Classification
SELECT Customer_ID, Age,
  CASE 
    WHEN Age < 30 THEN 'Youth'
    WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS Age_Group
FROM `your-project.retail_analysis.retail_sales`;

-- Q7: High-Value Transactions (>500) by Gender
SELECT Gender, COUNT(*) AS High_Value_Transactions
FROM `your-project.retail_analysis.retail_sales`
WHERE Total_Amount > 500
GROUP BY Gender;

-- Q8: Categories with Total Revenue > 5,000
SELECT Product_Category, SUM(Total_Amount) AS Total_Revenue
FROM `your-project.retail_analysis.retail_sales`
GROUP BY Product_Category
HAVING SUM(Total_Amount) > 5000;

-- Q9: Unit Cost Category
SELECT Transaction_ID, Price_per_Unit,
  CASE
    WHEN Price_per_Unit < 50 THEN 'Cheap'
    WHEN Price_per_Unit BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
  END AS Unit_Cost_Category
FROM `your-project.retail_analysis.retail_sales`;

-- Q10: Customers ≥40 with Spending Level
SELECT Customer_ID, Age, Total_Amount,
  CASE WHEN Total_Amount > 1000 THEN 'High' ELSE 'Low' END AS Spending_Level
FROM `your-project.retail_analysis.retail_sales`
WHERE Age >= 40;





