use [Lab1]
go
/*
create table Ta (
    aid int primary key,
    a2 int unique,
    x int
)

create table Tb (
    bid int primary key,
    b2 int,
    x int
)

create table Tc (
    cid int primary key,
    aid int references Ta(aid),
    bid int references Tb(bid)
)*/
go

create or alter procedure insertIntoTa(@rows int) as
    declare @max int
    set @max = @rows*2 + 100
    while @rows > 0 begin
        insert into Ta values (@rows, @max, @rows%120)
        set @rows = @rows-1
        set @max = @max-2
    end
	go
create or alter procedure insertIntoTb(@rows int) as
    while @rows > 0 begin
        insert into Tb values (@rows, @rows%870, @rows%140)
        set @rows = @rows-1
    end
	go
create or alter procedure insertIntoTc(@rows int) as
    declare @aid int
    declare @bid int
    while @rows > 0 begin
        set @aid = (select top 1 aid from Ta order by NEWID())
        set @bid = (select top 1 bid from Tb order by NEWID())
        insert into Tc values (@rows, @aid, @bid)
        set @rows = @rows-1
    end

--exec insertIntoTa 9000
--exec insertIntoTb 10000
--exec insertIntoTc 3000

create nonclustered index index1 on Ta(x)
drop index index1 on Ta
    --Clustered
select * from Ta order by aid -- Scan
select * from Ta where aid = 1 --  Seek

--NonClustered
select x from Ta order by x --  Scan
select a2 from Ta where a2 = 1 --  Seek


select x from Ta where a2 = 3000 -- Key Lookup

select * from Tb where b2 = 40 -- Clustered Index Scan to check cost 

create nonclustered index index2 on Tb(b2) include (bid, x)
drop index index2 on Tb

select * from Tb where b2 = 40 -- Nonclustered Index Seek cost
go
create or alter view view1 as
    select top 1000 T1.x, T2.b2
    from Tc T3 join Ta T1 on T3.aid = T1.aid join Tb T2 on T3.bid = T2.bid
    where T2.b2 > 500 and T1.x < 15
	go
select * from view1

