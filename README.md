# DSA-2040_Practical_Exam_Vivian386


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

(For inventory tracking you could add an inventory_fact or extend dim_product with reorder_level / current_stock, but the above meets the task requirements.)

### Why star schema 
Star schema denormalizes attributes into wide dimension tables for fast, simple joins against a single fact table — ideal for typical OLAP queries (aggregations, rollups, slicing). It reduces join complexity and improves query performance for reporting and BI (at the acceptable cost of some redundancy), so it’s preferred over snowflake for read-heavy analytics workloads.