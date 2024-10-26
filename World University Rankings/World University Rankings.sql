-- 1. Data Setup

Create database World_University_Rankings_Analysis;

use world_university_Rankings_Analysis;

-- import table
select * from world_university_rankings;

/* 
2. Data Exploration Using SQL
Explore the structure of the dataset using basic SQL queries 
(e.g., SELECT, COUNT(), GROUP BY, etc.).
*/

-- To View the data Structure
describe world_university_rankings;

-- To Check the total number of records
select count(*) from world_university_rankings;

-- 3. Analysis Questions

-- i. Top 10 Universities by Overall Score

create view Top10_University_overall as
select university,overall from world_university_rankings
order by overall desc limit 10;
select * from Top10_University_overall;

-- ii. Top 10 Countries by Research Performance

create view Top10_Country_Research as 
select Country, avg(Research) as Average_Research_Score from world_university_rankings
group by country
order by Average_Research_Score desc
limit 10;

select * from Top10_country_research;

-- iii. Impact of International Outlook on Rankings
create view Impact_International_Outlook_Ranking as
select `rank`,university,`international outlook` from world_university_rankings
where `international outlook` >90;

select * from Impact_International_Outlook_Ranking;

-- iv To Check the University with the Highest rank based on Teaching

select `rank`,university,teaching from world_university_rankings
order by teaching desc
limit 1;
 
 -- OR
create view University_Max_Teaching as
select university,max(teaching) from world_university_rankings
group by university
order by max(teaching) desc
limit 1;

select * from university_Max_Teaching;

-- v. Correlation Between Industry Income and Rankings(i.e mutual relationship between Industry Income & Rankings)
create view Correlation_Industry_Rankings as
select `rank`,university,`industry income` from world_university_rankings
where `industry income` > 90;

select * from Correlation_Industry_Rankings ;

-- 4. Conclusion and Insights

/* 
* Top Universities by Overall Score
The top universities based on overall performance reveal a global representation, 
with institutions from the United Arab Emirates, Hong Kong, and the United Kingdom 
occupying prominent positions. This highlights how non-western Countries are dominating 
the University global ranking.

Top Countries by Research Performance
The United States dominates in research performance, followed by United Kingdom and China. 
This reflects the extensive research output and investment in higher education in these countries.
The presence of Japan, Germany and other nations make the Top 10 which shows the glocal competitiveness
across these continents.

Impact of International Outlook on Rankings
A university's international outlook, encompassing factors such as international staff and collaborations,
plays an influential but not exclusive role in its global ranking. This suggest that international engagement
is important but must be supported by academic excellence for a high rank.

Top University Based on Teaching Impact
The University of Oxford emerges as the top university for teaching quality. 
Oxford commitment to high-quality education is consistent with its overall reputation and leading role 
in global higher education, particularly in the United Kingdom.


 Correlation Between Industry Income and Rankings

Insight: There is a positive relationship between industry income and university rankings.
Universities that maintain strong industry partnerships and generate substantial income 
from these collaborations generally achieve higher overall scores and rank more favorably.

Trend: This suggests that partnering with industry offers more than just financial advantages; 
it also strengthens the practical and innovative dimensions of university education and research. 
These collaborations often result in cutting-edge research opportunities, project funding, and improved 
career prospects for graduates.

Summary
The SQL analysis shows that leading universities are primarily situated in countries with substantial investment
in education and research. A diverse international presence and robust industry partnerships also contribute to higher
rankings. These findings highlight that academic excellence is driven by a blend of research strength, global involvement,
and collaboration with industry.
*/