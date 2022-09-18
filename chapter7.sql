-- list7-2
SELECT item, expense
FROM housekeepingdata
WHERE expense = (
  SELECT MAX(expense)
  FROM housekeepingdata
)