-- 55
select 商品コード,商品名,単価, 
       (select sum(数量)
        from 注文
        where 商品コード = 'S0604'
       ) as 販売数量
from 商品
where 商品コード = 'S0604'

-- 56
update 注文
set 商品コード = (select 商品コード
                  from 商品
                  where 商品区分 = '2'
                  AND 商品名 LIKE '%ブーツ%' 
                  AND 商品名 LIKE '%雨%'
                  AND 商品名 LIKE '%安心%' 
                 )
where 注文日 = '2018-03-15' 
AND 注文番号 = '201803150014' 
AND 注文枝番 = 1

-- 57
SELECT 注文日 , 商品コード 
FROM 注文
WHERE 商品コード 
IN (SELECT 商品コード 
    FROM 商品 
    WHERE 商品名 LIKE '%あったか%') 
ORDER BY 注文日

-- 58
SELECT 商品コード , SUM( 数量 ) AS 数量 
FROM 注文 
GROUP BY 商品コード 
HAVING SUM( 数量 ) >ALL(SELECT AVG( 数量 ) 
                        FROM 注文 
                        GROUP BY 商品コード )