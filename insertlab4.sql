use [Lab1];

--tests config
insert into Tables(Name) values
('Manga'),
('Artist'),
('Top_characters')




insert into Tests( Name) values 
('test1'),
('test2'),
('test3');

Go
create or alter view [View_1] as
	select * from Manga
	Go


create or alter view [View_2] as
	select Manga.Title, Manga.Release, Author.name from Author 
	inner join Manga on Author.manga_id=Manga.ID
	Go

create or alter view  [View_3] as

	select count (Manga.Title)as "Number of projects",Age,name  from Author
	inner join Manga on 
	Author.manga_id=Manga.ID
	group by Age,name
	go

insert into Views(Name) values
('View_1'),
('View_2'),
('View_3')

SELECT * FROM TestTables

--testView
insert into TestViews(TestID, ViewId) values
(1,1),
(2,2),
(3,3)

--testTables
insert into TestTables(TestID, TableID, NoOfRows,Position) values
(1, 1, 500,1),
(1, 2, 500, 5),
(1, 3, 500, 4),
(2, 1, 500, 3),
(2, 2, 500, 2),
(2, 3, 600, 1),
(3, 1, 500, 5),
(3, 2, 500, 4),
(3, 3, 500, 3)