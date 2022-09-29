-- list8-1
UPDATE housekeepingdata
SET item = "給与手当"
WHERE item = "給料"

-- list8-2
UPDATE housekeepingdata
SET item_name = "給与手当"
WHERE item_name = "給料"

-- list8-3
UPDATE housekeepingdata
SET item = "雑収入", memo = "宝くじに当たった"
WHERE date_data = "2018-02-10"