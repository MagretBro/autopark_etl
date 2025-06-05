DROP TABLE IF EXISTS table_old;
DROP TABLE IF EXISTS import_raw;

CREATE TABLE table_old (
    id INT,
    tecdocid TEXT, 
    carid TEXT,   
    ap2021 INT,
    ap2022 INT,
    type VARCHAR(10),
    ap2023 INT,
    ap2024 INT
);

INSERT INTO table_old (id, tecdocid, carid, ap2021, ap2022, ap2023, ap2024, type) VALUES
(1, '1', '1', 20, 15, NULL, NULL, 'HCV'),
(2, '2', '1', 200, NULL, NULL, NULL, 'HCV'),
(3, '3', '1', NULL, 150, NULL, NULL, 'HCV'),
(4, '14', '1', 555, 445, NULL, NULL, 'HCV'),
(5, '5', NULL, 11, 10, NULL, NULL, 'PC'),
(6, '6', '2, 3', 55, 33, NULL, NULL, 'PC');

CREATE TABLE import_raw (
    tecdocid TEXT,
    carid TEXT,
    ap2023 INT,
    ap2024 INT,
    type VARCHAR(10)
);




-- CREATE TABLE table_old (
--     id INT,
--     tecdocid TEXT, 
--     carid TEXT,   
--     ap2021 INT,
--     ap2022 INT,
--     type VARCHAR(10)
-- );

-- INSERT INTO table_old (id, tecdocid, carid, ap2021, ap2022, type) VALUES
-- (1, '1', '1', 20, 15, 'HCV'),
-- (2, '2', '1', 200, NULL, 'HCV'),
-- (3, '3', '1', NULL, 150, 'HCV'),
-- (4, '14', '1', 555, 445, 'HCV'),
-- (5, '5', NULL, 11, 10, 'PC'),
-- (6, '6', '2, 3', 55, 33, 'PC');

-- CREATE TABLE import_raw (
--     tecdocid TEXT,
--     carid TEXT,
--     ap2023 INT,
--     ap2024 INT,
--     type VARCHAR(10)
-- );

-- INSERT INTO import_raw (tecdocid, carid, ap2023, ap2024, type) VALUES
-- ('1', NULL, 10, 9, 'PC'),
-- ('2,3', '1', 100, 89, 'HCV'),
-- (NULL, '2', 1, 0, 'PC'),
-- (NULL, '3', 22, NULL, 'PC'),
-- ('14', '1', 444, 345, 'HCV'),
-- ('2', '2', 40, 11, 'HCV');
