use sqlDB;
go

select * from bankBook;



begin try
	begin tran
		update bankBook set uMoney = uMoney - 600 where uName = '구매자';
		update bankBook set uMoney = uMoney + 600 where uName = '판매자';
	commit tran
end try
begin catch
	rollback tran
end catch