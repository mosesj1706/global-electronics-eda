# src/

This folder contains **modular Python scripts** used in the Global Electronics EDA project.

## Structure (planned modules)
- `data_loading.py` → Functions to load raw CSVs into pandas DataFrames.
- `cleaning.py` → Data cleaning functions (handling nulls, fixing datatypes).
- `enrichment.py` → Merging datasets, currency normalization, feature engineering.
- `analysis.py` → Core analysis logic (customer, product, sales, store).
- `viz.py` → Visualization functions (matplotlib/seaborn plots).
- `sql_queries.py` → SQL query execution and reusable functions.

These scripts make the project **maintainable, portable, and reusable**.
