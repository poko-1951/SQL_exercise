-- list7-2
-- SELECT item, expense
-- FROM housekeepingdata
-- WHERE expense = (
--   SELECT MAX(expense)
--   FROM housekeepingdata
-- )

-- 以下は実行できない
-- list7-3
UPDATE housekeepingdata
SET 平均 = (SELECT AVG(expense)
            FROM housekeepingdata
            WHERE expense > 0
            AND item = "食費")
WHERE item = "expense"

-- list7-4
SELECT 日付, メモ, 出金額,
       (SELECT 合計 FROM 家計簿集計
         WHERE 費目 = '食費') AS 過去の合計額
FROM 家計簿アーカイブ
WHERE 費目 = '食費'

-- list7-5
SELECT * FROM 家計簿集計
 WHERE 費目 IN ('食費', '水道光熱費', '教養娯楽費', '給料')

--  list7-7
SELECT * FROM 家計簿
 WHERE 費目 = '食費'
   AND 出金額 < ANY (SELECT 出金額 FROM 家計簿アーカイブ
                     WHERE 費目 = '食費')

-- list7-11
SELECT SUM(SUB.出金額) AS 出金額合計
  FROM (SELECT 日付, 費目, 出金額
          FROM 家計簿
        UNION
        SELECT 日付, 費目, 出金額
          FROM 家計簿アーカイブ
         WHERE 日付 >= '2018-01-01'
           AND 日付 <= '2018-01-31') AS SUB

-- list7-12
INSERT INTO 家計簿集計(費目, 合計, 平均, 回数)
SELECT 費目, SUM(出金額), AVG(出金額), 0
  FROM 家計簿
 WHERE 出金額 > 0
 GROUP BY 費目