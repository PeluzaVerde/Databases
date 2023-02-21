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
CREATE or alter PROCEDURE [dbo].[delete_rows]
	-- Add the parameters for the stored procedure here
	@nb_of_rows INT,
	@table_name varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if ISNUMERIC(@nb_of_rows)!=1
	begin
		print('the number of rows has to be a number')
		return 1
	end

	declare @last_row int
	if @table_name ='Manga'
	begin
	set @last_row = (select MAX(ID) from Manga) - @nb_of_rows

			delete from Top_Characters
			delete from Artist

			delete from Manga
			--where ID > @last_row

	end


		if @table_name ='Artist'
	begin
	set @last_row = (select MAX(id) from Artist) - @nb_of_rows

			delete from Artist
			--where id > @last_row

	end


		if @table_name ='Top_Characters'
	begin
	set @last_row = (select MAX(id) from Top_Characters) - @nb_of_rows

			delete from Top_Characters
			--where id > @last_row

	end

    -- Insert statements for procedure here

END
GO
