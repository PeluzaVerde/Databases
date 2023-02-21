USE [Lab1]
UPDATE No_of_exemplares
SET number=1500
where id=1 AND manga_id=1;

Update Client
set name = 'Ilincas'
where id=4;

Update Client
set name = 'Janos'
where id<=1;

/*
INSERT INTO [dbo].[Artist]
           ([id]
           ,[manga_id]
           ,[name])
     VALUES
           (1
           ,8
           ,'Integrity Constraint');
		   */

Update Membership
set client_id=2
where not id=1;

INSERT INTO [dbo].membership
     VALUES(3,3);

	 Delete from membership where
client_id between 3 and 5

Insert into manga
Values(10,'oraoraoraora',5000);
 update manga
 set Pages=4900
 where Pages in(1300, 600, 5000);

 delete from manga where
Title like '%ra%';