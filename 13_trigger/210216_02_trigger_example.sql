use sqlDB;
go

create or alter trigger trg_testtbl
on testtbl
after insert, delete, update -- ����, �����Ҷ� Ʈ���� �߻�
as
	print '��Ʈ���� �߻�';

insert into testTBL values ('BTS');
select * from testTBL where txt = '������';
update testTBL set txt = '��������!' where id = 4;
delete testTBL where id = 3;

select * from testTBL where id = 4;