USE [Lab1]



SELECT Title
FROM Manga
WHERE ID = ANY
  (SELECT manga_id
  FROM Rating
  WHERE rating > 7.50);
  
SELECT name
FROM Author
WHERE manga_id = ANY
  (SELECT manga_id
  FROM Rating
  WHERE rating > 7.50);

  SELECT Title
FROM Manga
WHERE ID = ALL
  (SELECT manga_id
  FROM Rating
  WHERE rating > 7.50);


  select * from Rating;
    select * from Author;

  SELECT name
FROM Author
WHERE id = All
  (SELECT id
  FROM Rating
  WHERE rating <0); /* Having trouble understanding this one*/

  select * from Manga;
  select * from Rating;
  SELECT AVG(Pages) as "Average Pages from mangas with over 7.5 score"
FROM Manga
WHERE ID = ANY
  (SELECT manga_id
  FROM Rating
  WHERE rating > 7.5);



    SELECT MIN(Pages)+MAX(Pages)
FROM Manga
WHERE ID = ALL
  (SELECT manga_id
  FROM Rating
  WHERE rating < 2.5);



  SELECT Title
FROM Manga
WHERE ID = ANY
  (SELECT manga_id
  FROM Rating
  WHERE rating in (8.67,7.42,8.05));


    SELECT name
FROM Author
WHERE id = All
  (SELECT id
  FROM Rating
  WHERE rating not in (8.67,7.42,8.05,8.66,7.9));