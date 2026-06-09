-- Read raw taxi trip data
SELECT

    -- Vendor information
    VendorID,

    -- Pickup and dropoff timestamps
    tpep_pickup_datetime,
    tpep_dropoff_datetime,

    -- Passenger information
    passenger_count,

    -- Trip metrics
    trip_distance,

    -- Location IDs
    PULocationID,
    DOLocationID,

    -- Payment details
    payment_type,
    fare_amount,
    tip_amount,
    total_amount

FROM {{ source('taxi_source', 'raw_taxi_trips') }}

-- Keep only valid trips
WHERE trip_distance > 0
  AND fare_amount > 0