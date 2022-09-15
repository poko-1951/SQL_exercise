-- list5-1
-- SELECT expense,
--        expense + 100
-- FROM housekeepingdata

-- list5-2
-- SELECT expense,
--        expense + 100 AS 100円増し
-- FROM housekeepingdata

-- list5-5
-- SELECT item, expense,
--        CASE item WHEN "居住費" THEN "固定費"
--                  WHEN "水道光熱費" THEN "固定費"
--                  ELSE "変動費"
--        END AS 出費の分類
-- FROM housekeepingdata WHERE expense > 0

-- list5-6
-- SELECT item, income,
--        CASE WHEN income < 5000 THEN "お小遣い"
--             WHEN income < 10000 THEN "一時収入"
--             WHEN income < 30000 THEN "給料出た！"
--             ELSE "想定外の収入"
--        END AS 収入の分類
-- FROM housekeepingdata
-- WHERE income > 0

-- list5-7
SELECT memo,
LENGTH (memo) as メモの長さ
FROM housekeepingdata