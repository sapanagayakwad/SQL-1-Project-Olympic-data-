-- SQL PROJECT
create database project1;

use project1;

show tables;

select * from olympic;

-- 1. Show how many medal counts present for entire data

select medal,count(*) as medal_count from olympic
group by medal;


-- 2. Show count of unique sports present in Olympics

 select count(distinct(sport)) from olympic;

-- 3. Show how many different medals won by team India

select Team,medal,count(*) from olympic
where team="India" and Medal!="NoMedal"
group by Team,Medal;

-- 4. Show event wise medals won by India show from highest to lowest medals won in order

select Team,Event,Medal,count(Medal) as Medal_count from olympic
where (Team = 'India' and medal != 'NoMedal')
group by Event,Medal
order by Medal_count desc;


-- 5. Show event wise medals won by India in order of year

select Team,Event,Year,Medal ,count(medal) as count_medal from olympic
where( Team = "India" and Medal != "NoMedal")
group by Event,Medal,year
order by year;

select Team,Event,Medal,year,count(Medal) as Medal_count from olympic
where (Team = 'India' and medal != 'NoMedal')
group by Event,Medal,year
order by Year ;


-- 6. show country who won maximum medals.

select Team,count(medal) from olympic
where Medal!= 'NoMedal'
group by Team
order by count(medal)desc
limit 1;


-- 7.show top 10 countries whowon gold

select Team,count(medal) as count_medal from olympic
where Medal!='NoMedal'
group by Team
order by Count_medal desc
limit 10;


--  8. show in which year did United states won most gold medal

select Team ,year,Medal,Count(medal) from olympic
where (medal='Gold' and Team = 'United States' )
group by Year,medal
order by count(medal) desc
limit 1;

Select Team,Count(Medal),Year from olympic
where (medal<>"NoMedal" and Team = 'United States')
Group by Year
order by count(Medal) desc
limit 1;



-- 9. In which sports United States has most medals.

Select Team, Count(Medal) as MedalCount, Sport from olympic
where (Team = 'United States' and Medal<>'NoMedal')
group by Sport
order by MedalCount desc
limit 1;

Select Team, Count(Medal) as MedalCount, Sport from olympic
where (Team = 'United States' and Medal<>'NoMedal')
group by Sport
order by MedalCount desc
limit 1;

-- 10. Find top three players who won most medals along with their sports and country

Select Name as Players,Sport,Team,Count(Medal) as count_medal from olympic
where (medal<>"NoMedal" )
Group by Team,Sport, Players
order by count(Medal) desc
limit 3;

select * from olympic;



-- 11. Find player with most gold medals in cycling along with his country.
Select Team,Name as Players,Sport,Count(Medal) as count_medal from olympic
where ( Medal= "Gold" and Sport="cycling")
group by Team ,Players, Sport 
order by count(Medal) desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.

Select Team,Name,Sport, count(Medal) from olympic
Where sport = 'Basketball' and Medal<>'NoMedal'
Group by Name,Team,Sport
order by count(Medal) desc
limit 7;
-- 13. Find out the count of different medals of the top basketball player Teresa Edwards

Select Name, Medal,count(Medal) as MedalCount from olympic
where Name = 'Teresa Edwards' and Medal<>'NoMedal'
group by Medal
order by MedalCount desc;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel

Select Year,Sex,Count(Medal) As MedalCount from olympic
Where medal<>'NoMedal'
Group by Sex,Year
order by Year asc;
