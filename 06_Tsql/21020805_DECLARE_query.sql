use sqlDB;
go

declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(5,2);
declare @myVar4 char(20);

set @myVar1 = 154234521;
set @myVar2 = 32450;
set @myVar3 = 3.14;
set @myVar4 = '���� �̸�==>     ';

select @myVar1;
select @myVar2 + @myVar3;
select @myVar4, userName from userTbl where height > 180;

declare @myVar5 tinyint; -- 255
set @myVar5 = 3;

select top(@myVar5) userName, height from userTbl order by height desc;