--����� ���� ���� �Լ�
 create or alter function ufn_getLevel
 (@levels char(1))
 returns nvarchar(10)
 as
 begin
	declare @result nvarchar(10); -- gold,silve,bronze,iron ȸ�� �� ����
	
	set @result =	case @levels
						when 'A' then 'GOLD'
						when 'B' then 'SILVER'
						when 'C' then 'BRONZE'
						when 'D' then 'IRON'
						when 'S' then 'ADMINISTER'
						else '��ȸ��'
					end;
		return @result;
end
go

