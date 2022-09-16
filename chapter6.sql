-- list6-1
-- SELECT SUM(expense) AS 出金額の合計
-- FROM housekeepingdata

-- list6-2
SELECT
  SUM(expense) AS 合計出金額,
  AVG(expense) AS 平均出金額,
  MAX(expense) AS 最大値,
  MIN(expense) AS 最小値
FROM housekeepingdata