

create view uv_buyTbl
as
	select num, prodName, groupName from buyTbl where groupName = '����';
go


select * from uv_buyTbl;
insert into uv_buyTbl values ('KKH','��Ÿ','�Ǳ�',4000,1);

begin tran -- Ʈ�����

delete from uv_buyTbl;

rollback; -- ������ ����