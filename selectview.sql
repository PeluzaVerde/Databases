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
CREATE or alter PROCEDURE [dbo].[selectview]
	-- Add the parameters for the stored procedure here
	@view_name varchar(30)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if @view_name = 'View_1'
	begin 
		select * from View_1
	end

	if @view_name = 'View_2'
	begin
		select * from View_2
	end

	if @view_name = 'View_3'
	begin
		select * from View_3
	end

    -- Insert statements for procedure here
END
GO
