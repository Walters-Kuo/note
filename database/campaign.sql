select v.account, v.news_id, date(v.modify_at) vote_date,
				CASE
        			WHEN member_type = 1 THEN '訂閱'
			        WHEN member_type = 3 THEN 'AppleStore'
			        WHEN member_type = 4 THEN 'GooglePlay'
			        WHEN member_type = 5 THEN '展延券'
			        WHEN member_type = 6 THEN '團體戶'
				       WHEN member_type = 16 THEN '會員'
		        END AS member_type,
		         IF(m.CREATEDATE BETWEEN '2024-05-22 00:00:00' AND '2024-06-05 00:00:00', 'news', '') AS new_member,
		         m.CREATEDATE as register_date
from `campaign_20240522_news_vote` v
LEFT JOIN MEMBER_DATA m
ON v.account = m.ACCOUNT
where v.member_type not in(0, 15) and v.account NOT LIKE 'udn%'
order by v.modify_at, m.CREATEDATE
