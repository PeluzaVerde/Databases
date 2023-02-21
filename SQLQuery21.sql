use [test]
go


create Table Artists(
	idA int Primary key Identity(1,1),
	firstname varchar(100),
	lastname varchar(100),
	debut date
)

create Table Users(
	idU int Primary key Identity(1,1),
	username varchar(100) unique,
	email varchar(100) unique,
	dob date
)

create Table Songs(
	idS int Primary key Identity(1,1),
	title varchar(100),
	duration int,
	genre varchar(100),
	idA int references Artists(idA)
)


create Table Playlists(
	idP int Primary key Identity(1,1),
	username varchar(100),
	doc date,
	toc time,
	idU int references Users(idU)
)

create Table PlaylistSongs(
	idP int references Playlists(idP),
	idS int references Songs(idS),
	Primary Key(idP,idS)

)

create Table PlayLogs(
	idU int references Users(idU),
	idS int references Songs(idS),
	dopl date,
	topl time
)


insert into Artists(firstname,lastname,debut)
values
	('A1','AL1','1999-12-12'),('A2','AL2','1999-2-12'),('A3','AL1','1994-12-16')


	
insert into Users(username,email,dob) 
values
	('Varga','Chiense@gmail.com','1999-12-12'),('U2','E2','1999-2-24'),('U3','E3','2001-6-15')


	
insert into Songs(title,duration,genre,idA) 
values
	('T1',30,'pop',1),('T2',60,'pop',2),('T3',30,'pop',3),('T4',20,'jazz',1),('T5',30,'rock',1),
	('T6',70,'electronic',1),('T7',80,'jazz',2),('chisinaurocknroll',40,'rock',3)

insert into Playlists(username,doc,toc,idU) 
values
	('P1','1999-12-12','12:29',1),('P2','1999-12-13','09:29',1),('P3','2009-12-12','12:39',2)
	
insert into PlaylistSongs(idP,idS) 
values
	(1,1),(1,2),(1,3),(2,1),(3,2)

	
insert into PlayLogs(idU,idS,dopl,topl) 
values
	(1,1,'2009-12-12','09:29'),(1,2,'2009-12-12','09:31'),(1,3,'2009-12-12','09:40'),(2,4,'2009-12-12','09:50'),(2,5,'2009-12-12','19:40'),
	(1,1,'2023-01-12','09:29'),(1,2,'2023-01-12','09:31'),(1,3,'2023-01-12','09:40'),(2,4,'2023-01-12','09:50'),(2,5,'2023-01-12','19:40'),
	(3,1,'2023-01-12','09:29')


	go
create or alter procedure nume1(@idU int, @idS int)
as begin
	
	--declare @dateid datetime = GETDATE()


		insert into PlayLogs(idU,idS,dopl,topl)
		values
			(@idU,@idS,'2023-1-18','7:13')
			
	end

go


go
create or alter view nume2
as
	select top(3) P.idS
	from PlayLogs P 
	where  P.dopl in ('2023-01') order by P.idS

	--where W.idW in (select idW from WomenShoes group by idW,number having number >=2)


go
select * from nume2
go

create or alter function nume3(@x int, @y varchar(100))
returns table as
return 
	select *
	from Playlists p000
	where( select count(s.idP)	
			from PlaylistSongs s 
			where( select count(g.genre) from Songs g
			where g.genre=@y ) where s.idS=g.Ids ) = @x

go

	




