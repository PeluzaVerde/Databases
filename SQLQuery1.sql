use [Simulacrum]
GO

IF OBJECT_Id('RoutesStations','U') is NOT NULL
drop table RoutesStations


IF OBJECT_Id('Stations','U') is NOT NULL
drop table Stations

IF OBJECT_Id('Routes','U') is NOT NULL
drop table Routes

IF OBJECT_Id('Trains','U') is NOT NULL
drop table Trains

IF OBJECT_Id('TrainTypes','U') is NOT NULL
drop table TrainTypes












create table TrainTypes (
	idTT INT Primary Key Identity(1,1),
	name Varchar(100),
	description VARCHAR(200)
)

create table trains(
idT INT PRIMARY KEY Identity(1,1),
name Varchar(100),
idTT int references TrainTypes(idTT)
)

create table Routes(
idR INT PRIMARY key Identity(1,1),
name varchar(100) unique,
idTrain int references Trains(idT),
)

create table Stations(
ids INT PRIMARY key Identity(1,1),
name varchar(100) unique,
)

create table RoutesStations(
idR int references Routes(idr),
idS int references stations(ids),
arrivalTime Time,
DepartureTime time,
Primary Key(IDR,IDS)
)



insert into TrainTypes(name, description) Values ('type1', 'desc1'),('type1','desc2')
 Insert  into TrainTypes (name, description) VALUES ('typel', 'desc1'), ('type2','desc2')
Insert into Trains(name, idTT) VALUES ('train1',  1), ('train2', 2),
('train3', 1)
Insert into Routes (name, idTrain) VALUES ('r1', 1), ('r2', 2), ('n3', 3) insert into Stations (name) values ('s1'), ('s2'), ('s3')
insert into RoutesStations(idR, idS, arrivalTime, departureTime) VALUES
(1, 1,
'9:00am'
,'9:10am'),
(1, 2,
'9:15am',
'9:30am'),
(1, 3,
'10:00am',
'10:10am'),
(2, 1,
'9:00pm',
'9:10pm'),
(2, 3,
'5:00am',
'5:20am'),
(3, 2,
'7:00pm'
,'7:10pm') 

exec ceface 'r1','s1','4:00pm', '4:10pm'
GO
----43333 lmao

create or alter view view_1 as
	select R.name
	from Routes R 
	inner join RoutesStations rs on R.idR on R.idr = rs.idr inner join stations s on
	Rs.ids = s.ids
	group by idr
	having count(*) = (select count(*) from stations)

	


go
create or alter view view_2 as
	select R.name
	from Routes R 
	where
	R.idR in
	(
	select idR from RoutesStations group by idR
	having count(*) = (select count(*) from Stations)
	)



go



create or alter view view_3 as

	Select R.name from Routes R
	where not exists( 
	select S.idS
	from Stations S
	except
	select RS.idS from RoutesStations RS
	where RS.idR = R.idR
	)


	
go


create or alter function ufListStationsNameWithROutes(@R Int)
returns table as
return
	select s.name
	from Stations s
	where s.ids in (
		select Rs.idS
		from RoutesStations Rs
		group by Rs.idS
		having count(*)> @R
		)

select * from ufListStationsNameWithROutes(2)


go

