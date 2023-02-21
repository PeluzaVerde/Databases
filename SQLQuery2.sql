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
use [Simulacrum]
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
CREATE or alter PROCEDURE ceface 
	
	 @route varchar(100),
	 @station varchar(100),
	 @arrivaltime time,
	 @departuretime time
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @idStation int = (select idS from Stations where name = @station)
	declare @idroute int = (select idR from Routes where name = @route)

	if @idStation is not NULL and @idroute is not null
		if not EXISTS (Select * from RoutesStations where idR = @idroute and ids= @idStation)
			insert into RoutesStations (IdR,idS, arrivaltime, departuretime)
			Values(@idroute, @idStation, @arrivaltime,@departuretime)
		else
			update RoutesStations
			set arrivaltime = @arrivaltime, departuretime=@departuretime
			where idR = @idroute and ids = @idStation
	else
		print('error')
END
GO
