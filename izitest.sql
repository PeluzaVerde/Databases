use [Cake]
go

create Table Chefs(
	idC int Primary key Identity(1,1),
	gender varchar(100),
	dob date
)

create Table CakeTypes(
	idCT int Primary key Identity(1,1),
	name varchar(100),
	description varchar(100)
)

create Table Cakes(
	idC int Primary key Identity(1,1),
	name varchar(100),
	shape varchar(100),
	weight float,
	price float,
	idCT int references CakeTypes(idCT)
)

Create table Specialization(
	idC int references Chefs(idC),
	idCake int references Cakes(idC),
	Primary Key(idC,idCake)
)

Create table Orders(
	idO int primary key identity(1,1),
	orderdate date

)

Create table OrderCakes(
	idC int references Cakes(idC),
	number int,
	idO int references Orders(idO),
	Primary Key(idC,idO)
)



insert into Chefs(gender,dob) 
values
	('male','1999-12-12'),('female','1999-2-12'),('male','1994-12-16')


	
insert into CakeTypes(name,description) 
values
	('Varga','Chiense'),('Dani','1999-2'),('fasfa','192')


	
insert into Cakes(name,shape,weight,price,idCT) 
values
	('male','bota',12.4,15,1),('america','butoi',136,10,1),('ababab','a;ababonma',12.4,15,2)

insert into Specialization(idC,idCake) 
values
	(1,1),(1,2),(1,3),(2,1),(3,3)
	
insert into Orders(orderdate) 
values
	('2001-12-12'),('2002-6-12'),('2002-6-15')

	
insert into OrderCakes(idC,number,idO) 
values
	(1,12,1),(1,13,2),(1,10,3),(2,5,1),(3,2,3)


create or alter procedure nume1(@id int,@name varchar(100),@p int)
as begin
	declare @cakeid int
	set @cakeid = (select Cakes.idC from Cakes where @name=Cakes.name)
	if exists (select idC,idO from OrderCakes where idO=@id and idC=@cakeid)
		update OrderCakes
		set number=@p
		where idO=@id and idC=@cakeid


	else
		insert into OrderCakes(idC,number,idO)
		values
			(@cakeid,@p,@id)
			
	end


create or alter function nume2()
returns table as
return
	select *
	from Chefs c
	where( select count(s.idC)	
			from Specialization s 
			where s.idC=c.idC  ) = (select count(Cakes.idC) From Cakes)


select * from nume2()


go
create or alter view nume2
as
	select W.name 
	from Women W
	where W.idW in (select idW from WomenShoes group by idW,number having number >=2)


go


