DROP TABLE IF EXISTS import_aggregated;

CREATE TABLE import_aggregated AS
SELECT
    tecdocid,
    STRING_AGG(DISTINCT carid, ',' ORDER BY carid) AS carid,
    SUM(COALESCE(ap2023, 0)) AS ap2023,
    SUM(COALESCE(ap2024, 0)) AS ap2024,
    type
FROM import_prepare
GROUP BY tecdocid, type;
