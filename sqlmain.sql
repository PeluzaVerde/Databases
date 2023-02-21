use [Lab1]
go 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


alter PROCEDURE [dbo].[sqlmain]
	-- Add the parameters for the stored procedure here
	@newVersion int
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @currentVersion INT
	SET @currentVersion = (SELECT ver FROM versionManager)

	if ISNUMERIC(@newVersion) != 1
	BEGIN
		print('Not a number')
		return 1 
	END
	
	if @newVersion < 0 or @newVersion > 5
	BEGIN
		print('Invalid number')
		return 2 
	END

	while @currentVersion < @newVersion
	begin
		
		 if (@currentVersion=0)
		 exec CreateViolentMangaTable;
		 if (@currentVersion=1)
		 exec ChangeVLType
		 if (@currentVersion=2)
		 begin
		 exec AddAuthorId
		 exec AddAuthorIdForeign;
		 end
		 if (@currentVersion=3)
		 exec addPrimaryName
		 if (@currentVersion=4)
		 exec addCandidateKey
		SET @currentVersion = @currentVersion + 1
		
	end

	while @currentVersion > @newVersion
	begin
		if (@currentVersion=1)
		 exec removeViolence;
		 if (@currentVersion=2)
		 exec RevertVLType
		 if (@currentVersion=3)
		 begin
		 exec RemoveAuthorIdForeign
		 exec RemoveAuthorId
		 end
		 if (@currentVersion=4)
		 exec removePrimaryName
		 if (@currentVersion=5)
		 exec removeCandidateKey

		SET @currentVersion = @currentVersion - 1
		
	end

	truncate table versionManager
	insert into versionManager values(@newVersion)
END