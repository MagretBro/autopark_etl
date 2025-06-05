DROP TABLE IF EXISTS import_prepare;

CREATE TABLE import_prepare AS
SELECT
    TRIM(SPLIT_PART(tecdocid, ',', 1)) AS tecdocid,
    carid,
    ap2023,
    ap2024,
    type
FROM import_raw
WHERE tecdocid IS NOT NULL AND POSITION(',' IN tecdocid) = 0

UNION ALL

-- Первая часть "2,3" с суммами
SELECT
    TRIM(SPLIT_PART(tecdocid, ',', 1)) AS tecdocid,
    carid,
    ap2023,
    ap2024,
    type
FROM import_raw
WHERE POSITION(',' IN tecdocid) > 0

UNION ALL

-- Вторая часть "2,3" с нулями
SELECT
    TRIM(SPLIT_PART(tecdocid, ',', 2)) AS tecdocid,
    carid,
    0,
    0,
    type
FROM import_raw
WHERE POSITION(',' IN tecdocid) > 0

UNION ALL

-- Строки без tecdocid
SELECT
    NULL AS tecdocid,
    carid,
    ap2023,
    ap2024,
    type
FROM import_raw
WHERE tecdocid IS NULL;





-- CREATE TEMP TABLE import_prepare AS
-- SELECT
--     TRIM(SPLIT_PART(tecdocid, ',', 1)) AS tecdocid,
--     carid,
--     ap2023,
--     ap2024,
--     type
-- FROM import_raw
-- WHERE tecdocid IS NOT NULL AND POSITION(',' IN tecdocid) = 0

-- UNION ALL

-- SELECT
--     TRIM(SPLIT_PART(tecdocid, ',', 1)) AS tecdocid,
--     carid,
--     ap2023,
--     ap2024,
--     type
-- FROM import_raw
-- WHERE POSITION(',' IN tecdocid) > 0

-- UNION ALL

-- SELECT
--     TRIM(SPLIT_PART(tecdocid, ',', 2)) AS tecdocid,
--     carid,
--     0,
--     0,
--     type
-- FROM import_raw
-- WHERE POSITION(',' IN tecdocid) > 0

-- UNION ALL

-- SELECT
--     NULL AS tecdocid,
--     carid,
--     ap2023,
--     ap2024,
--     type
-- FROM import_raw
-- WHERE tecdocid IS NULL;
