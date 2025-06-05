INSERT INTO table_old (tecdocid, carid, ap2023, ap2024, type)
SELECT
    NULL,
    carid,
    ap2023,
    ap2024,
    type
FROM import_aggregated
WHERE tecdocid IS NULL;
