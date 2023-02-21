
USE [Lab1]

Select Title,Revenue
FROM Manga
Group BY Title,Revenue
Having AVG(Revenue) > 300*(Select MAX(Age) from Author);

Select Count(client_id)as "Manga bought at least 5 times",manga_id  
FROM Purchase
Group BY manga_id 
Having Count(client_id) >0 ;



Select name,Age  
FROM Author
Group BY name,Age 
Having (AVG(Age)-20) < (2022-(select AVG(Release) from Manga))  ; /*Avg age = 41 2022-avg release = 18.
Which Manga on average existed 2 decades ago*/

select * FROM Manga;
select * FROM Purchase;


