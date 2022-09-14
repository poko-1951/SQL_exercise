-- list3-3
-- SELECT *
-- FROM housekeepingdata
-- WHERE memo
-- LIKE "%1月%"

-- -- list3-3
-- SELECT *
-- FROM housekeepingdata
-- WHERE memo
-- LIKE "1月___"

-- list3-4
-- SELECT *
-- FROM housekeepingdata
-- WHERE expense
-- BETWEEN 100 AND 3000

-- list3-5
SELECT *
FROM housekeepingdata
WHERE item
IN ("食費", "交際費");