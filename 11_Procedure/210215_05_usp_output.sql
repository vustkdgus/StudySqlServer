USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:11:55 ******/
create or ALTER procedure usp_users4
	@txtValue nvarchar(20),
	@outValue int output --리턴받는 매개변수(파라미터)
as
	insert into testTBL values (@txtValue);
	select @outValue = IDENT_CURRENT('testTBL'); --testTBL의 현재 identity값 리턴
go
