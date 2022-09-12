DROP TABLE IF EXISTS housekeepingdata;
CREATE TABLE `housekeepingdata` (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    item VARCHAR(50),
    memo TEXT,
    income INT NOT NULL DEFAULT '0',
    expense INT NOT NULL DEFAULT '0',
    date_data TIMESTAMP NOT NULL
);