-- 53
SELECT 名称 AS なまえ, 
HP AS 現在のHP, 
ROUND(CAST(HP AS NUMERIC) / (
SELECT SUM(HP) FROM パーティー ) * 100, 1) AS パーティーでの割合 
FROM パーティー
WHERE 職業コード = '01'

-- 54
UPDATE パーティー 
SET MP = MP + (SELECT ROUND(SUM(MP * 0.1)) 
                FROM パーティー
                WHERE 職業コード <> '20') 
WHERE 職業コード = '20'

-- 