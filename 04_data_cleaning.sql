USE uber_analysis;

-- CONVERTING 0 INTO NULL (missing data, not actual value)
-- When creating table, the cols have been set to datatype 'DECIMAL',
-- anything that wasn't numeric like 'null' have been set to 0
UPDATE rides_raw
SET driver_rating = NULL
WHERE driver_rating = 0.00;

UPDATE rides_raw
SET customer_rating = NULL
WHERE customer_rating = 0.00;

-- Fix VTAT
UPDATE rides_raw
SET avg_vtat = NULL
WHERE avg_vtat = 0.00;

-- Fix CTAT
UPDATE rides_raw
SET avg_ctat = NULL
WHERE avg_ctat = 0.00;

-- Fix ride distance
UPDATE rides_raw
SET ride_distance = NULL
WHERE ride_distance = 0.00;

-- Fix booking value
UPDATE rides_raw
SET booking_value = NULL
WHERE booking_value = 0.00;


DROP TABLE IF EXISTS rides_cleaned;

CREATE TABLE rides_cleaned AS
SELECT
    -- CORE IDENTIFIERS & TIMESTAMPS
    booking_date,
    booking_time,
    booking_id,
    customer_id,
    vehicle_type,
    pickup_location,
    drop_location,

    -- DERIVED FIELD: TO ANALYSE BUSIEST HOURS LATER
    -- 24 hour format
    HOUR(booking_time) AS booking_hour,

    -- CLEANED NUMERIC FIELDS
    avg_vtat,
    avg_ctat,
    booking_value,
    ride_distance,
    driver_rating,
    customer_rating,

    -- PAYMENT
    payment_method,

    -- NORMALISE FLAGS (ensure 0/1)
    CASE WHEN cancelled_by_customer = 1 THEN 1 ELSE 0 END AS cancelled_by_customer,
    CASE WHEN cancelled_by_driver = 1 THEN 1 ELSE 0 END AS cancelled_by_driver,
    CASE WHEN incomplete_rides = 1 THEN 1 ELSE 0 END AS incomplete_rides,

    -- DERIVED FIELD: consolidate ride_outcome
    CASE
        WHEN booking_status = 'Completed' THEN 'Completed'
        WHEN cancelled_by_customer = 1 THEN  'Customer Cancelled'
        WHEN cancelled_by_driver = 1 THEN 'Driver Cancelled'
        WHEN incomplete_rides = 1 THEN 'Incomplete'
        ELSE 'Incomplete'
    END AS ride_outcome,

    -- DERIVED FIELD: consolidate ride_outcome_reason
    CASE
        WHEN cancelled_by_customer = 1 THEN NULLIF(customer_cancel_reason, 'null')
        WHEN cancelled_by_driver = 1 THEN NULLIF(driver_cancel_reason, 'null')
        WHEN incomplete_rides = 1 THEN NULLIF(incomplete_reason, 'null')
        ELSE NULL
    END AS ride_outcome_reason

FROM rides_raw;

-- VALIDATE
SELECT * 
FROM rides_cleaned
LIMIT 10;