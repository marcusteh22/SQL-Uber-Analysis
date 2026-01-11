-- DATA ANALYSES:

USE uber_analysis;
-- 1. FUNNEL & REALIBILITY ANALYSIS
-- % of each ride outcome 
SELECT 
    ride_outcome,
    COUNT(*) AS total_rides,
    ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER(), 2) AS pct
FROM rides_cleaned
GROUP BY ride_outcome
ORDER BY total_rides DESC;

-- completion rate by hour
SELECT 
    booking_hour,
    ROUND(SUM(ride_outcome='Completed') / COUNT(*) * 100, 2) AS completion_rate_pct_hr
FROM rides_cleaned
GROUP BY booking_hour
ORDER BY booking_hour;

-- completion rate by vehicle type
SELECT vehicle_type,
    ROUND(SUM(ride_outcome = 'Completed') / COUNT(*) * 100) AS  completion_rate_pct_veh
FROM rides_cleaned
GROUP BY vehicle_type
ORDER BY vehicle_type DESC;

-- completion rate of top 20 pickup locations
WITH top_20_locations AS(  -- (A) CTE: create a temporary result set for top 20 pickup locations
    SELECT 
        pickup_location,
        COUNT(*) AS total_rides_per_loc
    FROM rides_cleaned
    GROUP BY pickup_location
    ORDER BY total_rides_per_loc DESC
    LIMIT 20
)
SELECT  -- (B) Main query, uses CTE
    r.pickup_location,
    t.total_rides_per_loc,
    ROUND(SUM(r.ride_outcome='Completed') / COUNT(*) * 100) AS completion_rate_pct_loc
FROM rides_cleaned AS r  -- (C) Base table w/ alias
JOIN top_20_locations as t  -- (D) Join the CTE 
    ON r.pickup_location = t.pickup_location
GROUP BY r.pickup_location  -- (E) AGGREGATE & OUTPUT
ORDER BY t.total_rides_per_loc DESC;


-- 2. CANCELLATION & INCOMPLETE DIAGNOSIS
--  reasons for cancellation & incomplete rides
SELECT 
    ride_outcome_reason,
    COUNT(*) AS outcome_occurences
FROM rides_cleaned
WHERE ride_outcome IN ('Customer Cancelled', 'Driver Cancelled', 'Incomplete')
GROUP BY ride_outcome_reason
ORDER BY outcome_occurences DESC;


-- 3. TIME-BASED ANALYSIS
-- average CTAT/VTAT by hour
SELECT 
    booking_hour,
    ROUND(AVG(avg_ctat)) AS avg_ctat_by_hour,
    ROUND(AVG(avg_vtat)) AS avg_vtat_by_hour
FROM rides_cleaned
GROUP BY booking_hour
ORDER BY booking_hour;

-- the completion rate of peak hours & reasons for incomplete & cancelled rides
WITH top_10_peak_hours AS(  -- create cte (find top 10 peak hours)
    SELECT booking_hour,
    COUNT(*) AS num_of_bookings
    FROM rides_cleaned
    GROUP BY booking_hour
    ORDER BY num_of_bookings DESC
    LIMIT 10
    )
SELECT  -- main query
    r.booking_hour,
    t.num_of_bookings,
    ROUND(SUM(ride_outcome = 'Completed') / COUNT(*) * 100, 2) AS completion_rate_peak_hours,
    SUM(r.ride_outcome='Customer Cancelled') AS customer_cancelled_num,
    SUM(r.ride_outcome='Driver Cancelled') AS driver_cancelled_num,
    SUM(r.ride_outcome='Incomplete') AS incomplete_num
FROM rides_cleaned AS r
JOIN top_10_peak_hours AS t
    ON r.booking_hour = t.booking_hour
GROUP BY r.booking_hour
ORDER BY t.num_of_bookings DESC;


-- 4. CTAT/VTAT
-- CTAT/VTAT by outcome
SELECT ride_outcome,
    ROUND(AVG(avg_ctat), 1) AS avg_ctat_by_outcome,
    ROUND(AVG(avg_vtat),1) AS avg_vtat_by_outcome
FROM rides_cleaned
GROUP BY ride_outcome;


-- 5. payment method behavior
-- payment methods
SELECT payment_method,
    COUNT(*) as payment_method_count
FROM rides_cleaned
GROUP BY payment_method
ORDER BY payment_method_count DESC;

