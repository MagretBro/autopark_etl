INSERT INTO table_old (tecdocid, carid, ap2023, ap2024, type)
SELECT
    i.tecdocid,
    i.carid,
    i.ap2023,
    i.ap2024,
    i.type
FROM import_aggregated i
LEFT JOIN table_old t ON t.tecdocid = i.tecdocid AND t.type = i.type
WHERE i.tecdocid IS NOT NULL AND t.tecdocid IS NULL;
