USE [Lab1]

Select Purchase.id, Manga.Title, Client.name from((Purchase INNER JOIN Client on Purchase.client_id = Client.id) INNER JOIN Manga on Purchase.manga_id = Manga.ID);
Select Top 3 Rating.rating from Rating
Order by Rating.rating DESC;

Select Manga.Title, Rating.rating, Author.name from(( Rating
LEFT JOIN Manga on
Manga.ID = Rating.manga_id) LEFT JOIN Author on
Author.manga_id = Manga.ID)
ORDER BY Rating.rating;

Select Manga.Title, Rating.rating, Author.name from(( Rating
Right JOIN Manga on
Manga.ID = Rating.manga_id) RIght JOIN Author on
Author.manga_id = Manga.ID)
ORDER BY Rating.rating;

Select Client.name, Purchase.id from Client
FULL OUTER JOIN Purchase on
Client.id =Purchase.client_id
Order By Client.name;




Select Sum(Pages) from Manga
where Manga.ID in( Select manga_id from Best_selling_manga 
Where Manga.ID in  (Select Manga.ID from Top_Characters));

Select avg(Pages) from Manga
where Manga.ID not in( Select manga_id from Best_selling_manga 
Where Manga.ID  in  (Select Manga.ID from Top_Characters));


