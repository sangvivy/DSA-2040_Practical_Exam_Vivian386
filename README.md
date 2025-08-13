# DSA-2040_Practical_Exam_Vivian386

# Project Overview

This project demonstrates practical skills in Data Warehousing and Data Mining using Python, SQLite, and popular data science libraries. It covers:

- Designing a retail data warehouse with star schema

- Generating synthetic retail sales data

- Implementing an ETL pipeline to transform and load data into SQLite

- Writing OLAP queries and performing analysis

- Performing data preprocessing, clustering, classification, and association rule mining on the Iris dataset and synthetic basket data

The project emphasizes modular, well-commented code, clear documentation, and insightful analysis.


## Table of Contents

1. Setup and Requirements

2. Data Warehousing

    - Star Schema Design

    - ETL Process

    - OLAP Queries & Analysis

3. Data Mining

    - Preprocessing and Exploration

    - Clustering

    - Classification

    - Association Rule Mining

4. How to Run

5. Outputs & Visualizations

6. Self-Assessment

7. Acknowledgments & References


## Setup and Requirements

- Python 3.x

- Libraries: pandas, numpy, scikit-learn, matplotlib, seaborn, sqlite3, mlxtend, faker

- SQLite or any SQL client to query the data warehouse

- Optional: Jupyter Notebook or any IDE for running .py scripts

Install required libraries with:

```
pip install pandas numpy scikit-learn matplotlib seaborn mlxtend faker

```
# DATA WAREHOUSING

## 1. Data Warehouse Design

## Star schema design (summary)


### Fact table

- sales_fact — grain: one row per sales transaction line (i.e., one product on one receipt)

- Measures: quantity_sold, sales_amount, unit_price, discount, cost_amount

- FKs: time_id, product_id, customer_id, store_id

### Dimension tables

- dim_time — date/time attributes (date, day, month, quarter, year, weekday, is_weekend)

- dim_product — product attributes (product_id, product_name, category, sub_category, brand, unit)

- dim_customer — customer attributes (customer_id, first_name, last_name, gender, birth_date, age_group, region, city)

- dim_store — store/location attributes (store_id, store_name, region, city, store_type)



#### This supports queries like:

- Total sales by product category per quarter (dim_product + dim_time + sales_fact)

- Customer demographics analysis (dim_customer + sales_fact)

- Inventory / sales trends by store or region (dim_store + sales_fact + dim_time)


### Why star schema 
Star schema denormalizes attributes into wide dimension tables for fast, simple joins against a single fact table — ideal for typical OLAP queries (aggregations, rollups, slicing). It reduces join complexity and improves query performance for reporting and BI (at the acceptable cost of some redundancy), so it’s preferred over snowflake for read-heavy analytics workloads.



## 2. ETL Process

- Synthetic data (~1000 rows) generated using Python’s faker and numpy libraries, simulating invoices over 2 years, with 100 customers, 20 products, and 8 countries.

- ETL steps implemented:

    - Extract: Generate/read data into pandas DataFrame

    - Transform: Calculate TotalSales, filter last year’s sales, remove outliers

    - Load: Store transformed data into SQLite tables (FactSales, DimCustomer, DimTime)

- ETL logs rows processed at each step.

## 3. OLAP Queries & Analysis

- Roll-up: Total sales by country and quarter

- Drill-down: Monthly sales for a selected country

- Slice: Sales for Electronics category

- Results visualized using matplotlib bar charts.

- Analysis discusses trends, top countries, and data warehouse utility.

# DATA MINING

## 1. Preprocessing & Exploration

- Loaded Iris dataset from scikit-learn.

- Handled missing values (none in this dataset).

- Normalized features using Min-Max scaling.

- Encoded class labels using one-hot encoding.

- Exploratory analysis:

    - Summary statistics with pandas.describe()

    - Pairplot and correlation heatmap with seaborn   

    - Outlier detection using boxplots

    

## 2. Clustering

- Applied K-Means clustering with k=3 (matching Iris species).

- Evaluated with Adjusted Rand Index (ARI).

- Experimented with k=2 and k=4; plotted elbow curve for optimal k.

- Visualized clusters (petal length vs petal width).

- Discussed cluster quality and real-world applicability.

## 3. Classification

- Trained Decision Tree and KNN (k=5) classifiers.

- Compared performance using accuracy, precision, recall, and F1-score.

- Visualized decision tree using sklearn’s plot_tree.

- Analysis explained why one model performed better.

## 4. Association Rule Mining

- Generated synthetic transactional basket data with frequent co-occurrences.

- Applied Apriori algorithm (mlxtend) with min_support=0.2, min_confidence=0.5.

- Extracted top 5 rules by lift.

- Analyzed rule implications for retail recommendations.


## How to Run

1. Clone the repo

2. Run the ETL pipeline:

```
python etl_retail.py
```
3. Query SQLite database or run OLAP queries script.

4. Run data mining scripts:

    - Preprocessing: python preprocessing_iris.py

    - Clustering: python clustering_iris.py

    - Classification & Association: python mining_iris_basket.py

5. Check output images and CSVs in the outputs/ folder.


## Outputs & Visualizations

- Star schema diagram: docs/star_schema.png

- ETL logs: Console output & etl_log.txt

- OLAP query charts: outputs/olap_sales_by_country.png

- Clustering elbow curve and clusters plot: outputs/elbow_curve.png, outputs/clusters_k3.png

- Classification tree plot: outputs/decision_tree.png

- Apriori rule output: outputs/apriori_rules.csv

- All CSV results and logs are in outputs/

## Self-Assessment

- Completed all data warehousing tasks: star schema design, ETL, OLAP queries with visualizations.

- Completed data mining tasks: preprocessing, clustering, classification, association rule mining with analyses.

- Code is modular, well-commented, and reproducible.

- Used synthetic data where applicable, noting limitations in realism.

- Further improvements possible in dataset size and complexity.

## Acknowledgments & References

Scikit-learn documentation: https://scikit-learn.org

Pandas documentation: https://pandas.pydata.org

SQLite official site: https://sqlite.org

MLxtend documentation: http://rasbt.github.io/mlxtend/

Faker library: https://faker.readthedocs.io


