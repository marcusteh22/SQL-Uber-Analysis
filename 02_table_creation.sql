USE uber_analysis;

DROP TABLE IF EXISTS rides_raw;

-- Create table schema to load data into table
CREATE TABLE rides_raw(
    booking_date DATE,
    booking_time TIME,
    booking_id VARCHAR(50),
    booking_status VARCHAR(50),
    customer_id VARCHAR(50),
    vehicle_type VARCHAR(50),
    pickup_location VARCHAR(100),
    drop_location VARCHAR(100),
    avg_vtat DECIMAL(5,2),
    avg_ctat DECIMAL(5,2),
    cancelled_by_customer TINYINT,
    customer_cancel_reason VARCHAR(255),
    cancelled_by_driver TINYINT,
    driver_cancel_reason VARCHAR(255),
    incomplete_rides TINYINT,
    incomplete_reason VARCHAR(255),
    booking_value DECIMAL(10,2),
    ride_distance DECIMAL(6,2),
    driver_rating DECIMAL(3,2),
    customer_rating DECIMAL(3,2),
    payment_method VARCHAR(50)
);

-- validate if table created, data type correct
SHOW TABLES;
DESCRIBE rides_raw;


