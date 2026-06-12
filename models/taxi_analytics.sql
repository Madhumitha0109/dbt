SELECT

    VendorID,

    tpep_pickup_datetime,
    tpep_dropoff_datetime,

    DATE(tpep_pickup_datetime) AS trip_date,

    EXTRACT(HOUR FROM tpep_pickup_datetime) AS pickup_hour,

    TIMESTAMP_DIFF(
        tpep_dropoff_datetime,
        tpep_pickup_datetime,
        MINUTE
    ) AS trip_duration_minutes,

    passenger_count,

    trip_distance,

    fare_amount,
    tip_amount,
    total_amount,

    SAFE_DIVIDE(total_amount, trip_distance) AS fare_per_mile

FROM {{ ref('stg_taxi_trips') }}