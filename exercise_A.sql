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

-- 8
delete from 口座

-- 9
select *
from 口座
where 口座番号 = '0037651'

-- 10
select *
from 口座
where 残高 > 0

-- 11
select *
from 口座
where 口座番号 < '1000000'

-- 12
select *
from 口座
where 更新日 < '2018-01-01'

-- 13
select *
from 口座
where 残高 > '1000000'

-- 14
select *
from 口座
where 種別 <> '普通'

-- 15
select *
from 口座
where 更新日 is null

-- 16
select *
from 口座
where 名義 like '%ハシ%'

-- 17
select *
from 口座
where 更新日 > '2017-12-31' 
and 更新日 < '2018-02-01'

-- 18
select *
from 口座
where 種別 = '2'
or 種別 = '3'

-- 19
select *
from 口座
where 名義 = 'ハマダ　サトシ'
or 名義 = 'マツモト　ミワコ'
or 名義 = 'サカタ　リョウヘイ'

-- 20
select *
from 口座
where 更新日 > '2017-12-30'
and 更新日 < '2018-01-04'

-- 21
select *
from 口座
where 残高 < '10000'
and 更新日 is not null


-- 22
select *
from 口座
where 口座番号 like '2______'
and 名義 like 'エ__　%コ'

-- 24


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