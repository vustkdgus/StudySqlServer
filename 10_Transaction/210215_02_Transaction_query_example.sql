use sqlDB;
go

select * from bankBook;



begin try
	begin tran
		update bankBook set uMoney = uMoney - 600 where uName = '������';
		update bankBook set uMoney = uMoney + 600 where uName = '�Ǹ���';
	commit tran
end try
begin catch
	rollback tran
end catch