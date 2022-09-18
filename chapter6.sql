-- list6-1
-- SELECT SUM(expense) AS 出金額の合計
-- FROM housekeepingdata

-- list6-2
-- SELECT
--   SUM(expense) AS 合計出金額,
--   AVG(expense) AS 平均出金額,
--   MAX(expense) AS 最大値,
--   MIN(expense) AS 最小値
-- FROM housekeepingdata

-- list6-3
-- SELECT COUNT(*) AS 食費の行数
-- FROM housekeepingdata
-- WHERE item = "食費"

-- list6-7
-- SELECT item,
--        SUM(expense) AS item別の出金額合計
-- FROM housekeepingdata
-- GROUP BY item

-- list6-9
SELECT item,
       SUM(expense) AS item別の出金額合計
FROM housekeepingdata
GROUP BY item
HAVING SUM(expense) > 0