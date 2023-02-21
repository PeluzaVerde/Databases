USE [Lab1]
Select Artist.name
from Artist
	where EXISTS(Select Author.name from Author where
Artist.manga_id=Author.manga_id AND Artist.name=Author.name);


Select Client.name from Client
where EXISTS( Select Membership.client_id from Membership where Membership.client_id=CLient.id);


select Title from(Select Manga.Title from Manga)ID;

select manga_id,best_bought_manga 
FROM(select count(manga_id) AS best_bought_manga ,manga_id 
FROM Purchase Group by manga_id) As exe
Order By best_bought_manga ;

select client_id,How_many_unique_purchases 
FROM(select count(DISTINCT manga_id) AS "How_many_unique_purchases",client_id 
FROM Purchase Group by client_id) As exe2
Order By How_many_unique_purchases;
/*g???????
select* from Artist;
select * from Author; 

*/



/* H*/


Select* from Purchase;
/*
Select Min(client_id),manga_id
FROM Purchase
Group BY manga_id
Having Max(client_id) =4;*/


Select Count(client_id),manga_id
FROM Purchase
Group BY manga_id
Having Count(client_id) >1;
/*
select rating, manga_id
From Rating
Group by Rating
Having(select manga_id from Man	ga);*/