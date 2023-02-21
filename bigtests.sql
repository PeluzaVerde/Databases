use [Lab1]
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE or alter PROCEDURE [dbo].[bigTest]
@nb_of_rows int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	if ISNUMERIC(@nb_of_rows)!=1
	begin
	print('not a number')
	return 1
	end

	declare @all_start_time datetime
	
	declare @all_start_time2 datetime
	
	declare @all_start_time3 datetime
	

	declare @manga_insert_start datetime
	declare @manga_insert_end datetime
	declare @manga_delete_start datetime
	declare @manga_delete_end datetime

	declare @artist_insert_start datetime
	declare @artist_insert_end datetime
	declare @artist_delete_start datetime
	declare @artist_delete_end datetime

	declare @top_chara_insert_start datetime
	declare @top_chara_insert_end datetime
	declare @top_chara_delete_start datetime
	declare @top_chara_delete_end datetime

	
	declare @view_time_1_start datetime
	declare @view_time_1_end datetime
	declare @view_time_2_start datetime
	declare @view_time_2_end datetime
	declare @view_time_3_start datetime
	declare @view_time_3_end datetime


	
	set @all_start_time= GETDATE();
	execute delete_rows @nb_of_rows, 'Manga'
			set @manga_insert_start= GETDATE();
	execute insert_rows @nb_of_rows, 'Manga'
	set @manga_insert_end=GETDATE();

	set @view_time_1_start = GETDATE();
	execute selectview 'View_1'
	set @view_time_1_end =GETDATE();

	
	
	insert into TestRuns(Description,StartAt,EndAt) values ('TestRun of test1', @all_start_time, @view_time_1_end)
	declare @testrunid int
	set @testrunid = (select max(TestRunID) from TestRuns)
	declare @testtableid int
	set @testtableid = (select TableID from Tables where Name='Manga')
	insert into TestRunTables(TestRunID,TableID,StartAt,EndAt) values (@testrunid, @testtableid, @manga_insert_start, @manga_insert_end)
	insert into TestRunViews(TestRunID,ViewID, StartAt,EndAt) values (@testrunid, 1, @view_time_1_start, @view_time_1_end)




	execute insert_rows @nb_of_rows, 'Author'

	set @all_start_time2= GETDATE();



	execute delete_rows @nb_of_rows, 'Top_Characters'
	set @top_chara_insert_start = GETDATE();
		execute insert_rows @nb_of_rows, 'Top_Characters'
	set @top_chara_insert_end=GETDATE();
	
		set @view_time_2_start = GETDATE();
	execute selectview 'View_2'
	set @view_time_2_end =GETDATE();

		insert into TestRuns(Description,StartAt,EndAt) values ('TestRun of test2', @all_start_time2, @view_time_2_end)
	--declare @testrunid int
	set @testrunid = (select max(TestRunID) from TestRuns)
	--declare @testtableid int
	set @testtableid = (select TableID from Tables where Name='Top_Characters')
	insert into TestRunTables(TestRunID,TableID,StartAt,EndAt) values (@testrunid, @testtableid, @top_chara_insert_start, @top_chara_insert_end)
	insert into TestRunViews(TestRunID,ViewID, StartAt,EndAt) values (@testrunid, 2, @view_time_2_start, @view_time_2_end)

	
	set @all_start_time3= GETDATE();

		execute delete_rows @nb_of_rows, 'Artist'
	set @artist_insert_start=GETDATE();
	execute insert_rows @nb_of_rows, 'Artist'
	set @artist_insert_end=GETDATE();
		set @view_time_3_start = GETDATE();
	execute selectview 'View_3'
	set @view_time_3_end =GETDATE();


			insert into TestRuns(Description,StartAt,EndAt) values ('TestRun of test3', @all_start_time3, @view_time_3_end)
	--declare @testrunid int
	set @testrunid = (select max(TestRunID) from TestRuns)
	--declare @testtableid int
	set @testtableid = (select TableID from Tables where Name='Artist')
	insert into TestRunTables(TestRunID,TableID,StartAt,EndAt) values (@testrunid, @testtableid, @artist_insert_start, @artist_insert_end)
	insert into TestRunViews(TestRunID,ViewID, StartAt,EndAt) values (@testrunid, 3, @view_time_3_start, @view_time_3_end)


	
	




END
GO
