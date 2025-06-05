TRUNCATE import_raw;

INSERT INTO import_raw (tecdocid, carid, ap2023, ap2024, type) VALUES
('1', NULL, 10, 9, 'PC'),
('2,3', '1', 100, 89, 'HCV'),
(NULL, '2', 1, 0, 'PC'),
(NULL, '3', 22, NULL, 'PC'),
('14', '1', 444, 345, 'HCV'),
('2', '2', 40, 11, 'HCV');
