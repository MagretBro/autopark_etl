-- ALTER TABLE table_old ADD COLUMN IF NOT EXISTS ap2023 INT;
-- ALTER TABLE table_old ADD COLUMN IF NOT EXISTS ap2024 INT;

UPDATE table_old t
SET
    ap2023 = COALESCE(t.ap2023, 0) + i.ap2023,
    ap2024 = COALESCE(t.ap2024, 0) + i.ap2024,
    carid = (
        SELECT STRING_AGG(DISTINCT val, ',' ORDER BY val)
        FROM unnest(string_to_array(COALESCE(t.carid, '') || ',' || COALESCE(i.carid, ''), ',')) val
        WHERE TRIM(val) <> ''
    )
FROM import_aggregated i
WHERE i.tecdocid IS NOT NULL
  AND t.tecdocid = i.tecdocid
  AND t.type = i.type;
