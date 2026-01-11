-- load csv data into raw table
USE uber_analysis;

-- note:
-- update file path below to match location of
-- uber_ride_bookings.csv on your local machine.

LOAD DATA LOCAL INFILE '/Users/marcus/Desktop/uber-sql-analysis/data/uber_ride_bookings.csv'
INTO TABLE rides_raw
FIELDS TERMINATED BY ','
ENCLOSED BY ""
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- check if loaded 
SELECT COUNT(*) AS total_rows 
FROM rides_raw;

SELECT * FROM rides_raw LIMIT 5;
