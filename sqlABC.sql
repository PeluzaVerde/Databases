USE [Lab1]
SELECT name FROM Artist
UNION ALL
SELECT name FROM Top_Characters
ORDER BY name;

Select * from manga
where Pages<800 OR Pages>2000;

Select name from Artist
INTERSECT
select name from Author;

Select * from Client
where id  in (select client_id from Membership);

Select * from Author
where name not in (select name from Artist);

Select id from Client
except
select client_id from Membership;