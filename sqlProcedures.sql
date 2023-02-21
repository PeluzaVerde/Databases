use [Lab1]
GO

CREATE PROCEDURE CreateViolentMangaTable
AS
Create TABLE ViolentManga(
id int NOT NULL,
manga_id int NOT NULL,
violenceLevel varchar(30),
genre varchar(30) DEFAULT 'Fighting',
manga_name varchar(30)
PRIMARY KEY(id)
FOREIGN KEY(manga_id)
	REFERENCES Manga(ID)
)
GO

Create procedure ChangeVLType
as
alter table ViolentManga
alter column violenceLevel int;
GO

Create procedure RevertVLType
as
alter table ViolentManga
alter column violenceLevel varchar(30);
GO

Create procedure AddAuthorId
as
alter table ViolentManga
add author_id int NOT NULL;
GO

Create procedure AddAuthorIdForeign
as
alter table ViolentManga
add constraint foreingid FOREIGN KEY(author_id)
	REFERENCES Author(id)
go

Create procedure RemoveAuthorId
as
alter table ViolentManga
drop column author_id;
GO

Create procedure RemoveAuthorIdForeign
as
alter table ViolentManga
drop constraint foreingid;
GO

create procedure addPrimaryName
as
alter table ViolentManga
add constraint name_and_id Primary Key(manga_id,id)
go



create procedure removePrimaryName
as
alter table ViolentManga
drop constraint name_and_id;
go

create procedure removeViolence
as
drop table ViolentManga
GO

create procedure addCandidateKey
as
alter table ViolentManga
add Constraint candidatekey unique(manga_id,manga_name);
go

create procedure removeCandidateKey
as
alter table ViolentManga
drop Constraint candidatekey;
go