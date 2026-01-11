# SQL-Uber-Analysis
## Overview

SQL analysis of Uber ride bookings: performing data cleaning, transformation, and extracting business insights based on 100K+ ride bookings. Analyzing its completion rates, peak hours, cancellations, and operational efficiency et cetera. 

---

## Project Structure

```text
uber-sql-analysis/
├── data/
│   └── uber_ride_bookings.csv   (not included in repo)
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_table_creation.sql
│   ├── 03_data_loading.sql
│   ├── 04_data_cleaning.sql
│   └── 05_data_analysis.sql
└── README.md
```

---

## File Descriptions

### `01_database_setup.sql`

* Creates the database
* Sets up schemas and initial configuration
* Prepares the environment for table creation

### `02_table_creation.sql`

* Defines table structures
* Specifies data types
* Establishes the foundation for loading raw data

### `03_data_loading.sql`

* Loads CSV data into database tables
* Handles column mapping and formatting
* Acts as the bridge between raw files and structured storage

### `04_data_cleaning.sql`

* Handles missing and null values
* Standardizes formats
* Generates derived fields for analysis

### `05_data_analysis.sql`

* Performs analytical queries
* Extracts insights from cleaned data

---

## Data Source

The dataset used in this project is publicly available on Kaggle:

**Uber Ride Analytics Dataset**
[https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard](https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard)


The dataset is **not included** in this repository.


---


## License

This project is intended for educational and portfolio purposes.
The dataset belongs to its original author and is distributed via Kaggle.

---


