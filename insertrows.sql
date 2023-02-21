use [Lab1]
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE or alter PROCEDURE [dbo].[insert_rows]
	-- Add the parameters for the stored procedure here
	@nb_of_rows INT,
	@table_name varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	declare @table varchar(100)
	set @table =('['+@table_name+']')

	if ISNUMERIC(@nb_of_rows)!=1
	begin
		print('the number of rows has to be a number')
		return 1
	end


declare @counter int
	set @counter = 1

	declare @Title varchar(50)
	declare @Pages int
	declare @Revenue int
	declare @Release int
	--declare @big_id int
	
	set @Title = 'TestTitle'

	
	declare @Artist_name varchar(50)
	declare @manga_id_artist int

	
	

	declare @Chara_name varchar(50)
	declare @manga_id_chara int
	set @Chara_name = 'Test character'
	

	while @counter <= @nb_of_rows
	begin
		if @table_name = 'Artist'
		begin
		--set @big_id = (select MAX(id) from Artist) +1
		--if @big_id=NULL
		--begin
		--set @big_id=1
		--end	
			set @Artist_name = 'Test Artist' + convert(varchar(4), (@counter))
			insert into Artist (id, manga_id, name) values (@counter, @counter, @Artist_name)
		end


		if @table_name = 'Author'
		begin
		--set @big_id = (select MAX(id) from Artist) +1
		--if @big_id=NULL
		--begin
		--set @big_id=1
		--end	
			set @Artist_name = 'Test Author' + convert(varchar(4), (@counter))
			insert into Author(id, manga_id, name, Age) values (@counter, @counter, @Artist_name, @counter)
		end
		
		if @table_name = 'Manga'
		begin	
			set @Title = 'TestTitle'  + convert(varchar(4), (@counter))
			set @Pages=100 + @counter
			set @Revenue=300 +@counter
			set @Release=2000+@counter
			--set @big_id = (select MAX(id) from Manga) +1
				

			insert into Manga(ID, Title, Pages, Revenue, Release) values (@counter, @Title, @Pages, @Revenue, @Release)
		end
		if @table_name = 'Top_Characters'
		begin
		--set @big_id = (select MAX(id) from Top_Characters) +1
		--		if @big_id=NULL
		--begin
		--set @big_id=1
		--end
			set @Chara_name = 'Test character'  + convert(varchar(4), (@counter))
			insert into Top_Characters (id, manga_id, name) values (@counter, @counter, @Chara_name)
		end

		set @counter = @counter + 1
	end

    -- Insert statements for procedure here

END
GO
