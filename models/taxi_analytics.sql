-- Create transformed taxi dataset
{{ config(materialized='table') }}
SELECT

    -- Vendor information
    VendorID,

    -- Pickup and dropoff times
    tpep_pickup_datetime,
    tpep_dropoff_datetime,

    -- Extract trip date
    DATE(tpep_pickup_datetime) AS trip_date,

    -- Extract pickup hour
    EXTRACT(HOUR FROM tpep_pickup_datetime) AS pickup_hour,

    -- Calculate trip duration in minutes
    TIMESTAMP_DIFF(
        tpep_dropoff_datetime,
        tpep_pickup_datetime,
        MINUTE
    ) AS trip_duration_minutes,

    -- Passenger information
    passenger_count,

    -- Distance
    trip_distance,

    -- Fare details
    fare_amount,
    tip_amount,
    total_amount

FROM {{ ref('stg_taxi_trips') }}