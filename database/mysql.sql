query to select records from yesterday
select * from table where date(create_at) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);

select distinct type from `MEMBER_DATA`;
select account, count(*) as total from `campain_202402_signin` where status=1 group by account order by total;//get all
select account, count(*) as total from `campain_202402_signin` where status=1 group by account HAVING COUNT(id) > 7 order by total;//get bigger than 7

select account, count(*) as total from `campain_202402_signin` where status=1 group by account HAVING COUNT(id) > 0 and COUNT(id) < 7 order by COUNT(id);
select account, count(*) as total from `campain_202402_signin` where status=1 group by account HAVING COUNT(id) > 2 and COUNT(id) < 7 order by COUNT(id);
select account, count(*) as total from `campain_202402_signin` where status=1 group by account HAVING COUNT(id)=4 or COUNT(id)=6 order by COUNT(id);

select account, count(*) as total from `campain_202402_signin` where status=1 group by account HAVING COUNT(id) > 7 order by total;

select account, count(*) as total from `campain_202402_signin` where status=1 group by account HAVING COUNT(id) >=5 and COUNT(id) < 7 order by COUNT(id);
select account, count(*) as total from `campain_202402_signin` where status=1 group by account HAVING COUNT(id) = 7 order by COUNT(id);

#CURDATE 2022-03-01
select count(*) as total from `campain_202402_signin` where status=1 and date('created_at') < CURDATE();

#後面指定的日期一定要加上時分秒，否則會指向 00:00:00
SELECT * from `MEMBER_DATA` WHERE `CREATEDATE` BETWEEN '2024-02-21' AND '2024-02-28 23:59:59' order by `CREATEDATE`;
SELECT * from `MEMBER_DATA` WHERE `CREATEDATE` >= '2024-02-21' AND `CREATEDATE` <= '2024-02-25 23:59:59' order by `CREATEDATE`;

select s.account, m.`CREATEDATE` as created_at from `campain_202402_signin` as s left join `MEMBER_DATA` as m on s.account=m.account
WHERE m.`CREATEDATE` BETWEEN '20240221' AND '20240306'  group by m.`ACCOUNT` order by m.`CREATEDATE`;

select c.account as account, PHONE as mobile, count(*) as total
from `campain_202402_signin` as c left join `MEMBER_DATA` as m on c.account=m.account
where c.status=1 group by c.account HAVING COUNT(id)=4 or COUNT(id)=6 order by total, account;

select c.account as account, count(*) as total
from `campain_202402_signin` as c left join `MEMBER_DATA` as m on c.account=m.account
where c.status=1 group by c.account order by total, account;

if you want to search for duplicate records
SELECT email, COUNT(*) FROM MEMBER_DATA GROUP BY email HAVING COUNT(*) > 1;

where vs having
Standard SQL doesn't allow you to refer to a column alias in a WHERE clause.
This restriction is imposed because when the WHERE code is executed, the column value may not yet be determined.

WHERE clause allows a condition to use any table column, but it cannot use aliases or aggregate functions. HAVING clause allows a condition to use a selected (!) column, alias or an aggregate function.

This is because WHERE clause filters data before select, but HAVING clause filters resulting data after select.

select platform, count(platform) platform_total, DATE(FROM_UNIXTIME(update)) as platform_date
from login
where update between 1678896000 and 1678982399
group by platform
order by platform_date;
between 1678896000 and 1678982399;

2023-03-16 00-23:59 --> 1678896000 and 1678982399

select os, count(os) as total, DATE(FROM_UNIXTIME(update)) as os_date from member_login group by os_date having os_date >= '2023-03-01';
select os, DATE(FROM_UNIXTIME(update)) as os_date from login where DATE(FROM_UNIXTIME(update)) >= '2023-03-01';

date
WHERE DATE(datetime) = '2009-10-20'
WHERE datetime LIKE '2009-10-20%'
SELECT DATE_ADD("2023-03-17", INTERVAL -6 DAY); //2023-03-11


docker
docker exec -it mysql mysql -uroot -p
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';


docker run --name mysql -p 3306:3306 -d mysql:5.7

run sql file while not connected to the server
mysql -uroot -p database_name < /path/to/file.sql

run sql file or script from the terminal
mysql> source /Users/nsebhastian/Desktop/test/main.sql
# or
mysql> \. /Users/nsebhastian/Desktop/test/main.sql


SELECT * from gl_system_api_test;
SHOW VARIABLES LIKE 'version';

FLUSH PRIVILEGES;
where column is not null;
where column is null;

常見註釋符的表達方式：# or -- or /* */

case when then end
sum(CASE when `click_link`=1 then 1 else 0 end) as click_count')


CREATE TABLE YourTable (
    id INT PRIMARY KEY,
    account VARCHAR(255) NOT NULL,
    created_at DATE NOT NULL,
    UNIQUE (account, created_at)
);
UNIQUE (account, created_at) 約束確保了每個 account 在每個日期只能有一條記錄。

SELECT DATEDIFF(expire_time, NOW()) AS days FROM yourTable;
SELECT * FROM yourTable WHERE DATEDIFF(expire_time, NOW()) > 365;

//query account only contain numeric
select * from `campaign_20240522_news_vote` where account REGEXP '^[0-9]+$';

//20240522 campaign new vote report
select account, news_id, date(modify_at) vote_date,
				CASE
        			WHEN member_type = 1 THEN '訂閱'
			        WHEN member_type = 3 THEN 'AppleStore'
			        WHEN member_type = 4 THEN 'GooglePlay'
			        WHEN member_type = 5 THEN '展延券'
			        WHEN member_type = 6 THEN '團體戶'
				       WHEN member_type = 16 THEN '會員'
		        END AS member_type from `campaign_20240522_news_vote`
		        where member_type not in(0, 15) order by modify_at;

//type 0, 1, l6 各有幾個 quiz 題目，每個題目各有多少對、錯跟各自的cta 數量
select member_type, quiz,
SUM(CASE WHEN answer = 1 THEN 1 ELSE 0 END) AS correct,
SUM(CASE WHEN answer = 2 THEN 1 ELSE 0 END) AS incorrect,
SUM(CASE WHEN answer = 1 and cta = 1 THEN 1 ELSE 0 END) AS correct_cta,
SUM(CASE WHEN answer = 2 and cta = 1 THEN 1 ELSE 0 END) AS incorrect_cta
from campaign_20240716_intellectual_property
where status=1 and member_type in (0, 1, 16)
group by member_type, quiz;
