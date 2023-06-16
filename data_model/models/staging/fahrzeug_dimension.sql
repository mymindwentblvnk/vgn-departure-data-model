{{ config(
    materialized="table",
    schema="staging"
) }}

SELECT
    a.Fahrzeugnummer as fahrzeugnummer,
    a.Produkt as fahrzeug_typ
FROM `me-playground.raw.ext_vgn_departures`, UNNEST(Abfahrten) as a
GROUP BY 1, 2
LIMIT 2