{{ config(
    materialized="table",
    schema="staging"
) }}

SELECT
    Haltestellenname AS haltestellenname,
    a.Latitude AS latitude,
    a.Longitude AS longitude
FROM `me-playground.raw.ext_vgn_departures`, UNNEST(Abfahrten) AS a
GROUP BY 1, 2, 3
LIMIT 2