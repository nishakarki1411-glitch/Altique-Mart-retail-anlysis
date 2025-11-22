# Altique-Mart-retail-anlysis


<div align="center">
  
![SQL](https://img.shields.io/badge/SQL-Database-blue?style=for-the-badge&logo=mysql)
![Data Analysis](https://img.shields.io/badge/Data-Analysis-orange?style=for-the-badge&logo=chartdotjs)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

**A comprehensive SQL-based analysis of promotional campaigns and retail events**


</div>

---

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Business Context](#business-context)
- [Dataset Information](#dataset-information)
- [Ad-Hoc Analysis](#ad-hoc-analysis)
- [Key Insights](#key-insights)
- [Tools and Technologies](#tools-and-technologies)
- [How to Use This Repository](#how-to-use-this-repository)
- [Connect With Me](#connect-with-me)



---

##  Project Overview

This project is part of the **Codebasics Resume Project Challenge**, where I analyzed retail promotional campaigns data using SQL to extract meaningful business insights. The analysis focuses on understanding campaign effectiveness, product performance, and store-level metrics across different promotional events.

###  Campaign Period Analysis
The dataset covers promotional campaigns including:
- 🪔 **Diwali Campaign**
- 🎊 **Sankranti Campaign**
  
---

## Business Context

AtliQ Mart is a retail giant with over 50 supermarkets in southern India. The company ran massive promotions during Diwali 2023 and Sankranti 2024 on their AtliQ branded products. The sales director wants to understand which promotions performed well and which didn't, to make informed decisions for future promotional campaigns.

###  Objectives
- Analyze promotional campaign effectiveness
- Identify top-performing products and categories
- Evaluate store-level performance across cities
- Calculate key metrics like Incremental Sold Quantity (ISU) and Incremental Revenue (IR)
- Provide data-driven recommendations for future campaigns
- Identify top promotion types by  Incremental Revenue (IR)
---

##  Dataset Information

The analysis is based on four interconnected tables in the `retail_events_db` database:

###  Database Schema

```
retail_events_db
├── dim_campaigns (Campaign details and timelines)
├── dim_products (Product catalog and categories)
├── dim_stores (Store locations and cities)
└── fact_events (Sales transactions and promotional data)
```

###  Table Descriptions

| Table | Key Columns | Description |
|-------|-------------|-------------|
| **dim_campaigns** | campaign_id, campaign_name, start_date, end_date | Stores promotional campaign information |
| **dim_products** | product_code, product_name, category | Product master data with categories |
| **dim_stores** | store_id, city | Store location information |
| **fact_events** | event_id, store_id, campaign_id, product_code, base_price, promo_type, quantity_sold_before , quantity_sold_after | Transactional sales data with promotional details |

###  Promotion Types
-  **Percentage Discounts** (25% OFF, 50% OFF, etc.)
-  **BOGOF** (Buy One Get One Free)
-  **Cashback** offers
-  **Bundle deals** and more

---

##  Ad-Hoc Analysis

This project addresses **8 critical business questions** through SQL queries. Each query is accompanied by:
-  SQL code with detailed comments
-  Visualized results (charts/graphs)
-  Business insights and interpretations


###  Ad-Hoc Business Requests

#### **Request 1: High-Value BOGOF Products**   [SQL](SQL_Queries/query1.sql) | [screenshots](screenshots/Chart1.png)


Provide a list of products with a base price greater than 500 and that are featured in promo type of 'BOGOF' (Buy One Get One Free). This information will help us identify high-value products that are currently being heavily discounted, which can be useful for evaluating our pricing and promotion strategies. 


---

#### **Request 2: Store Distribution Overview**   [SQL](SQL_Queries/query2.sql) | [screenshots](screenshots/Chart2.png)

Generate a report that provides an overview of the number of stores in each city. The results will be sorted in descending order of store counts, allowing us to identify the cities with the highest store presence. The report includes two essential fields: city and store count, which will assist in optimizing our retail operations.


**Output Fields:** `city`, `store_count`

---

#### **Request 3: Campaign Revenue Report** [SQL](SQL_Queries/query3.sql) | [screenshots](screenshots/Chart3.png)

Generate a report that displays each campaign along with the total revenue generated before and after the campaign? The report includes three key fields:

- `campaign_name`
- `total_revenue(before_promotion)`
- `total_revenue(after_promotion)`

This report should help in evaluating the financial impact of our promotional campaigns. (Display the values in millions)

---

#### **Request 4: Diwali Campaign ISU Analysis**    [SQL](SQL_Queries/query4.sql) | [screenshots](screenshots/Chart4.png)

Produce a report that calculates the Incremental Sold Quantity (ISU%) for each category during the Diwali campaign. Additionally, provide rankings for the categories based on their ISU%. The report will include three key fields. 

- `category`
- `isu%`
- `rank order`

This information will assist in assessing the category-wise success and impact of the Diwali campaign on incremental sales.

**Note:** ISU% (Incremental Sold Quantity Percentage) is calculated as the percentage increase/decrease in quantity sold (after promo) compared to quantity sold (before promo)

---

#### **Request 5: Top 5 Products by IR%** [SQL](SQL_Queries/query5.sql) | [screenshots](screenshots/Chart5.png)

Create a report featuring the Top 5 products, ranked by Incremental Revenue Percentage (IR%), across all campaigns. The report will provide information on: 

- `product_name`
- `category`
- `ir%`

This analysis helps identify the most successful products in terms of incremental revenue across our campaigns. The calculation for IR% is as follows:

**IR% = (ir/revenue before promotion) × 100**

---
#### **Request 6: Category-Wise Sales Lift Analysis**    [SQL](SQL_Queries/query6.sql) | [screenshots](screenshots/Chart6.png)


Analyze which product categories experienced the biggest lift in sales due to promotions. The report should include

---

#### **Request 7: Top Promotion Types by Incremental Revenue**   [SQL](SQL_Queries/query7.sql) | [screenshots](screenshots/Chart7.png)


Identify the top 2 promotion types that generated the highest incremental revenue across all campaigns. The report includes

---


#### **Request 8: Top stores by  Incremental Revenue    [SQL](SQL_Queries/query8.sql) | [screenshots](screenshots/Chart8.png)


List the top 10 stores ranked by incremental revenue generated during promotions



---

##  Key Insights

###  Top Findings

-  **Campaign Performance**: Diwali campaign dominated with ₹125M incremental revenue (152% growth), outperforming Sankranti , while both campaigns collectively doubled baseline revenue to ₹347M—validating AtliQ's festive promotional strategy but highlighting need for Sankranti optimization.

-  **Best Promotion Type**: BOGOF (Buy One Get One Free) emerged as the star performer, with premium products like Atliq Waterproof Immersion Rod (266% IR) and LED Bulbs (263% IR) leading the charge—though its application on high-value items (>₹500) raises margin sustainability concerns requiring strategic recalibration.
  
-  **Top Performing Cities**:Store distribution analysis reveals concentration in South Indian metros, with Bengaluru leading at 10 stores (20% of total network), followed by Chennai (8) and Hyderabad (7), collectively accounting for 50% of all stores—creating strong regional dominance but highlighting geographic concentration risks and significant expansion opportunities in North and West Indian markets.

-  **Category Winners**: Combo1 led revenue with ₹122.6M despite low volume, while Grocery & Staples drove the highest volume but lower revenue (₹42.6M). This shows premium categories bring revenue, while staples drive volume.
 
-  **Revenue Impact**:  Promotional campaigns generated ₹207M in total incremental revenue across both festivals, representing a remarkable 147.9% growth over baseline revenue of ₹140M—effectively achieving ₹2.48 earned for every ₹1 of baseline revenue, though profitability analysis remains critical to ensure sustainable growth beyond top-line numbers

###  Recommendations

1. Prioritize Value Over Volume 💰
- What: Shift budget to high-revenue categories
- Key Actions:

1. 60% budget to Combo1 & Home Appliances (₹147.6M revenue)
2. Limit BOGOF to products <₹500
3. Diwali gets 60% budget (₹125M IR justifies it)
4. Optimize Sankranti strategy.
---

2. Accelerate Tier-2 City Expansion 🏪
- What: Replicate Mysuru's success model
- Key Actions:

1. Launch in 8-10 tier-2 cities (Pune, Jaipur, Indore, Nagpur)
2. 3-4 stores per city (Mysuru model: STMYS-1 = ₹6.45M)
3. Reduce 100% South India risk
4. Target 25% revenue from tier-2 in 18 months.
---

3. Execute Emergency Category Intervention 🚨
- What: Fix Personal Care + Scale Combo1 success
- Key Actions:

1. Personal Care turnaround (90-day plan for ₹0.7M disaster)
2. Launch 15-20 new combo offerings
3. 300% inventory increase for top 10 products
4. Real-time inventory systems

---

##  Tools & Technologies

<div align="center">

| Tool | Purpose |
|:----:|:-------:|
| ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white) | Database & Query Analysis |
| ![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black) | Data Visualization |
| ![Git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white) | Version Control |

</div>


---

##  Learning Outcomes

Through this project, I enhanced my skills in:

-  Complex SQL query writing with multiple JOINs
-  Data aggregation and grouping techniques
-  Business metrics calculation (ISU, IR, Revenue)
-  Data visualization and storytelling
-  Translating business questions into SQL queries
-  Drawing actionable insights from data




---

##  Acknowledgments

- **Codebasics** - For providing this amazing challenge opportunity
- **AtliQ Mart** - For the business case study

---

##  License

This project is part of the Codebasics Resume Project Challenge and is available for educational purposes.

---

<div align="center">

### ⭐ If you found this project helpful, please consider giving it a star!


![Visitors](https://visitor-badge.laobi.icu/badge?page_id=yourusername.retail-events-analytics)

</div>

















