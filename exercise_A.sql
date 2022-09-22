-- 1
select *
from 口座

-- 2
select 口座番号
from 口座

-- 3
select 口座番号, 残高
from 口座

-- 4
select *
from 口座

-- 5
UPDATE 口座
SET 名義='XXXXX'

-- 6
UPDATE 口座
SET 残高=999999999,更新日 ='2018-03-01'

-- 59
update 口座
set 残高 = 残高 + 
            (select coalesce(sum(入金額),0) - coalesce(sum(出金額),0) -- その日に入金したり、出金したりしているため
             from 取引
             where 口座番号 = '0351333' and 日付='2018-01-11'
            ),
    更新日 = '2018-01-11'
where 口座番号 = '0351333'

-- 60
select 残高,
       (select sum(入金額)
        from 取引
        where 口座番号='1115600' and 日付='2017-12-28'
       ) as 入金合計額,
       (select sum(出金額)
        from 取引
        where 口座番号='1115600' and 日付='2017-12-28'
       ) as 出金合計額
from 口座
where 口座番号='1115600'

-- 61
select 口座番号,名義,残高
from 口座
where 口座番号
in (select 口座番号
    from 取引
    where 入金額 > 1000000
   )

-- 62
SELECT * 
FROM 口座 
WHERE 更新日 >ALL (SELECT 日付 FROM 取引 )

-- 63
select A.日付,
      (SELECT MAX( 入金額 ) 
       FROM 取引 
       WHERE 口座番号 = '3104451') AS 最大入金額 , 
       (SELECT MAX( 出金額 ) 
        FROM 取引 
        WHERE 口座番号 = '3104451') AS 最大出金額
from (SELECT 日付 
      FROM 取引 
      WHERE 口座番号 = '3104451' 
      GROUP BY 日付 
      HAVING SUM( 入金額 ) > 0 AND SUM( 出金額 ) > 0) AS A

-- 64
insert into 廃止口座
select *
from 口座
where 口座番号 = '2761055';

delete from 口座
where 口座番号 = '2761055';