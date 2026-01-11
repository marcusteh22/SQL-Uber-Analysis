# SQL-Uber-Analysis
## Overview

SQL analysis of Uber ride bookings: performing data cleaning, transformation, and extracting business insights based on 100K+ ride bookings. Analyzing its completion rates, cancellations, and operational efficiency et cetera. 

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
* Specifies data types, constraints, and keys
* Establishes the foundation for loading raw data

### `03_data_loading.sql`

* Loads CSV data into database tables
* Handles column mapping and formatting
* Acts as the bridge between raw files and structured storage

### `04_data_cleaning.sql`

* Handles missing and null values
* Removes duplicates
* Standardizes formats (dates, text, numeric fields)
* Ensures data consistency and reliability

### `05_data_analysis.sql`

* Performs analytical queries and aggregations
* Extracts insights from cleaned data
* Demonstrates joins, filtering, grouping, and analytical logic

---

## Data Source

The dataset used in this project is publicly available on Kaggle:

**Uber Ride Analytics Dataset**
[https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard](https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard)

File used:

```text
ncr_ride_bookings.csv
```

The dataset is **not included** in this repository to avoid licensing and size constraints.

---

## Setting Up the Data Folder

After cloning the repository:

1. Create a `data` folder in the project root:

   ```bash
   mkdir data
   ```

2. Download the dataset from Kaggle.

3. Place the CSV file inside the `data/` folder and rename it:

   ```text
   data/uber_ride_bookings.csv
   ```

---

## Updating the File Path in SQL

Before running the data loading script, update the file path inside
`03_data_loading.sql` to match your local environment.

Example (PostgreSQL):

```sql
COPY uber_ride_bookings
FROM '/absolute/path/to/uber-sql-analysis/data/uber_ride_bookings.csv'
DELIMITER ','
CSV HEADER;
```

Make sure:

* The path is absolute
* Your database user has file access permissions
* The file name matches exactly

---

## How to Run the Project

Execute the SQL scripts **in the following order**:

```text
01_database_setup.sql
02_table_creation.sql
03_data_loading.sql
04_data_cleaning.sql
05_data_analysis.sql
```

Running scripts out of sequence may result in missing tables or dependency errors.

---

## Key Concepts Demonstrated

* Database initialization and schema design
* Structured table creation
* CSV ingestion using SQL
* Data cleaning and validation logic
* Analytical SQL querying
* Reproducible SQL workflows

---

## Use Cases

This project is suitable for:

* SQL portfolio demonstrations
* Data analyst interview preparation
* Practicing real-world data cleaning
* Understanding structured SQL pipelines
* Showcasing analytical thinking with SQL

---

## Possible Enhancements

* Add indexes for performance optimization
* Create views for reusable analysis
* Extend analytical queries for dashboard integration
* Parameterize file paths for portability
* Add documentation for each business question answered

---

## Notes for Reviewers

* The SQL files are modular and sequential by design
* Each script builds logically on the previous step
* Queries prioritize readability and clarity
* The project is designed to reflect real workplace workflows

---

## License

This project is intended for educational and portfolio purposes.
The dataset belongs to its original author and is distributed via Kaggle.

---


