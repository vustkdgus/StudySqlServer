use sqlDB;
go

declare cur_usertbl cursor global
	for select userName, height from userTbl;

open cur_usertbl;

declare @userName nchar(8); -- ȸ���̸�
declare @height smallint; -- ȸ���� Ű���  ����
declare @cnt int = 0; -- ȸ����(���� ���� ��)
declare @totalheight int = 0;

fetch next from cur_usertbl into @userName, @height; -- Ŀ������ �о @height ������ �Ҵ�

-- �ݺ��� ����
while @@FETCH_STATUS = 0
begin
	set @cnt +=1;
	set @totalheight += @height;
	print concat('ȸ�� : ', @username, 'Ű : ', @height);
	fetch next from cur_usertbl into @userName, @height;
end
print @totalheight;
print @cnt;
print concat('ȸ�� Ű ��� => ', @totalheight / @cnt);

close cur_usertbl;
deallocate cur_usertbl;